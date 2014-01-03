##Usage
Forte is a command line application intended for Linux or OSX. You can run it by
calling the `forte` command with the repository uri (or local directory) that
contains your public key files. For example, if your public key repository is on
Github, your command could look like this:

    forte print git@github.com:user/repo.git

This will print the authorized keys file to the console. You could use shell
redirection to write this to a file too:

    forte print git@github.com:user/repo.git > authorized_keys

##Dependencies
* Ruby 2+
* Git

##Future Plans
* Direct deployment to a server
* Try Github repo for path-only arguments
