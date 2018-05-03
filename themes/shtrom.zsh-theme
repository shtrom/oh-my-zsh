
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

ZSH_THEME_ASYNC_PROMPT_OLD_PREFIX="%{$FX[italic]%}"
ZSH_THEME_ASYNC_PROMPT_OLD_SUFFIX="%{$FX[no-italic]%}"

PROMPT="${user} ${pwd}$ "
RPROMPT='' # no initial prompt, set dynamically

function rprompt() { # async-prompt plugin
	local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
	local venv_info="$(virtualenv_prompt_info)" # virtualenv plugin
	local git_status="$(git_prompt_status)"
	local git_info="$(git_prompt_info)"
	local git_commits="$(git_commits_status)"

	echo "${return_code:+$return_code}${venv_info:+ $venv_info}${git_status:+ $git_status}${git_info:+ $git_info}${git_commits:+ $git_commits}"
}


# vim: ft=zsh
