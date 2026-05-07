if status is-interactive
# Commands to run in interactive sessions can go here

# Alias
alias ba="brew update && brew upgrade && brew doctor"
alias gl="git log --oneline --graph --decorate --color"

starship init fish | source
end
