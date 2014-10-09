module Forte
  class RepoLocation
    attr_accessor :path

    def initialize(path)
      @path = path
    end

    def uri
      return path if path.start_with?('git@')
      return path if path.start_with?('http')
      return path if Dir.exists?(File.join(path, '.git'))
      "https://github.com/#{path}.git"
    end

  end
end
