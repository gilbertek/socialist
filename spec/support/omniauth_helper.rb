module OmniAuthHelper
  def valid_facebook_login
    return unless Rails.env.test?
    OmniAuth.config.test_mode = true

    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(facebook_response_data)
  end

  def facebook_response_data
    {
      provider: 'facebook',
      uid: '123545',
      info: {
        first_name: FFaker::Name.first_name,
        last_name:  FFaker::Name.last_name,
        email:      FFaker::Internet.email
      },
      credentials: {
        token: SecureRandom.hex(16),
        expires_at: Time.zone.now + 1.week
      },
      extra: {
        raw_info: {
          image: 'http://graph.facebook.com/10154416/picture'
        }
      }
    }
  end
end
