sed '/^$/d' letter_from_migrationteam.txt | awk '{print "(letter  \"" $0 "\")"}'