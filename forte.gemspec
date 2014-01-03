$:.unshift File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name = 'forte'
  s.version = '0.0.1'
  s.summary = 'Create an authorized_keys file for a shared shell account from a repository of public key files'
  s.platform = Gem::Platform::RUBY
  s.authors = ['Michael Yockey', 'Ryan Cromwell']
  s.email = ['mike@heysparkbox.com', 'ryan@heysparkbox.com']
  s.license = 'MIT'

  root_path = File.dirname(__FILE__)
  lib_files = Dir.chdir(root_path) { Dir.glob("lib/**/{*,.*}") }

  s.files = [lib_files, 'bin/forte'].flatten
  s.executables = ['forte']
end
