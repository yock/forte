require 'helper'

describe AuthorizedKeys do
  let(:test_rsa) { IO.read('spec/fixtures/keys/test_rsa.pub') }
  let(:test_dsa) { IO.read('spec/fixtures/keys/test_dsa.pub') }
  describe '.build' do
    it 'returns a string of the contents of the passed directory' do
      out = AuthorizedKeys.build('spec/fixtures/keys')
      expect(out).to include('#test_dsa')
      expect(out).to include('#test_rsa')
      expect(out).to include(test_rsa)
      expect(out).to include(test_dsa)
    end
  end
end
