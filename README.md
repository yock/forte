[![Gem Version](https://badge.fury.io/rb/forte.png)](http://badge.fury.io/rb/forte)
[![Build Status](https://travis-ci.org/yock/forte.png?branch=master)](https://travis-ci.org/yock/forte)
#Forte
A tool for compiling public key files for shared *nix accounts as an alternative to sharing passwords.

##Installation
Forte is distributed as a gem. You can install it with the `gem` command:

    gem install forte

If you're using Bundler and want to include Forte as a dependency:

    gem 'forte', '~> 1.0'
##Usage
Forte is a command line application intended for Linux or OSX. You can run it by
calling the `forte` command with the repository uri (or local directory) that
contains your public key files. For example, if your public key repository is on
Github, your command could look like this:

    forte print git@github.com:user/repo.git

This will print the authorized keys file to the console. You could use shell
redirection to write this to a file too:

    forte print git@github.com:user/repo.git > authorized_keys
    
As of version 0.0.2, you may omit the protocol and domain for Github repositories that are available to you over HTTPS:

    forte print user/repo > authorized_keys

##Dependencies
* Ruby 2+
* Git

##Future Plans
* Direct deployment to a server
* Try Github repo for path-only arguments
* Replace system() call with Ruby Git library (but which one?)

##Thanks
Thanks to [Ryan Cromwell]("https://github.com/cromwellryan") for help and encouragement in getting this finished and released.
