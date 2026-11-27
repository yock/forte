require 'helper'
require 'tmpdir'

describe Forte::CLI do
  describe '#print' do
    let(:fixtures) { File.expand_path('../fixtures/keys', __dir__) }

    around do |example|
      Dir.mktmpdir do |tmp|
        @key_repo = File.join(tmp, 'keys')
        @workdir = File.join(tmp, 'work')
        FileUtils.mkdir_p([@key_repo, @workdir])
        FileUtils.cp(Dir.glob(File.join(fixtures, '*.pub')), @key_repo)
        FileUtils.mkdir_p(File.join(@key_repo, 'team'))
        FileUtils.cp(File.join(fixtures, 'test_rsa.pub'), File.join(@key_repo, 'team', 'nested_rsa.pub'))

        git = Git.init(@key_repo)
        git.config('user.name', 'Forte Spec')
        git.config('user.email', 'forte@example.com')
        git.config('commit.gpgsign', 'false')
        git.add(all: true)
        git.commit('Add keys')

        Dir.chdir(@workdir) { example.run }
      end
    end

    def run_print(location)
      out = StringIO.new
      original = $stdout
      $stdout = out
      Forte::CLI.start(['print', location])
      out.string
    ensure
      $stdout = original
    end

    it 'clones the repository and prints every public key with a description' do
      output = run_print(@key_repo)

      expect(output).to include("#test_rsa\n#{IO.read(File.join(fixtures, 'test_rsa.pub'))}")
      expect(output).to include("#test_dsa\n#{IO.read(File.join(fixtures, 'test_dsa.pub'))}")
      expect(output).to include('#nested_rsa')
    end

    it 'removes the cloned repository afterwards' do
      run_print(@key_repo)

      expect(File.exist?(File.join(@workdir, '.forte'))).to be false
    end

    it 'clones into .forte in the current directory' do
      expect(Git).to receive(:clone)
        .with(@key_repo, File.join(Dir.pwd, '.forte'))
        .and_call_original

      run_print(@key_repo)
    end
  end
end
