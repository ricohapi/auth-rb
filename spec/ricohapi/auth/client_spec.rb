require 'spec_helper'

describe RicohAPI::Auth::Client do
  let(:client_id) { SecureRandom.hex(16) }
  let(:client_secret) { SecureRandom.hex(32) }
  let(:client) { RicohAPI::Auth::Client.new(client_id, client_secret) }

  subject { client }

  its(:identifier) { should == client_id }
  its(:secret) { should == client_secret }
  its(:token_endpoint) { should == RicohAPI::Auth::TOKEN_ENDPOINT }

  describe 'api_token_for!' do
    let(:api_scope) { 'https://ucs.ricoh.com/scope/api/udc2' }
    subject do
      mock_request :post, RicohAPI::Auth::TOKEN_ENDPOINT, 'access_token', {
        params: {
          grant_type: 'password',
          username: 'username',
          password: 'password',
          scope: (RicohAPI::Auth::DISCOVERY_RELATED_SCOPES + Array(api_scope)).join(' ')
        }
      } do
        mock_request :get, RicohAPI::Auth::DISCOVERY_ENDPOINT, 'discovery', {
          params: {
            scope: api_scope
          }
        } do
          client.resource_owner_credentials = 'username', 'password'
          client.api_token_for! api_scope
        end
      end
    end

    it { should be_instance_of RicohAPI::Auth::AccessToken }
    its(:access_token) { should == 'access_token' }
    its(:refresh_token) { should == 'refresh_token' }
    its(:scope) { should == api_scope }
    its(:expires_in) { should == 180 }
  end

  describe 'access_token!' do
    subject do
      mock_request :post, RicohAPI::Auth::TOKEN_ENDPOINT, 'access_token', {
        params: {
          grant_type: 'password',
          username: 'username',
          password: 'password'
        }
      } do
        client.resource_owner_credentials = 'username', 'password'
        client.access_token!
      end
    end

    it { should be_instance_of RicohAPI::Auth::AccessToken }
    its(:access_token) { should == 'access_token' }
    its(:refresh_token) { should == 'refresh_token' }
    its(:scope) { should == 'https://ucs.ricoh.com/scope/api/auth https://ucs.ricoh.com/scope/api/discovery https://ucs.ricoh.com/scope/api/udc2' }
    its(:expires_in) { should == 180 }
  end
end
