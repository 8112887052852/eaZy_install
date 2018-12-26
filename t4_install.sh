echo 't4 eaZy_install'

echo
echo '***** Updating cached packages *****'
echo

sudo apt update

echo
echo '***** Installing Aptitude *****'
echo

sudo apt install -y aptitude

echo
echo "***** Updating Aptitude's package cache *****"
echo

sudo aptitude update

echo
echo '***** Installing git *****'
echo

sudo aptitude install -y git

echo
echo '***** Git configuration *****'
echo

ssh-keygen -t rsa -C "${USER}@$(hostname)"

read -p "Enter git name: " gitname
read -p "Enter git email: " gitemail

git config --global user.name "$gitname"
git config --global user.email "$gitemail"

echo
echo "***** Installing dev packages *****"
echo

sudo aptitude install -y build-essential clang cmake emacs git subversion terminator vim

echo
echo "***** Installing rust *****"
echo

rustup="rustup.sh"

curl https://sh.rustup.rs -s --output "$rustup"
sudo chmod 777 "$rustup"
"./$rustup" -y
rm "$rustup"

source $HOME/.cargo/env

echo
echo "***** Installing ripgrep *****"
echo

cargo install ripgrep

echo
echo '***** Upgrading packages *****'
echo

sudo aptitude upgrade -y
