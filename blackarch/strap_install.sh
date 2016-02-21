#!/bin/bash

clear

# Run https://blackarch.org/strap.sh as root and follow the instructions:
curl -O https://blackarch.org/strap.sh

fname="strap.sh"

csha1=$(sha1sum "$fname" | cut -d ' ' -f 1)

# SHA1 sum should match: 86eb4efb68918dbfdd1e22862a48fda20a8145ff

bsha1="SHA1($fname)=86eb4efb68918dbfdd1e22862a48fda20a8145ff"

echo -e "Required SHA1:\t\t" $bsha1

echo -e "File SHA1:\t\t" $csha1

if [ "$csha1" != "${bsha1:$((${#fname}+7))}" ]; then

	echo "strap.sh doesn't match!"

else

	echo "strap.sh is good."

  # run strap.sh
  sudo ./strap.sh

  # install all of blackarch, use force because broken packages
  sudo pacman -S blackarch --force

fi

exit 0
