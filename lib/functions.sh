# Shell functions for the third-party-packages module.
#/ usage: source RERUN_MODULE_DIR/lib/functions.sh command
#

# Read rerun's public functions
. $RERUN || {
    echo >&2 "ERROR: Failed sourcing rerun function library: \"$RERUN\""
    return 1
}

# Check usage. Argument should be command name.
[[ $# = 1 ]] || rerun_option_usage

# Source the option parser script.
#
if [[ -r $RERUN_MODULE_DIR/commands/$1/options.sh ]] 
then
    . $RERUN_MODULE_DIR/commands/$1/options.sh || {
        rerun_die "Failed loading options parser."
    }
fi

# - - -
# Your functions declared here.
# - - -

# Yuck! Needed to make Yum behave on CentOS 6.
export LC_ALL=C

# Set of helper functions to manage access to the file specifying the set of packages to be managed.
list-third-party-package-repositories() {
  [[ $# -ne 1 ]] && rerun_die "usage: \"list-third-party-package-repositories format\""
  grep -v "^#" $RERUN_MODULE_DIR/etc/packages | grep ":$1:" | cut -d: -f1
}

get-third-party-package-repository-owner() {
  [[ $# -ne 1 ]] && rerun_die "usage: \"get-third-party-repository-owner repository\""
  echo "$1" | cut -d: -f1 | cut -d/ -f1
}

get-third-party-package-repository-name() {
  [[ $# -ne 1 ]] && rerun_die "usage: \"get-third-party-package-repository-name repository\""
  echo "$1" | cut -d: -f1 | cut -d/ -f2
}

get-third-party-package-name() {
  [[ $# -ne 1 ]] && rerun_die "usage: \"get-third-party-package-name repository\""
  grep "^$1:" $RERUN_MODULE_DIR/etc/packages | cut -d: -f2
}

get-third-party-package-format() {
  [[ $# -ne 1 ]] && rerun_die "usage: \"get-third-party-package-format repository\""
  grep "^$1:" $RERUN_MODULE_DIR/etc/packages | cut -d: -f3
}

get-third-party-package-distributions() {
  [[ $# -ne 1 ]] && rerun_die "usage: \"get-third-party-package-distributions repository\""
  grep "^$1:" $RERUN_MODULE_DIR/etc/packages | cut -d: -f4
}

get-third-party-package-architectures() {
  [[ $# -ne 1 ]] && rerun_die "usage: \"get-third-party-package-architectures repository\""
  grep "^$1:" $RERUN_MODULE_DIR/etc/packages | cut -d: -f5
}
