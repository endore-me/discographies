module Discographies
  class Releases
    include Enumerable

    def self.find_all(artist_id)
      response = Discographies.connection.get("/artists/#{artist_id}/releases")
      case response.status
      when 200
        new(response, artist_id)
      else
        raise StandardError
      end
    end

    def initialize(response, artist_id)
      @artist_id = artist_id
      @response = response
      @total = response.body['pagination']['items']
      @pages = response.body['pagination']['pages']
      @per_page = response.body['pagination']['per_page']
      @releases = {}
      @releases[response.body['pagination']['page']] = response.body['releases']
    end

    def size
      @total
    end
    alias :length :size

    def [](index)
      return nil if index >= size
      page = (index / @per_page) + 1
      pos_on_page = index % @per_page
      releases(page)[pos_on_page]
    end

    def last
      self[@total-1]
    end

    def each
      (1..@pages).each do |page|
        releases(page).each do |release|
          yield release
        end
      end
    end

    def masters
      select{ |r| r['type'] == 'master' }
    end

    def main_role
      select{ |r| r['role'] == 'Main' }
    end

    def masters_with_main_role
      select{ |r| r['type'] == 'master' && r['role'] == 'Main' }
    end

    def inspect
      "<#{self.class.name} length:#{length} arist_id:#{@artist_id}>"
    end

  private

    def releases(page)
      @releases[page] ||=
        Discographies.connection.
          get("/artists/#{@artist_id}/releases", page: page).body['releases']
    end
  end
end
