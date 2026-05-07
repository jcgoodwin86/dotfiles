if status is-interactive
# Commands to run in interactive sessions can go here

# Alias
abbr -a ba "brew update && brew upgrade && brew doctor"
abbr -a gl "git log --oneline --graph --decorate --color"

starship init fish | source
end
