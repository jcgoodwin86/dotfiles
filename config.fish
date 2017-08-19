set -x HOMEBREW_NO_ANALYTICS 1

#
# Colors for bobthefish
#

set -g theme_color_scheme user

set -g base01  1B2B34
set -g base02  343D46
set -g base03  4F5B66
set -g base04  546069
set -g base05  65737E
set -g base06  A7ADBA
set -g base07  CDD3DE
set -g base08  D8DEE9
set -g red     EC5F67 # 9
set -g orange  F99157 # 10
set -g yellow  F8C662 # 11
set -g green   99C794 # 12
set -g cyan    5FB3B3 # 13
set -g blue    6699CC # 14
set -g magenta C594C5 # 15
set -g violet  AB7967 # 16

set -l colorfg $base02

set __color_initial_segment_exit     $base05 $base08 --bold
set __color_initial_segment_su       $base05 $green --bold
set __color_initial_segment_jobs     $base05 $blue --bold

set __color_path                     $yellow $base03
set __color_path_basename            $yellow $base03 --bold
set __color_path_nowrite             $base02 $base08
set __color_path_nowrite_basename    $base02 $base08 --bold

set __color_repo                     $green  $colorfg
set __color_repo_work_tree           $green  $colorfg --bold
set __color_repo_dirty               $red    $colorfg
set __color_repo_staged              $orange $colorfg

set __color_vi_mode_default          $base03 $colorfg --bold
set __color_vi_mode_insert           $green  $colorfg --bold
set __color_vi_mode_visual           $red    $colorfg --bold

set __color_vagrant                  $cyan   $colorfg --bold
set __color_username                 $base02 $blue
set __color_rvm                      $base08 $colorfg --bold
set __color_virtualfish              $blue   $colorfg --bold

