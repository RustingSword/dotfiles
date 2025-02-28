ZSH=~/.oh-my-zsh
ZSH_CUSTOM=~/.oh-my-zsh/custom

if [ -d $ZSH ]; then
    echo "oh-my-zsh is already installed at $ZSH"
    exit
fi

umask g-w,o-w

git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git $ZSH
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/larkery/zsh-histdb $HOME/.oh-my-zsh/custom/plugins/zsh-histdb

cat << 'EOF' > ~/.zshrc
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="fishy"
plugins=(git z zsh-autosuggestions zsh-syntax-highlighting zsh-histdb)
source $ZSH/oh-my-zsh.sh
EOF

zsh -l
