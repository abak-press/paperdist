# coding: utf-8
require 'paperclip/storage/webdav'

module Paperclip
  module Storage
    module Webdav
      def servers
        @webdav_servers ||= begin
          node = instance.node || Paperdist.config.active_node
          [Server.new(url: Paperdist.config.webdav_server.gsub(/%/, node.to_s))]
        end
      end
    end
  end
end
