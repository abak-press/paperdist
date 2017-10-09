require 'spec_helper'

RSpec.describe Paperclip::Storage::Webdav do
  let(:node) { 32 }
  let(:model) { double('Model', id: 1, image_file_name: 'image.png', node: node) }
  let(:options) do
    {
      storage: :webdav,
      webdav_servers: [
        url: 'http://webdav1.example.com'
      ]
    }
  end
  let(:attachment) { Paperclip::Attachment.new(:image, model, options) }

  describe '#servers' do
    context 'when attachment has any node' do
      context 'when dev' do
        let(:env) { :development }

        it 'constructs webdav server instance with active node url' do
          expect(Paperclip::Storage::Webdav::Server).to receive(:new).with(url: 'http://foo32.localhost')

          attachment.send(:servers)
        end
      end

      context 'when production' do
        let(:env) { :production }

        it 'constructs webdav server instance with active node url' do
          expect(Paperclip::Storage::Webdav::Server).to receive(:new).with(url: 'http://foo32.example.com')

          attachment.send(:servers)
        end
      end
    end

    context 'when attachment without node' do
      let(:node) { nil }

      context 'when dev' do
        let(:env) { :development }

        it 'constructs webdav server instance with active node url from paperdist.yml' do
          expect(Paperclip::Storage::Webdav::Server).to receive(:new).with(url: 'http://foo1.localhost')

          attachment.send(:servers)
        end
      end

      context 'when production' do
        let(:env) { :production }

        it 'constructs webdav server instance with active node url from paperdist.yml' do
          expect(Paperclip::Storage::Webdav::Server).to receive(:new).with(url: 'http://foo11.example.com')

          attachment.send(:servers)
        end
      end
    end
  end

  describe '#save' do
    before do
      allow(model).to receive(:update_column).with(:node, 1)

      expect(attachment).to receive(:unlink_files).and_call_original

      attachment.save
    end

    context 'when node is 0' do
      let(:node) { 0 }

      it 'updates node from 0 to currently active node' do
        expect(model).to have_received(:update_column).with(:node, 1)
      end
    end

    context 'when node is nil' do
      let(:node) { nil }

      it 'updates node from 0 to currently active node' do
        expect(model).to have_received(:update_column).with(:node, 1)
      end
    end

    context 'when node is neither 0 nor nil but some other fixnum' do
      let(:node) { 1 }

      it 'updates node from 0 to currently active node' do
        expect(model).to_not have_received(:update_column).with(:node, 1)
      end
    end
  end
end
