require 'spec_helper'

describe Discographies::Artist do
  describe ".find(id)" do
    it "finds artist for given id", :vcr do
      artist = Discographies::Artist.find(38661)
      artist.name.should eq "Eminem"
    end

    it "finds other artists too", :vcr do
      artist = Discographies::Artist.find(90440)
      artist.name.should eq "Deichkind"
    end

    it "raises Discographies::Artist::NotFound for unknown ids", :vcr do
      expect {
        Discographies::Artist.find(-123)
      }.to raise_error Discographies::Artist::NotFound
    end
  end
end
