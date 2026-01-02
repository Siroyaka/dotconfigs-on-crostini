#!/bin/bash

function make_file_link () {
	src=$1
	dst=$2

	if [[ ! -f $src ]]; then
		exit
	fi

	if [[ ! -e $(dirname $dst) ]]; then
		mkdir -p $(dirname $dst)
	fi

	ln -sf $src $dst
}

function make_dir_link () {
	src=$1
	dst=$2

	if [[ ! -d $src ]]; then
		exit
	fi

	if [[ ! -e $(dirname $dst) ]]; then
		mkdir -p $(dirname $dst)
	fi

	ln -nsf $src $dst
}


make_file_link $(pwd)/config/nvim/init.lua ~/.config/nvim/init.lua
make_dir_link $(pwd)/config/nvim/lua ~/.config/nvim/lua
make_dir_link $(pwd)/config/nvim/after ~/.config/nvim/after

