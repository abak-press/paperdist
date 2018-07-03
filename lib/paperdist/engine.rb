require 'rails/engine'

module Paperdist
  class Engine < Rails::Engine
    initializer 'paperdist', before: :load_init_rb do
      paths = Rails.root.join('config', 'paperdist.yml'),
              Rails.root.join('config', 'paperdist.local.yml')

      Paperdist.config = Paperdist::Configuration.new(*paths.map(&:to_s))
      Paperclip::Attachment.default_options[:webdav_servers] = [{url: Paperdist.config.webdav_server}]
    end
  end
end
