require "rack/json_pretty_print/version"

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
            response[2].close if response[2].respond_to? :close
            response[2] = [pretty_json(json.join)]
          end
        end
      end
      response
    end

    def pretty_json(json)
      if defined? MultiJson
        hash = MultiJson.load(json)
        MultiJson.dump(hash, :pretty => true)
      elsif defined? Yajl
        parser = Yajl::Parser.new
        hash = parser.parse(json)
        Yajl::Encoder.encode(hash, :pretty => true)
      elsif defined? JSON
        hash = JSON.parse(json)
        JSON.pretty_generate(hash)
      else
        json
      end
    end
  end
end
