require 'rack/utils'
require 'rack/json_pretty_print/version'

module Rack
  class JSONPrettyPrint
    def initialize(app)
      @app = app
    end

    def call(env)
      response = @app.call(env)
      if response[1]['Content-Type'] =~ /application\/json/
        if qs = env['QUERY_STRING'].to_s
          if qs.split('&').include?('pretty=1')
            json = []
            response[2].each { |str| json << str }
            response[2].close if response[2].respond_to?(:close) # Rack::Lock

            json_prettified = pretty_json(json.join)
            response[1]['Content-Length'] = Rack::Utils.bytesize(json_prettified).to_s
            response[2] = [json_prettified]
          end
        end
      end
      response
    end

    def pretty_json(json)
      if defined? Yajl
        parser = Yajl::Parser.new
        hash = parser.parse(json)
        Yajl::Encoder.encode(hash, :pretty => true)
      elsif defined? JSON
        hash = JSON.parse(json)
        JSON.pretty_generate(hash)
      elsif defined? MultiJson
        hash = MultiJson.load(json)
        MultiJson.dump(hash, :pretty => true)
      else
        json
      end
    end
  end
end
