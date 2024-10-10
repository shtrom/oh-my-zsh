local pwd='%{$fg[white]%}%~%{$reset_color%}'

local user='%{$fg[magenta]%}%n%{$reset_color%}'
local host=''

if [[ $UID == 0 ]]; then
	user='%{${fg[red]}${FX[bold]}%}%n%{${FX[no-nobold]}${reset_color}%}'
elif [[ $USERNAME == $SHTROM_THEME_USERNAME ]]; then
	user=''
fi
if [[ ! -z "${SSH_CONNECTION}" ]]; then
	host='%{${fg[magenta]}%}%m%{${reset_color}%}'
fi

local user_host=${user}${host:+@$host}

ZSH_THEME_ASYNC_PROMPT_OLD_PREFIX="%{${FX[italic]}%}"
ZSH_THEME_ASYNC_PROMPT_OLD_SUFFIX="%{${FX[no-italic]}%}"

ZSH_THEME_AWS_PREFIX="<%{${fg[cyan]}%}"
ZSH_THEME_AWS_SUFFIX="%{${reset_color}%}>"

ZSH_THEME_GIT_PROMPT_PREFIX="%{${fg[green]}%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{${reset_color}%}"
ZSH_THEME_GIT_PROMPT_DIRTY=""
# ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_ADDED="%{${fg[green]}%}✚"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{${fg[red]}%}✹"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{${fg[red]}%}✹"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} %{%G✖%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%} %{%G➜%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%} %{%G═%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} %{%G✭%}"
ZSH_THEME_GIT_COMMITS_AHEAD_PREFIX="+"
ZSH_THEME_GIT_COMMITS_BEHIND_PREFIX="-"

ZSH_PYENV_NO_SYSTEM=true
ZSH_THEME_PYENV_PREFIX="%{${fg[yellow]}%}Py%{${reset_color}%}%{${fg[magenta]}%}"
ZSH_THEME_PYENV_SUFFIX="%{${reset_color}%}"
ZSH_THEME_VIRTUALENV_PREFIX="[%{${fg[magenta]}%}"
ZSH_THEME_VIRTUALENV_SUFFIX="%{${reset_color}%}]"

PROMPT="[%{${fg[blue]}%}%*%{${reset_color}%}] ${user_host:+${user_host} }${pwd}%(!.%{${fg[red]}%}#%{${reset_color}%}.$) "

function rprompt { # async-prompt plugin
	local return_code='%(?..%{${fg[red]}%}%? ↵%{${reset_color}%})'
	local run_time="$(runtime)"

	local aws_prompt='$(aws_prompt_info)${AWS_DEFAULT_REGION:+@${AWS_DEFAULT_REGION}}'
	local git_commits='$(git_commits_ahead)$(git_commits_behind)'
	local git_info='$(git_prompt_info)'
	local git_status='$(git_prompt_status)'
	local pyenv_info='$(pyenv_prompt_info)' # pyenv plugin
	local venv_info='$(virtualenv_prompt_info)' # virtualenv plugin

	echo "${run_time:+${run_time}s}${return_code:+ ${return_code}} ${aws_prompt} ${pyenv_info} ${venv_info} ${git_status} ${git_info} ${git_commits}"
}
RPROMPT=$(rprompt)

# vim: ft=zsh
