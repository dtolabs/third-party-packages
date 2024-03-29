# Generated by stubbs:add-option. Do not edit, if using stubbs.
# Created: Thu Dec  6 16:27:38 PST 2012
#
#/ usage: third-party-packages:get-downloads [ --working-dir </tmp/dtolabs/third-party-packages>] 

# _rerun_options_parse_ - Parse the command arguments and set option variables.
#
#     rerun_options_parse "$@"
#
# Arguments:
#
# * the command options and their arguments
#
# Notes:
# 
# * Sets shell variables for any parsed options.
# * The "-?" help argument prints command usage and will exit 2.
# * Return 0 for successful option parse.
#
rerun_options_parse() {
    
    while [ "$#" -gt 0 ]; do
        OPT="$1"
        case "$OPT" in
            --working-dir) rerun_option_check $# ; WORKING_DIR=$2 ; shift ;;
            # help option
            -?)
                rerun_option_usage
                exit 2
                ;;
            # end of options, just arguments left
            *)
              break
        esac
        shift
    done

    # Set defaultable options.
    [ -z "$WORKING_DIR" ] && WORKING_DIR="/tmp/dtolabs/third-party-packages"
    # Check required options are set

    # If option variables are declared exportable, export them.

    #
    return 0
}


# Initialize the options variables to null.
WORKING_DIR=


