require 'helper'

describe Base do
  it { should be_a(Thor) }

  let(:repo_uri) { 'spec/fixtures/repo' }

  describe '#print' do
    it 'prints the keys to stdout' do
      subject.print(repo_uri)
    end
  end
end
