require 'active_support/core_ext/module/attribute_accessors'
require 'paperclip'
require 'paperclip-webdav'

require 'paperdist/engine'
require 'paperdist/interpolations'
require 'paperdist/version'

require 'ext/paperclip/webdav'

module Paperdist
  mattr_accessor :config

  autoload :Configuration, 'paperdist/configuration'
  autoload :Distributable, 'paperdist/distributable'
  autoload :NodeInformer, 'paperdist/node_informer'
  autoload :NodeSelector, 'paperdist/node_selector'
end

