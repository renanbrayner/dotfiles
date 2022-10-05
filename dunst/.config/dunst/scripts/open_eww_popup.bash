#!/usr/bin/env bash

DND_LOCK_FILE="$HOME/.cache/dnd-lock.lock"
LOCK_FILE="$HOME/.cache/eww-notif-popup.lock"

finish() {
	eww update noti=false; sleep 0.075
	eww close notification-popup
	rm -f ${LOCK_FILE}
}

# Run eww daemon if not running
if [[ ! `pidof eww` ]]; then
	eww daemon
	sleep 1
else
	if [[ -f "$LOCK_FILE" ]]; then
		sleep 0.275 && eww update has_another_notif=true && canberra-gtk-play -i message-new-instant
	fi

	if [[ ! -f "$DND_LOCK_FILE" ]]; then
		KILLED=false
		for pid in $(pidof -x open_eww_popup.bash); do
			if [ $pid != $$ ]; then
				kill -9 $pid
				KILLED=true
			fi
		done >/dev/null

		if ! $KILLED; then
			sleep 0.5
			eww update noti=true
			eww open notification-popup
			canberra-gtk-play -i message
			touch ${LOCK_FILE}
		fi

		# eww update has_another_notif=true
		sleep 5
		finish
		unset KILLED
		eww update has_another_notif=false
	fi
fi
