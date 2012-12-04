# 
# Shell functions for third-party packaging commands
#


# Read rerun's public functions
. $RERUN || {
    echo >&2 "ERROR: Failed sourcing rerun function library: \"$RERUN\""
    return 1
}


# ----------------------------
# Your functions declared here.
#

# Set of helper functions to manage access to the file specifying the set of packages to be managed.
list-third-party-package-repositories() {
  grep -v "^#" $RERUN_MODULE_DIR/etc/packages
}

get-third-party-package-repository-owner() {
  [[ $# -ne 1 ]] && rerun_die "usage: \"get-third-party-repository-owner repository\""
  echo "$1" | cut -d/ -f1
}

get-third-party-package-repository-name() {
  [[ $# -ne 1 ]] && rerun_die "usage: \"get-third-party-package-repository-name repository\""
  echo "$1" | cut -d/ -f2
}
