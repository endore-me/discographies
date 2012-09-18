require 'spec_helper'

describe Discographies do
  it "responds to connection" do
    Discographies.should respond_to :connection
  end

  describe ".connection" do
    it "builds a faraday connection to 'http://api.discogs.com'" do
      Discographies.connection.should be_kind_of Faraday::Connection
    end

    it "builds no new connection for second call" do
      Discographies.connection
      Faraday.should_not_receive(:new)
      Discographies.connection
    end
  end
end
