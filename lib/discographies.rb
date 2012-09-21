require 'faraday'
require 'faraday_middleware'

require 'discographies/version'
require 'discographies/artist'
require 'discographies/releases'
require 'discographies/release'
require 'discographies/master'

module Discographies
  module_function
  def connection
    @connection ||= Faraday.new(url: 'http://api.discogs.com') do |conn|
      conn.response :json, content_type: %r{\bjson$}
      conn.adapter Faraday.default_adapter
    end
  end
end
