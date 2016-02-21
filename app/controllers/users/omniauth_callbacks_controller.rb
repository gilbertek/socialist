module Users
 class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def complete
      @authenticator = self.class.find_authenticator(params[:action])

      @authenticator.after_authenticate(
        request.env['omniauth.auth'],
        current_user,
        User,
        UserAuthentication,
        Devise
      )

      @user = @authenticator.find_user
      notify_success if @user.persisted?
    end

    private

    def notify_success
      sign_in_and_redirect @user
      set_flash_message(:notice, :success, kind: @authenticator.name.to_s.capitalize)
    end

    # Allow for more than one authenticator
    BUILTIN_AUTH = {
      facebook: Auth::FacebookAuthenticator.new
    }.freeze

    User.omniauth_providers.each do |provider|
      alias_method provider, :complete
    end

    def self.find_authenticator(name)
      key = name.to_sym
      return BUILTIN_AUTH[key] if BUILTIN_AUTH.key? key
    rescue
      Socialist::InvalidAccess.new('provider is not found')
    end
  end
end
