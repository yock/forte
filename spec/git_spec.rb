require 'helper'
describe Git do
  before(:each) do
    FileUtils.rm_rf(tmp_dir)
  end
  after(:each) do
    FileUtils.rm_rf(tmp_dir)
  end
  let(:uri) { ('https://github.com/yock/forte.git') }
  let(:tmp_dir) { File.join(Dir.pwd, '.forte') }
  describe '.clone' do
    it 'clones the repo' do
      Git.clone(uri)
      expect(Dir).to exist("#{tmp_dir}/.git")
    end
    
    it 'returns the directory location of the repo' do
      expect(Git.clone(uri)).to eq(tmp_dir)
    end

    it 'accepts github paths without the domain' do
      Git.clone('yock/forte')
      expect(Dir).to exist("#{tmp_dir}/.git")
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
