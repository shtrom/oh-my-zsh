local pwd='%{$fg[white]%}%~%{$reset_color%}'

local prompt_sign='$'
local user='%{$fg[magenta]%}%n%{$reset_color%}'
local host=''

if [[ $UID = 0 ]]; then
	prompt_sign='%{$fg[red]%}%#%{$reset_color%}'
	user='%{$fg[red]$FX[bold]%}%n%{$FX[no-nobold]$reset_color%}'
elif [[ $USERNAME = $SHTROM_THEME_USERNAME ]]; then
	user=''
fi
if [[ ! -z "${SSH_CONNECTION}" ]]; then
	host='%{$fg[magenta]%}%m%{$reset_color%}'
fi

local user_host=${user}${host:+@$host}

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=""
# ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}✚"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[red]%}✹"
ZSH_THEME_GIT_COMMITS_AHEAD_PREFIX="+"
ZSH_THEME_GIT_COMMITS_BEHIND_PREFIX="-"
ZSH_THEME_GIT_COMMITS_STATUS_PREFIX="u"
ZSH_THEME_GIT_COMMITS_STATUS_SUFFIX=" "

ZSH_THEME_VIRTUALENV_PREFIX=" [%{$fg[magenta]%}"
ZSH_THEME_VIRTUALENV_SUFFIX="%{$reset_color%}]"

ZSH_THEME_ASYNC_PROMPT_OLD_PREFIX="%{$FX[italic]%}"
ZSH_THEME_ASYNC_PROMPT_OLD_SUFFIX="%{$FX[no-italic]%}"

PROMPT="[%{$fg[blue]%}%*%{${reset_color}%}] ${user_host:+$user_host }${pwd}${prompt_sign} "
RPROMPT='' # no initial prompt, set dynamically

function rprompt() { # async-prompt plugin
	local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
	local run_time="$(runtime)"
	local venv_info="$(virtualenv_prompt_info)" # virtualenv plugin
	local git_status="$(git_prompt_status)"
	local git_info="$(git_prompt_info)"
	local git_commits="$(git_commits_status)"

	echo "${run_time:+${run_time}s}${return_code:+ $return_code}${venv_info:+ $venv_info}${git_status:+ $git_status}${git_info:+ $git_info}${git_commits:+ $git_commits}"
}

# vim: ft=zsh
