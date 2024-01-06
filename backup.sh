# Identify the files and directories to be backed up.
# Create a timestamp to uniquely identify each backup.
# Create a backup directory if it doesn't exist.
# Copy the selected files and directories to the backup directory.
# Generate a log with information about the backup process.

#!/bin/bash

# Configuration
backup_source="stage"          # Source directory to be backed up
backup_destination="prod"     # Destination directory for backups
logfile="backup.log"            # Log file

# Create timestamp
timestamp=$(date +"%Y%m%d%H%M%S")

# Create backup directory if not exists
if [ ! -d "$backup_destination" ]; then
    mkdir -p "$backup_destination"
fi

# Perform backup
cp -r "$backup_source" "$backup_destination/backup_$timestamp"

# Log the backup details
echo "Backup completed on $(date) - Backup_$timestamp" >> "$logfile"

echo "Backup process completed successfully."