echo 't4 eaZy_install'

if [ "$EUID" -ne 0 ]
  then echo "Please run script as root"
  exit
fi

echo
echo '***** Updating cached packages *****'
echo

apt update

echo
echo '***** Installing Aptitude *****'
echo

apt install -y aptitude

echo
echo "***** Updating Aptitude's package cache *****"
echo

aptitude update

echo
echo "***** Installing dev pac *****"
echo

aptitude install -y build-essential clang cmake git subversion vim

echo
echo '***** Upgrading packages *****'
echo

aptitude upgrade -y
