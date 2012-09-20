module Discographies
  class Master < Release
    attr_reader :values

    def self.find(id)
      response = Discographies.connection.get("/masters/#{id}")
      case response.status
      when 200
        new response.body
      else
        raise StandardError
      end
    end
  end
end

