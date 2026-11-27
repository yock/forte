require 'helper'
require 'tmpdir'

describe Forte::RepoLocation do
  describe '#uri' do
    it 'returns the path if it starts with http' do
      repo = Forte::RepoLocation.new('https://github.com/yock/forte.git')
      expect(repo.uri).to eq('https://github.com/yock/forte.git')
    end

    it 'returns the path for local repositories' do
      Dir.mktmpdir do |dir|
        Dir.mkdir(File.join(dir, '.git'))
        repo = Forte::RepoLocation.new(dir)
        expect(repo.uri).to eq(dir)
      end
    end

    it 'treats a local directory without .git as a Github path' do
      Dir.mktmpdir do |dir|
        repo = Forte::RepoLocation.new(dir)
        expect(repo.uri).to eq("https://github.com/#{dir}.git")
      end
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
