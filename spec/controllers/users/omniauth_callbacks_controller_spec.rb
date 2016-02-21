require 'rails_helper'

describe Users::OmniauthCallbacksController, type: :controller do
  include OmniAuthHelper

  before do
    valid_facebook_login
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:facebook]
    request.env['devise.mapping'] = Devise.mappings[:user]
  end

  describe '#complete' do
    context 'when oauth provider is facebook' do
      it 'successfully create a user' do
        expect do
          post 'facebook', valid_facebook_login
        end.to change { User.count }.by(1)
      end

      it 'redirects the user to the subscription page' do
        get 'facebook'
        expect(response).to have_http_status(302)
      end
    end
  end
end
