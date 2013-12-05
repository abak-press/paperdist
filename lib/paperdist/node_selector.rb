# coding: utf-8
module Paperdist
  class NodeSelector
    def self.get_node
      Paperdist.config.active_node
    end
  end
end
