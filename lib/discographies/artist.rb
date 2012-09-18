module Discographies
  class Artist
    class NotFound < StandardError; end
    class UnkownError < StandardError; end

    def self.find(id)
      response = Discographies.connection.get("/artists/#{id}")
      case response.status
      when 404
        raise NotFound, "Artist with id: #{id.inspect} could not be found"
      when 200
        new(response.body)
      else
        raise UnkownError
      end
    end

    attr_reader :data

    def initialize(data)
      @data = data
    end

    def method_missing(method, *args, &block)
      if data.has_key? method.to_s
        data[method.to_s]
      else
        super
      end
    end

    def respond_to_missing?(method_name, include_private = false)
      data.has_key? method_name.to_s || super
    end

    def releases
      @releases ||= Releases.find_all(id)
    end
  end
end
