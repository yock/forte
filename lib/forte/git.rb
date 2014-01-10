require 'fileutils'
class Git 
  class << self
    TMP_DIR = File.join(Dir.pwd, '.forte')

    def clone(uri)
      FileUtils.mkdir_p(TMP_DIR)
      cmd = "git clone -q #{complete_uri(uri)} #{TMP_DIR}"
      system(cmd)
      TMP_DIR
    end

    def cleanup
      FileUtils.rm_rf(TMP_DIR)
    end

    private

    def complete_uri(uri)
      return uri if Dir.exist?("#{uri}/.git")
      return uri if uri.start_with?('http')
      "https://github.com/#{uri}.git"
    end
  end
end
