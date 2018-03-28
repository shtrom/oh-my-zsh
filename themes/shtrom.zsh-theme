
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

PROMPT="${user} ${pwd}$ "
RPROMPT='' # no initial prompt, set dynamically

function rprompt() {
	local return_code='%(?..%{$fg[red]%}%? ↵%{$reset_color%})'
	local git_info='$(git_commits_status)$(git_prompt_status)%{$reset_color%}$(git_prompt_info)%{$reset_color%}'

	echo "${return_code} ${git_info}"
}


# vim: ft=zsh
