DIALOG_WIDTH=70

border_edge() {
  size=$((DIALOG_WIDTH-2))
  printf "$1"
  printf "%0.s═" $(seq 1 $size)
  printf "$2\n"
}

start_dialog() {
  border_edge "╔" "╗"
}

end_dialog() {
  border_edge "╚" "╝"
}

separator() {
  border_edge "╠" "╣"
}

caption() {
  message "$1"
  separator
}

message() {
  msg=$1
  border="║"
  green=$2
  spaces=$(($DIALOG_WIDTH-${#1}-4))

  if [[ "$green" = true ]]; then
    printf "$border \e[32m$msg\e[0m"
  else
    printf "$border $msg"
  fi
  printf "%0.s " $(seq 1 $spaces)
  printf " $border\n"
}

# usage:
# start_dialog
# caption "Welcome to the workshop"
# message "Another thing to do:"
# message ""
# message "  $ another important" true
# message ""
# end_dialog
