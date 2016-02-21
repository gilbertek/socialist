module Auth
  # this class is used by the user and omniauth controllers, it controls how
  #  an authentication system interacts with our database and middleware
  class Authenticator
    def after_authenticate(auth_params, resource, resource_class, resource_auth, password_service)
      @auth_params = auth_params
      @resource = resource
      @resource_class = resource_class
      @resource_auth = resource_auth
      @password_service = password_service
    end

    def find_user
      authorization = authorization_service
      if authorization.user.blank?
        authorization.user = find_or_create_resource
        authorization.save
      end

      authorization.user
    end

    private

    # can be used to hook in after the authentication process
    #  to ensure records exist for the provider in the db
    #  this MUST be implemented for authenticators that do not
    #  trust email
    def after_create_account; end

    def find_or_create_resource
      email = @auth_params.info.email
      @resource ||= @resource_class.find_by_email(email)

      @resource = save_user_info unless @resource.present?
      after_create_account
      @resource
    end

    def save_user_info
      @resource = @resource_class.new(user_params)
      @resource.save(validate: false)
      @resource
    end

    def user_params
      date_of_birth = parse_birthday(@auth_params.extra.raw_info.birthday)

      {
        first_name:    @auth_params.info.first_name,
        last_name:     @auth_params.info.last_name,
        email:         @auth_params.info.email,
        password:      @password_service.friendly_token[0, 20],
        date_of_birth: date_of_birth
      }
    end

    def parse_birthday(birthday)
      return nil unless birthday.present?
      format_str = '%m/%d/' + (birthday =~ /\d{4}/ ? '%Y' : '%y')

      begin
        date_of_birth = Date.parse(birthday)
      rescue
        date_of_birth = Date.strptime(birthday, format_str)
      end

      date_of_birth
    end

    def authorization_service
      @resource_auth.find_for_oauth(@auth_params)
    end

    def gravatar
      email = Digest::MD5.hexdigest(@resource.email.downcase)
      "http://gravatar.com/avatar/#{email}.png?"
    end

    def gravatar?
      uri = URI.parse(gravatar + 'd=404')
      http = Net::HTTP.new(uri.host, uri.port)
      request = Net::HTTP::Get.new(uri.request_uri)
      response = http.request(request)

      response.code.to_i != 404
    end
  end
end
