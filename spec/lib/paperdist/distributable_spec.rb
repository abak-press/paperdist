require 'spec_helper'
require 'active_record'

describe Paperdist::Distributable do
  class TestModelWithNode
    include ::ActiveRecord::Callbacks
    include ActiveModel::Dirty
    include ::Paperdist::Distributable

    define_attribute_methods [:node]

    def create
      run_callbacks(:create)
    end

    def node
      @node
    end

    def node=(val)
      node_will_change! unless val == @node
      @node = val
    end
  end

  let(:model) { TestModelWithNode.new }

  before { allow(::Paperdist::NodeSelector).to receive(:get_node).and_return(2) }

  context 'when node not present' do
    before { model.create }

    it { expect(model.node).to eq 2 }
  end

  context 'when node changed' do
    before do
      model.node = 5
      model.create
    end

    it { expect(model.node).to eq 5 }
  end
end
