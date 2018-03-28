
local user='%{$fg[magenta]%}%n@%{$fg[magenta]%}%m%{$reset_color%}'
local pwd='%{$fg[blue]%}%~%{$reset_color%}'

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

PROMPT="${user} ${pwd}$ "
RPROMPT='' # no initial prompt, set dynamically

function rprompt() {
	local return_code='%(?..%{$fg[red]%}%? ↵%{$reset_color%})'
	local git_info='$(git_prompt_info)' # gitfast plugin
	local venv_info='$(virtualenv_prompt_info)' # virtualenv plugin

	echo "${return_code}${venv_info} ${git_info}"
}


# vim: ft=zsh
