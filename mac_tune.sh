#Inspired by
#https://gist.github.com/brandonb927/3195465
#https://github.com/hjuutilainen/dotfiles/blob/master/bin/osx-user-defaults.sh
#https://github.com/tibr/dotfiles/blob/master/osx/set-defaults.sh

#Dock

#Wipe all (default) app icons from the Dock
defaults write com.apple.dock persistent-apps -array

#Setting the icon size of Dock items to 16 pixels for optimal size/screen-realestate
defaults write com.apple.dock tilesize -int 16

#Speeding up Mission Control animations and grouping windows by application
defaults write com.apple.dock expose-animation-duration -float 0.1
defaults write com.apple.dock "expose-group-by-app" -bool true

#Set Dock to auto-hide and remove the auto-hiding delay
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0

#Set Dock position to the right
defaults write com.apple.dock orientation right

#Set the Scale Effect to Minimize Windows
defaults write com.apple.dock mineffect -string scale

#Finder

#Show hidden files in Finder by default
defaults write com.apple.Finder AppleShowAllFiles -bool true

#Show dotfiles in Finder by default
defaults write com.apple.finder AppleShowAllFiles TRUE

#Show all filename extensions in Finder by default
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

#Show status bar in Finder by default
defaults write com.apple.finder ShowStatusBar -bool true

#Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

#Use list view in all Finder windows by default
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

#Enable snap-to-grid for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

#Keyboard

#Setting a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 0

#Setting trackpad & mouse speed to a reasonable number
defaults write -g com.apple.trackpad.scaling 2
defaults write -g com.apple.mouse.scaling 2.5

#Turn off Fn keys
defaults write -g com.apple.keyboard.fnState -boolean true

#Enabling full keyboard access for all controls (enable Tab in modal dialogs, menu windows, etc.)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

#Add Czech keyboard
#defaults write com.apple.HIToolbox AppleEnabledInputSources -array-add '<dict><key>InputSourceKind</key><string>Keyboard Layout</string><key>KeyboardLayout ID</key><integer>30778</integer><key>KeyboardLayout Name</key><string>Czech-QWERTY</string></dict>'

#Mouse

#Tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

#Tap with two fingers to emulate right click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true

#Spotlight
sudo defaults write /.Spotlight-V100/VolumeConfiguration Exclusions -array "/Volumes" "/Users/MicTech/Dropbox/"

#Others

#Save to disk, rather than iCloud, by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

#Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

#Disable the menubar transparency
defaults write com.apple.universalaccess reduceTransparency -bool true

#Disable Automatic Spell Checker
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false

#Hostname
sudo scutil --set ComputerName MicTech
sudo scutil --set HostName MicTech
sudo scutil --set LocalHostName MicTech
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string MicTech

#Security
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Enable calculate all sizes
/usr/libexec/PlistBuddy "$HOME/Library/Preferences/com.apple.finder.plist" -c 'Delete "StandardViewSettings:ExtendedListViewSettings:calculateAllSizes" bool'
/usr/libexec/PlistBuddy "$HOME/Library/Preferences/com.apple.finder.plist" -c 'Add "StandardViewSettings:ExtendedListViewSettings:calculateAllSizes" bool true'
/usr/libexec/PlistBuddy "$HOME/Library/Preferences/com.apple.finder.plist" -c 'Delete "StandardViewSettings:ListViewSettings:calculateAllSizes" bool'
/usr/libexec/PlistBuddy "$HOME/Library/Preferences/com.apple.finder.plist" -c 'Add "StandardViewSettings:ListViewSettings:calculateAllSizes" bool true'
