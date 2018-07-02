require 'spec_helper'

RSpec.describe Paperdist::Configuration do
  let(:configuration) { Paperdist.config }

  context 'when development env' do
    let(:env) { :development }

    it { expect(configuration.webdav_server).to eq 'http://foo%.localhost' }
    it { expect(configuration.public_server).to eq 'http://st%.localhost' }
  end

  context 'when production env' do
    let(:env) { :production }

    it { expect(configuration.webdav_server).to eq 'http://foo%.example.com' }
    it { expect(configuration.public_server).to eq 'http://st%.example.com' }
  end

  describe '#active_node' do
    context 'when active_node_producer is not given' do
      context 'when development env' do
        let(:env) { :development }

        it { expect(configuration.active_node).to eq 1 }
      end

      context 'when production env' do
        let(:env) { :production }

        it { expect(configuration.active_node).to eq 11 }
      end
    end

    context 'when active_node_producer is given' do
      before { configuration.active_node_producer = proc { '2' } }

      it { expect(configuration.active_node).to eq 2 }
    end
  end
end
