# Ricoh Auth Client for Ruby

Ricoh Auth Client.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ricohapi-auth'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ricohapi-auth

## Usage

[A working rails sample app using Ricoh Media Storage API](https://github.com/ricohapi/media-storage-sample-app) is using this gem internally.

### Obtain Access Token for Media Storage API

```ruby
client = RicohAPI::Auth::Client.new(
  '<your-client-id>',
  '<your-client-secret>'
)
client.resource_owner_credentials = '<your-user-id>', '<your-password>'
api_session = client.api_token_for! RicohAPI::MStorage::SCOPE
puts api_session.access_token, api_session.refresh_token
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

