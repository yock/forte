require 'helper'
describe Git do
  before(:each) do
    FileUtils.rm_rf(forte_dir)
  end
  let(:uri) { ('git@github.com:sparkbox/public_keys.git') }
  let(:forte_dir) { File.join(Dir.pwd, '.tmp', 'forte') }
  describe '.clone' do
    it 'clones the repo' do
      Git.clone(uri)
      expect(Dir).to exist("#{forte_dir}/.git")
    end
    
    it 'returns the directory location of the repo' do
      expect(Git.clone(uri)).to eq(forte_dir)
    end
  end
  describe '.cleanup' do
    it 'removes the repo' do
      Git.clone(uri)
      Git.cleanup
      expect(Dir).to_not exist("#{forte_dir}")
    end
  end
end
