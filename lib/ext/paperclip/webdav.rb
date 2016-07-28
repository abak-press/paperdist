# coding: utf-8
require 'paperclip/storage/webdav'

module Paperclip
  module Storage
    module Webdav
      def servers
        @webdav_servers ||= begin
          if instance.node.to_i == 0
            node = Paperdist.config.active_node
          else
            node = instance.node
          end
          [Server.new(url: Paperdist.config.webdav_server.gsub(/%/, node.to_s))]
        end
      end

      def after_flush_writes
        instance.update_column(:node, Paperdist.config.active_node) if instance.node.to_i == 0
      end
    end
  end
end
