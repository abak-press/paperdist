require 'spec_helper'

RSpec.describe Paperclip::Interpolations do
  describe '#public_url' do
    let(:default_host) { 'http://hello.localhost' }
    let(:node) { 10 }
    let(:attachment_path) { '000/001/1_original.jpg' }

    let(:model) { double('Image', node: node) }
    let(:attachment) { double(Paperclip::Attachment, instance: model, path: '000/001/1_original.jpg') }

    before do
      stub_const('ActionController::Base', Object)
      allow(ActionController::Base).to receive(:asset_host).and_return default_host
    end

    context 'when prod' do
      let(:env) { :production }

      it 'constructs full public url' do
        expect(described_class.send(:public_url, attachment, :big)).to eq(
          "http://st#{node}.example.com/#{attachment_path}"
        )
      end
    end

    context 'when dev' do
      let(:env) { :development }

      it 'constructs full public url' do
        expect(described_class.send(:public_url, attachment, :big)).to eq(
          "http://st#{node}.localhost/#{attachment_path}"
        )
      end
    end
  end
end
