# Rack::JSONPrettyPrint

Rack middleware that will optionally format JSON responses.  Just pass pretty=1 in the URL.

## Installation

Add this line to your application's Gemfile:

    gem 'rack-json-pretty-print', require: 'rack/json_pretty_print'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rack-json-pretty-print

## Usage

Add this line to `config/environments/development.rb`

    config.middleware.use Rack::JSONPrettyPrint

## Contributing

1. Fork it ( https://github.com/cyu/rack-json-pretty-print/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
