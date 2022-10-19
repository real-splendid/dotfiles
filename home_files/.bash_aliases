alias l='ls -alh'
alias ..='cd ..'
alias ...='cd ../..'

dictorg() { curl "dict.org/d:$1"; }
cheat() { curl "cheat.sh/$1"; }
# h(){ howdoi $* --color; }
# h3(){ howdoi $* --color -n 3; }
# ha(){ howdoi $* --color -a; }
# ha3(){ howdoi $* --color -a -n 3; }
# h3a(){ howdoi $* --color -a -n 3; }

### ARCHIVE EXTRACTION
# usage: ex <file>
ex ()
{
  if [ -f "$1" ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
