require 'spec_helper'

RSpec.describe Paperdist::NodeSelector do
  describe '.get_node' do
    context 'when dev' do
      let(:env) { :development }

      it { expect(described_class.get_node).to eq 1 }
    end

    context 'when prod' do
      let(:env) { :production }

      it { expect(described_class.get_node).to eq 11 }
    end
  end
end
