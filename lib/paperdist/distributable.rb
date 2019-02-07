require 'active_support/concern'

module Paperdist
  module Distributable
    extend ActiveSupport::Concern

    included do
      before_create -> { self.node = ::Paperdist::NodeSelector.get_node }, unless: :node_changed?
    end
  end
end
