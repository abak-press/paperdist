require 'paperclip/interpolations'
require 'paperclip/style'
require 'paperdist/node_selector'
require 'uri'

module Paperclip
  module Interpolations
    def public_url(attachment, style_name)
      system_asset_host = "#{ActionController::Base.asset_host}/system"
      paperdist_url = Paperdist::NodeInformer.url(attachment.instance.node.to_i.nonzero?, system_asset_host)
      attach_path = attachment.path(style_name)

      [paperdist_url, attach_path].join('/')
    end
  end
end
