#!/bin/bash
#Author Omar BOUYKOURNE
#42login : obouykou

if [[ $1 == "question" ]]; then

	is_installed=$(which valgrind &>/dev/null; echo -n $?)
	path=$(which valgrind)

	if [[ "$is_installed" == "0" && "$path" != *"goinfre"* ]]; then

		while true; do
			echo -en "\n\033[33mvalgrind is not installed in goinfre\n\033[0m"
			echo -en "\n\033[33mDo you want to install valgrind in goinfre ? \033[0m"
			read -r valg
			case $valg in
				[Yy]* ) valg=1 && break;;
				[Nn]* ) valg=0 && break;;
				* ) echo -e "\nPlease answer yes or no !";;
			esac
		done
		if [ "$valg" == "1" ]; then
			echo -en "\n\033[33mPlease, remove your version of valgrind in this path (remove the whole directories [~/valgrind* or ~/.valgrind]) ! \033[0m"
			sleep 3
		fi
	elif [ "$is_installed" == "1" ]; then
		while true; do
			echo -en "\n\033[33mDo you want to install valgrind ? \033[0m"
			read -r valg
			case $valg in
				[Yy]* ) valg=1 && break;;
				[Nn]* ) valg=0 && break;;
				* ) echo -e "\nPlease answer yes or no !";;
			esac
		done
	else
		echo -e "\n\033[32m------- valgrind has been already installed -------\033[0m\n"
	fi
	exit $valg
elif [[ $1 == "install" ]]; then
	echo -e "\n\033[33m------- Installing valgrind ... -------\033[0m\n"
	echo -e "\n\033[36m------- This will take several minutes -------\033[0m\n"
	"$HOME"/goinfre/.brew/bin/brew install --HEAD ./valgrind.rb &>/dev/null
	echo -e "\n\033[32m------- valgrind has been installed successfully -------\033[0m\n"
fi
