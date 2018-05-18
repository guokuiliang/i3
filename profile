# /etc/profile

# Set our umask
umask 022

# Append our default paths
appendpath () {
    case ":$PATH:" in
        *:"$1":*)
            ;;
        *)
            PATH="${PATH:+$PATH:}$1"
    esac
}

appendpath '/usr/local/sbin'
appendpath '/usr/local/bin'
appendpath '/usr/bin'
unset appendpath

export PATH

# Load profiles from /etc/profile.d
if test -d /etc/profile.d/; then
	for profile in /etc/profile.d/*.sh; do
		test -r "$profile" && . "$profile"
	done
	unset profile
fi

# Source global bash config
if test "$PS1" && test "$BASH" && test -z ${POSIXLY_CORRECT+x} && test -r /etc/bash.bashrc; then
	. /etc/bash.bashrc
fi

# Termcap is outdated, old, and crusty, kill it.
unset TERMCAP

# Man is much better than us at figuring this out
unset MANPATH

ibus-daemon --xim -d

xrandr --output DVI-D-1-1 --off --output VIRTUAL1 --off --output HDMI-1-2 --off --output HDMI1 --off --output VGA-1-2 --mode 1920x1080 --pos 0x0 --rotate normal --output VGA1 --mode 1920x1080 --pos 1920x0 --rotate normal

