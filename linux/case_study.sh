read -p "Enter yes or no: " BOB
case "$BOB" in
[yY] | [yY][eE][sS])
echo "You answered yes."
;;

[nN] | [nN][oO])
echo "You answered no"
;;

*)
echo "Invalid, broski"
;;

esac
