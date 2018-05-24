Ideas:

* Move all gui steps to separate file, e.g. `setup/git/install-gui.sh`
* Add batching mode, e.g. `./dotfiles git:install git:configure`
    * No questions asked during install
    * Allows running multiple commands
* Maybe add ordering to scripts, e.g. `01-install.sh`, `02-install-ui.sh` etc.
    * This way it'll be possible to run `./dotfiles git` and just run all commands for a given application
* Add a possibility to use different package manager than `apt-get`; e.g. `yum` in case of CentOs
