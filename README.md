[![License](http://img.shields.io/badge/license-APACHE2-blue.svg)](http://img.shields.io/badge/license-APACHE2-blue.svg)
[![Gem Version](https://badge.fury.io/rb/portatext.svg)](https://badge.fury.io/rb/portatext)
[![Yard Docs](http://img.shields.io/badge/yard-docs-blue.svg)](http://www.rubydoc.info/gems/portatext)

[![Build Status](https://travis-ci.org/PortaText/ruby-sdk.svg)](https://travis-ci.org/PortaText/ruby-sdk)
[![Coverage Status](https://coveralls.io/repos/PortaText/ruby-sdk/badge.svg?branch=master&service=github)](https://coveralls.io/github/PortaText/ruby-sdk?branch=master)
[![Code Climate](https://codeclimate.com/github/PortaText/ruby-sdk/badges/gpa.svg)](https://codeclimate.com/github/PortaText/ruby-sdk)
[![Issue Count](https://codeclimate.com/github/PortaText/ruby-sdk/badges/issue_count.svg)](https://codeclimate.com/github/PortaText/ruby-sdk)
[![Inline docs](http://inch-ci.org/github/portatext/ruby-sdk.svg?branch=master)](http://inch-ci.org/github/portatext/ruby-sdk)

# ruby-sdk
Official Ruby Client for the [PortaText](https://www.portatext.com/) API.

# Documentation

* The [endpoint tests](https://github.com/PortaText/ruby-sdk/tree/master/test/endpoints) should also serve as good doucmentation on how to use the API.
* General PortaText documentation (including the REST API) can be found at the [PortaText wiki](https://github.com/PortaText/docs/wiki).

# Installing
Add this library to your [Gemfile](http://bundler.io/gemfile.html).
```ruby
gem 'portatext'
```

# Basic use

## Getting a client instance
The first thing is to get a [Client](https://github.com/PortaText/ruby-sdk/blob/master/lib/portatext/client/base_client.rb) instance, for example
the [Net::HTTP](https://github.com/PortaText/ruby-sdk/blob/master/lib/portatext/client/http_client.rb) implementation:

```ruby
require 'portatext'
client = PortaText::Client::HttpClient.new
```

## (Optional) Set your logger
You can optionally set a [Logger](http://ruby-doc.org/stdlib-2.2.0/libdoc/logger/rdoc/Logger.html) compatible logger:
```ruby
client.logger = my_logger
```

By default, the client will use a logger pointing to `/dev/null`

## Authenticating
You can authenticate to the endpoints by using your [API key](https://github.com/PortaText/docs/wiki/REST-API#auth_api) or your username/password. This translates to
either doing this:

```ruby
client.api_key = api_key
```

Or this:

```ruby
client.credentials = [username, password]
```

When you specify a [username and password](https://github.com/PortaText/docs/wiki/REST-API#auth_basic) instead of an api key, the sdk will
automatically login and get a [session token](https://github.com/PortaText/docs/wiki/REST-API#auth_session) when needed.

# Using the endpoints
All the API commands can be found in the [command/api](https://github.com/PortaText/ruby-sdk/tree/master/lib/portatext/command/api)
directory. The client offers a way to instantiate them by just calling them by their name.

## Quick example
As an example, to create a template, you would do:

```ruby
result = client
  .templates                       # Get an instance of the Templates endpoint.
  .text('The text of my template')
  .description('My first template')
  .name('template1')
  .post                            # Call the Templates endpoint with a POST.
```

To get a template by id:

```ruby
result = client.templates.id(45).get
```

Or, to get all the templates:

```ruby
result = client.templates.get
```

## The result
After calling an endpoint, one of two things can happen:
 * A [PortaText Exception](https://github.com/PortaText/ruby-sdk/tree/master/lib/portatext/exception) is raised.
 * A [Result](https://github.com/PortaText/ruby-sdk/blob/master/lib/portatext/command/result.rb) instance is returned.

Also, when possible, your PortaText exception will contain a `Result` object that
can be retrieved by using the `result` accessor on the exception. This is usually useful for the
[ClientError](https://github.com/PortaText/ruby-sdk/blob/master/lib/portatext/exception/client_error.rb) exception, where
you will be able to see if a field was missing or different than what was expected.

### Testing for success
```ruby
if result.success?
    ...
end
```

### Getting error strings back from the server
```ruby
if !result.errors.nil?
  result.errors.each do |e|
    puts e
  end
end
```

### Getting data back from the server
```ruby
if result.success
  data = result.data
end
```

# Developers
This project uses [rake](https://github.com/ruby/rake). Current tasks include:
 * test: Runs [MiniTest](https://github.com/seattlerb/minitest)s.
 * rubocop: Runs [RuboCop](https://github.com/bbatsov/rubocop).
 * default: This is the default task, and will run all the other tasks.

## Running a rake task
To run a task, just do:

```sh
rake test
```

## Contributing
To contribute:
 * Make sure you open a **concise** and **short** pull request.
 * Throw in any needed unit tests to accomodate the new code or the
 changes involved.
 * Run `rake` and make sure everything is ok before submitting the pull
 request (make rubocop happy).
 * Your code must comply with [the GitHub ruby style](https://github.com/styleguide/ruby).
 * If your code is accepted, it will belong to PortaText and will be published
 under the Apache2 License.

# License
The source code is released under Apache 2 License.

Check [LICENSE](https://github.com/PortaText/ruby-sdk/blob/master/LICENSE) file for more information.

