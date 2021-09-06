alias randman='dir="/bin"; man $(ls $dir |sed -n "$(echo $(( $RANDOM % $(ls $dir |wc -l | awk "{print $1;}") + 1 )))p")
