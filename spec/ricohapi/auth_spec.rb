require 'spec_helper'

describe RicohAPI::Auth do
  it 'has a version number' do
    RicohAPI::Auth::VERSION.should_not be nil
  end

  it 'knows necessary endponints and scopes' do
    RicohAPI::Auth::TOKEN_ENDPOINT.should_not be nil
    RicohAPI::Auth::DISCOVERY_ENDPOINT.should_not be nil
    RicohAPI::Auth::DISCOVERY_RELATED_SCOPES.should_not be nil
  end
end
