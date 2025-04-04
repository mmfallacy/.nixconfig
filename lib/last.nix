{ pkgs, lib }:

# Takes in a list
list:
with builtins;

# Returns the last element of the list.
# builtins.tail returns the elements of a list except the head
# hence the need for this custom function
elemAt list (length list - 1)
