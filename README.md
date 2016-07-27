# Ricoh Auth Client for Ruby

Ricoh Auth Client.

## Requirements

You need

    Ricoh API Client Credentials (client_id & client_secret)
    Ricoh ID (user_id & password)

If you don't have them, please register yourself and your client from [THETA Developers Website](http://contest.theta360.com/).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ricohapi-auth'
```

And then execute:

    $ bundle

Or execute the following line to install the gem without bundler.

    $ gem install ricohapi-auth

## Usage

[A working rails sample app using Ricoh Media Storage API](https://github.com/ricohapi/media-storage-sample-app) is using this gem internally.

## SDK API
Add `require 'ricohapi/auth'` to use the APIs below.

### Constructor

```ruby
client = RicohAPI::Auth::Client.new '<your-client-id>', '<your-client-secret>'
```

### Set resource owner credentials

```ruby
client.resource_owner_credentials = '<your-user-id>', '<your-password>'
```

### Open a new session

```ruby
api_session = client.api_token_for! '<scope>'
```

### Obtain the valid access token

The access token will be refreshed automatically as needed.

```ruby
api_session = client.api_token_for!
access_token = api_session.access_token
```

