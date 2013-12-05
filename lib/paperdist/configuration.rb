require 'active_support/configurable'
require 'active_support/core_ext/hash/keys'
require 'yaml'

module Paperdist
  class Configuration
    include ActiveSupport::Configurable
    config_accessor :active_node, :webdav_server, :public_server

    def initialize(*paths)
      paths.each { |p| load(p) }
      webdav_server.tr!('%', active_node.to_s)
    end

    private
    def load(path)
      if File.exists?(path)
        c = YAML.load(File.read(path))
        c.symbolize_keys!

        config.merge!(c)
      end
    end
  end
end
