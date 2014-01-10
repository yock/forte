require 'helper'

describe RepoLocation do
  describe '#uri' do
    it 'returns the path if it starts with http' do
      repo = RepoLocation.new('https://github.com/yock/forte.git')
      expect(repo.uri).to eq('https://github.com/yock/forte.git')
    end
    it 'returns the path for local repositories' do
      Dir.stub(:exists?).and_return(:true)
      repo = RepoLocation.new('spec/fixtures/repo')
      expect(repo.uri).to eq('spec/fixtures/repo')
    end
    it 'returns Github paths without protocol' do
      repo = RepoLocation.new('yock/forte')
      expect(repo.uri).to eq('https://github.com/yock/forte.git')
    end
  end
end