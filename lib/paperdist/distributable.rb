require 'active_support/concern'

module Paperdist
  module Distributable
    extend ActiveSupport::Concern

    included do
      before_create { |r| r.node = ::Paperdist::NodeSelector.get_node }
    end
  end
end
