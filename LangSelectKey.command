# LangSelectKey
# Change the Language Input Source Select Key from Control + Space Bar to the Right-Command key.
# Original Source By leftday.tistory.com/2
#
# Restart your Mac after running this code.

mkdir -p /Users/Shared/bin
printf '%s\n' '#!/bin/sh' \
    'hidutil property --set '"'"'{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x7000000e7,"HIDKeyboardModifierMappingDst":0x70000006d}]}'"'" \
    >/Users/Shared/bin/userkeymapping
chmod 755 /Users/Shared/bin/userkeymapping
sudo cat<<: >/Users/Shared/bin/userkeymapping.plist
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>userkeymapping</string>
    <key>ProgramArguments</key>
    <array>
        <string>/Users/Shared/bin/userkeymapping</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
</dict>
</plist>
:
sudo mv /Users/Shared/bin/userkeymapping.plist /Library/LaunchAgents/userkeymapping.plist
sudo chown root /Library/LaunchAgents/userkeymapping.plist
sudo launchctl load /Library/LaunchAgents/userkeymapping.plist