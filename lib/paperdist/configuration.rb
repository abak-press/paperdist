require 'active_support/configurable'
require 'active_support/core_ext/hash/keys'
require 'yaml'

module Paperdist
  class Configuration
    include ActiveSupport::Configurable
    config_accessor :active_node, :webdav_server, :public_server
    attr_accessor :active_node_producer

    def initialize(*paths)
      paths.each { |p| load(p) }
    end

    module Overriding
      def active_node
        return super unless active_node_producer
        Integer(active_node_producer.call)
      end
    end

    prepend Overriding

    private
    def load(path)
      if File.exists?(path)
        c = YAML.load(ERB.new(File.read(path)).result).fetch(Rails.env.to_s)
        c.symbolize_keys!

        config.merge!(c)
      end
    end
  end
end
