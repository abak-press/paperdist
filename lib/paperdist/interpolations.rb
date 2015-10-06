require 'paperclip/interpolations'
require 'paperclip/style'
require 'paperdist/node_selector'
require 'uri'

module Paperclip
  module Interpolations
    def public_url(attachment, style_name)
      system_asset_host = ActionController::Base.asset_host + '/system/'
      paperdist_url = Paperdist::NodeInformer.url(attachment.instance.node, system_asset_host)
      attach_path = attachment.path(style_name)

      [paperdist_url, attach_path].join('/')
    end

    # Returns the extension of the file. e.g. "jpg" for "file.jpg"
    # If the style has a format defined, it will return the format instead
    # of the actual extension.
    def extension(attachment, style_name)
      ((style = attachment.styles[style_name.to_s.to_sym]) && style.format) ||
        File.extname(attachment.original_filename)[1..-1]
    end
  end
end
