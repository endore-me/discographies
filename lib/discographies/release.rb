module Discographies
  class Release
    attr_reader :values

    def self.find(id)
      response = Discographies.connection.get("/releases/#{id}")
      case response.status
      when 200
        new reposonde.body
      else
        raise StandardError
      end
    end

    def initialize(values)
      @values = values
    end

    def method_missing(method, *args, &block)
      if  values.has_key? method.to_s
        values[method.to_s]
      else
        super
      end
    end

    def respond_to_missing?(method_name, include_private = false)
      values.has_key? method_name.to_s
    end
  end
end
