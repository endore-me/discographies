# Monkey patch Bundler gem_helper so we release to our gem server instead of rubygems.org
module Bundler
  class GemHelper
    def rubygem_push(path)
      sh("gem inabox '#{path}'")
      Bundler.ui.confirm "Pushed #{name} #{version} to gemserver"
    end
  end
end
#http://www.alexrothenberg.com/2011/09/16/running-a-private-gemserver-inside-the-firewall.html

require "bundler/gem_tasks"
