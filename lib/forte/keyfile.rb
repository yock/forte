module Forte
  class Keyfile
    attr_accessor :path
    def initialize(path)
      @path = path
    end

    def description
      File.basename(path, '.*')
    end

    def body
      IO.read(path)
    end

  end
end
