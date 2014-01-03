class Base < Thor
  desc "print", "Prints the public keys to STDOUT"
  def print(uri)
    dir = Git.clone(uri)
    puts AuthorizedKeys.build(dir)
    Git.cleanup
  end
end
