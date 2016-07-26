require 'spec_helper'

RSpec.describe Paperdist::Configuration do
  let(:configuration) { Paperdist.config }

  describe '#active_node' do
    context 'when development env' do
      let(:env) { :development }

      it { expect(configuration.active_node).to eq 1 }
      it { expect(configuration.webdav_server).to eq 'http://foo%.localhost' }
      it { expect(configuration.public_server).to eq 'http://st%.localhost' }
    end

    context 'when production env' do
      let(:env) { :production }

      it { expect(configuration.active_node).to eq 11 }
      it { expect(configuration.webdav_server).to eq 'http://foo%.example.com' }
      it { expect(configuration.public_server).to eq 'http://st%.example.com' }
    end
  end
end
