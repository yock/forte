class Base < Thor
  desc "print", "Prints the public keys to STDOUT"
  def print(uri)
    loc = RepoLocation.new(uri)
    repo = Git.clone(loc.uri, File.join(Dir.pwd, './.tmp'))
    puts AuthorizedKeys.build(repo.dir.path)
    FileUtils.rm_rf(repo.dir.path)
  end
end
