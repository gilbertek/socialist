module Auth
  class FacebookAuthenticator < Auth::Authenticator
    def name
      'facebook'
    end

    def after_create_account
      update_authentication
      update_profile_picture
    end

    def update_authentication
      authorization = authorization_service
      # Associate the user authentication object with the user if needed
      authorization.update_attributes(
        user_id: @resource.id,
        provider_id: @auth_params.extra.raw_info.id,
        token: @auth_params.credentials.token,
        token_expires_at: Time.zone.at(@auth_params.credentials.expires_at),
        params: @auth_params
      )

      @resource
    end

    def update_profile_picture
      # Generate user avatar if available
      if @auth_params.info.image.present?
        avatar = Avatar.create(
          image_url: @auth_params.info.image,
          avatarable_id: @resource.id,
          avatarable_type: 'User')
        @resource.avatar = avatar
      else
        @resource
      end
    end
  end
end
