#! /bin/sh

mv -f ~/.gitconfig ~/.gitconfig.old 2>/dev/null
mv -f ~/.gitconfig-public ~/.gitconfig-public.old 2>/dev/null
cp ./.gitconfig ~/.gitconfig
cp ./.gitconfig-public ~/.gitconfig-public
