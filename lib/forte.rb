require 'thor'
require 'git'
require 'fileutils'
require 'forte/authorized_keys'
require 'forte/keyfile'
require 'forte/repo_location'
require 'forte/version'

module Forte
  class CLI < Thor
    desc "print", "Prints the public keys to STDOUT"
    def print(uri)
      loc = RepoLocation.new(uri)
      repo = Git.clone(loc.uri, File.join(Dir.pwd, '.forte'))
      puts AuthorizedKeys.build(repo.dir.path)
      FileUtils.rm_rf(repo.dir.path)
    end
  end
end
