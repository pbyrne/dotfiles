#!/bin/bash

# Stolen from https://github.com/skwp/dotfiles/blob/master/osx

# Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Enable subpixel font smoothing on non-Apple LCDs
defaults write NSGlobalDomain AppleFontSmoothing -int 2

# Enable the 2D Dock
defaults write com.apple.dock no-glass -bool true

# Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool false

# move dock to the left
defaults write com.apple.dock orientation left

# put the Dock in the corner, not center
defaults write com.apple.Dock pinning end

# restart the Dock
killall Dock

# Disable menu bar transparency
defaults write NSGlobalDomain AppleEnableMenuBarTransparency -bool false

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Set Help Viewer windows to non-floating mode
defaults write com.apple.helpviewer DevMode -bool true

# Enable tap to click (Trackpad)
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
# and the login screen
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Trackpad: swipe between pages with three fingers
defaults write NSGlobalDomain AppleEnableSwipeNavigateWithScrolls -bool true
defaults -currentHost write NSGlobalDomain com.apple.trackpad.threeFingerHorizSwipeGesture -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerHorizSwipeGesture -int 1

# Enable Safari’s debug menu
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

# Only use UTF-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4

# Show the ~/Library folder
chflags nohidden ~/Library

# Use current directory as default search scope in Finder
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Enable snap-to-grid for desktop icons
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

# Make Safari’s search banners default to Contains instead of Starts With
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

# Disable the Ping sidebar in iTunes
defaults write com.apple.iTunes disablePingSidebar -bool true

# copy email addresses in Mail as foo@example.com instead of <Foo User> foo@example.com
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

# do not restart the prior open tabs when opening Terminal
defaults write com.apple.Terminal NSQuitAlwaysKeepsWindows -int 0

# add ~/Dropbox/Action to the list of PDF printing locations
ln -sf ~/Dropbox/Action ~/Library/PDF\ Services/

