module Forte
  class AuthorizedKeys
    def self.build(dir)
      out = ''
      Dir.glob(File.join(dir, '**', '*.pub')) do |file|
        keyfile = Keyfile.new(file)
        out << "##{keyfile.description}\n"
        out << "#{keyfile.body}\n"
      end
      out
    end
  end
end
