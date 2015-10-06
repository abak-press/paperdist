require 'spec_helper'

RSpec.describe Paperdist::NodeInformer do
  describe '.url' do
    let(:default_host) { 'http://hello.localhost' }
    let(:env) { :development }

    before do
      stub_const('ActionController::Base', Object)
      allow(ActionController::Base).to receive(:asset_host).and_return default_host
    end

    context 'when node_id is present' do
      it { expect(described_class.url(1)).to eq 'http://st1.localhost' }
      it { expect(described_class.url(23)).to eq 'http://st23.localhost' }
    end

    context 'when node_id is not present' do
      it { expect(described_class.url(nil)).to eq 'http://hello.localhost' }
    end
  end
end
