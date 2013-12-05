require 'paperclip/interpolations'
require 'paperclip/style'
require 'paperdist/node_selector'
require 'uri'

module Paperclip
  module Interpolations
    def public_url(attachment, style_name)
      URI.join(Paperdist::NodeInformer.url(attachment.instance.node,
                                           ActionController::Base.asset_host + '/system/'),
               attachment.path(style_name)).to_s
    end

    # Returns the extension of the file. e.g. "jpg" for "file.jpg"
    # If the style has a format defined, it will return the format instead
    # of the actual extension.
    def extension(attachment, style_name)
      ((style = attachment.styles[style_name.to_s.to_sym]) && style.format) ||
        File.extname(attachment.original_filename).gsub(/^\.+/, "")
    end
  end
end
