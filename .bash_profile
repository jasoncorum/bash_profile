
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

export PATH=/usr/local/bin:$PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

#  Original config by Mike Stewart - http://MediaDoneRight.com
#  Customization by Ken Croken

#  SETUP CONSTANTS
#  Bunch-o-predefined colors.  Makes reading code easier than escape sequences.
#  I don't remember where I found this.  o_O

# Reset
Color_Off="\[\033[0m\]"       # Text Reset

# Regular Colors
Black="\[\033[0;30m\]"        # Black
Red="\[\033[0;31m\]"          # Red
Green="\[\033[0;32m\]"        # Green
Yellow="\[\033[0;33m\]"       # Yellow
Blue="\[\033[0;34m\]"         # Blue
Purple="\[\033[0;35m\]"       # Purple
Cyan="\[\033[0;36m\]"         # Cyan
White="\[\033[0;37m\]"        # White

# Bold
BBlack="\[\033[1;30m\]"       # Black
BRed="\[\033[1;31m\]"         # Red
BGreen="\[\033[1;32m\]"       # Green
BYellow="\[\033[1;33m\]"      # Yellow
BBlue="\[\033[1;34m\]"        # Blue
BPurple="\[\033[1;35m\]"      # Purple
BCyan="\[\033[1;36m\]"        # Cyan
BWhite="\[\033[1;37m\]"       # White

# Underline
UBlack="\[\033[4;30m\]"       # Black
URed="\[\033[4;31m\]"         # Red
UGreen="\[\033[4;32m\]"       # Green
UYellow="\[\033[4;33m\]"      # Yellow
UBlue="\[\033[4;34m\]"        # Blue
UPurple="\[\033[4;35m\]"      # Purple
UCyan="\[\033[4;36m\]"        # Cyan
UWhite="\[\033[4;37m\]"       # White

# Background
On_Black="\[\033[40m\]"       # Black
On_Red="\[\033[41m\]"         # Red
On_Green="\[\033[42m\]"       # Green
On_Yellow="\[\033[43m\]"      # Yellow
On_Blue="\[\033[44m\]"        # Blue
On_Purple="\[\033[45m\]"      # Purple
On_Cyan="\[\033[46m\]"        # Cyan
On_White="\[\033[47m\]"       # White

# High Intensty
IBlack="\[\033[0;90m\]"       # Black
IRed="\[\033[0;91m\]"         # Red
IGreen="\[\033[0;92m\]"       # Green
IYellow="\[\033[0;93m\]"      # Yellow
IBlue="\[\033[0;94m\]"        # Blue
IPurple="\[\033[0;95m\]"      # Purple
ICyan="\[\033[0;96m\]"        # Cyan
IWhite="\[\033[0;97m\]"       # White

# Bold High Intensty
BIBlack="\[\033[1;90m\]"      # Black
BIRed="\[\033[1;91m\]"        # Red
BIGreen="\[\033[1;92m\]"      # Green
BIYellow="\[\033[1;93m\]"     # Yellow
BIBlue="\[\033[1;94m\]"       # Blue
BIPurple="\[\033[1;95m\]"     # Purple
BICyan="\[\033[1;96m\]"       # Cyan
BIWhite="\[\033[1;97m\]"      # White

# High Intensty backgrounds
On_IBlack="\[\033[0;100m\]"   # Black
On_IRed="\[\033[0;101m\]"     # Red
On_IGreen="\[\033[0;102m\]"   # Green
On_IYellow="\[\033[0;103m\]"  # Yellow
On_IBlue="\[\033[0;104m\]"    # Blue
On_IPurple="\[\033[10;95m\]"  # Purple
On_ICyan="\[\033[0;106m\]"    # Cyan
On_IWhite="\[\033[0;107m\]"   # White

# Various variables you might want for your PS1 prompt instead
date="\d"
time12h="\T"
time12a="\@"
pathFull="\w"
pathshort="\W"
newLine="\n"

# displays git branch
function git_dirty() {
  [[ $(git status --porcelain 2> /dev/null) != "" ]] && echo "*"
}

function parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/(\1$(git_dirty))/"    
}

# function color_branch() {
#   local git_status="$(git status --porcelain 2> /dev/null)"

#   if [[ ! $git_status =~ "" ]]; then
#     echo -e "$IRed"

#   else 
#     echo -e "$IGreen"
#  fi 
# }

# function git_branch {
#   local git_status="$(git status 2> /dev/null)"
#   local pattern="^On branch ([^${IFS}]*)"

#   if [[ $git_status =~ $pattern ]]; then
#     local branch=${BASH_REMATCH[1]}
#     echo "($branch)"
#   fi
# }


# sets prompt colors
export PS1="$BBlue\u $BBlue$pathFull$BRed\$(parse_git_branch)$IWhite $ $BIBlack"

# sets colors for background and ls
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# allows for color in ls, list hidden files & directories, and add slash to file list
alias ls='ls -laGF'

# adds "verbose" to mv showing the update
alias mv='mv -v'

# Setting for Postgres.app programs
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.3/bin
