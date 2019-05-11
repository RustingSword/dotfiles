ZSH=~/.oh-my-zsh
ZSH_CUSTOM=~/.oh-my-zsh/custom

if [ -d $ZSH ]; then
    echo "oh-my-zsh is already installed at $ZSH"
    exit
fi

umask g-w,o-w

git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git $ZSH
sed -i "s/^RPROMPT=.*/RPROMPT='\${return_status} \$(date \"+%F %T\")%{\$reset_color%}'/" $ZSH/themes/fishy.zsh-theme
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

cat << 'EOF' > ~/.zshrc
export ZSH="/home/orz/.oh-my-zsh"
ZSH_THEME="fishy"
plugins=(git z zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
EOF

zsh -l
