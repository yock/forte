require 'helper'
describe Git do
  before(:each) do
    FileUtils.rm_rf(tmp_dir)
  end
  let(:uri) { ('spec/fixtures/repo') }
  let(:tmp_dir) { File.join(Dir.pwd, '.forte') }
  describe '.clone' do
    it 'clones the repo' do
      Git.clone(uri)
      expect(Dir).to exist("#{tmp_dir}/.git")
    end
    
    it 'returns the directory location of the repo' do
      expect(Git.clone(uri)).to eq(tmp_dir)
    end
  end
  describe '.cleanup' do
    it 'removes the repo' do
      Git.clone(uri)
      Git.cleanup
      expect(Dir).to_not exist(tmp_dir)
    end
  end
end
