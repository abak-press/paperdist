require 'rails/engine'

module Paperdist
  class Engine < Rails::Engine
    initializer 'paperdist.set_config' do
      paths = Rails.root.join('config', 'paperdist.yml'),
              Rails.root.join('config', 'paperdist.local.yml')

      Paperdist.config = Paperdist::Configuration.new(*paths.map(&:to_s))
    end

    initializer 'paperdist.set_webdav_servers' do
      Paperclip::Attachment.default_options[:webdav_servers] = [{url: Paperdist.config.webdav_server}]
    end
  end
end
