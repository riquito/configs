Installation
============

    git clone git@github.com:riquito/configs.git ~/.myconfigs
    cd ~/.myconfigs
    ./reinstall.sh

`reinstall.sh` will just create a symlink in $HOME for every file in the root of the project (.git, reinstall.sh and little more excluded). Existing non-symlink files will be renamed to &lt;oldname&gt;.bak

If specific keyboard rules are needed, link the correct file to .Xmodmap, e.g.

    ln -s ~/.myconfigs/.Xmodmap_ideapad_u330p ~/.Xmodmap

To install/update Vim plugins, either run :PluginInstall or :PluginUpdate from inside Vim.

About this project
==================

For more informations, see http://www.sideralis.org/en/sync-configuration-files-on-linux

LICENSE
=======

[CC0](https://creativecommons.org/publicdomain/zero/1.0/) - Public Domain Dedication