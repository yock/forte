require 'fileutils'
class Git 
  class << self
    TMP_DIR = File.join(Dir.pwd, '.tmp', 'forte')

    def clone(uri)
      FileUtils.mkdir_p(TMP_DIR)
      cmd = "git clone #{uri} #{TMP_DIR}"
      system(cmd)
      TMP_DIR
    end

    def cleanup
      FileUtils.rm_rf(TMP_DIR)
    end
  end
end
