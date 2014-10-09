require 'helper'

describe Forte::Keyfile do
  let(:keyfile) { Forte::Keyfile.new('spec/fixtures/keys/test_dsa.pub') }
  describe '#description' do
    it 'returns the file name without extension' do
      expect(keyfile.description).to eq('test_dsa')
    end
  end
  describe '#body' do
    it 'returns the key portion of the file' do
      expect(keyfile.body).to start_with('ssh-dss')
    end
  end
end
