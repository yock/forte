require 'helper'

describe Forte::RepoLocation do
  describe '#uri' do
    it 'returns the path if it starts with http' do
      repo = Forte::RepoLocation.new('https://github.com/yock/forte.git')
      expect(repo.uri).to eq('https://github.com/yock/forte.git')
    end
    it 'returns the path for local repositories' do
      Dir.stub(:exists?).and_return(:true)
      repo = Forte::RepoLocation.new('spec/fixtures/repo')
      expect(repo.uri).to eq('spec/fixtures/repo')
    end
    it 'returns Github paths without protocol' do
      repo = Forte::RepoLocation.new('yock/forte')
      expect(repo.uri).to eq('https://github.com/yock/forte.git')
    end
    it 'returns ssh uris' do
      repo = Forte::RepoLocation.new('git@github.com:yock/forte.git')
      expect(repo.uri).to eq('git@github.com:yock/forte.git')
    end
  end
end
