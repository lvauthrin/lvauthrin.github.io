---
layout: post
title:  "Flutter Devices"
author: "Laurent Vauthrin"
date:   2023-02-04 20:26:54 -0500
categories: ["tech"]
tags: ["vim", "flutter"]
---

In a previous post, I went through the steps of getting setup to use Flutter in LazyVim.  By default, Flutter will be limited to building for web only.  In order to setup other devices (e.g. Android or Mac) I had to go through a few more steps.

## Android

First you will need to install the Android Command Line Tools.  We'll use this to create Android Virtual Devices (AVD).
```bash
# Install the command line tools (android-sdk is deprecated)
brew cask install android-commandlinetools
```
Once that is installed, we'll download and install a few additional components.
```bash
sdkmanager "build-tools;33.0.0" "platform-tools" "emulator" "system-images;android-33;google_apis;arm64-v8a" "platforms;android-33"
```
Once that's complete, verify everything was installed:
```bash
sdkmanager --list_installed
```
Now create AVD and try to launch it:
```bash
avdmanager create avd -n "Pixel_6" -d "pixel_6" -k "system-images;android-33;google_apis;x86_64"
# Accept all licenses
flutter doctor --android-licenses
# Use the flutter command line to launch an emulator
flutter emulators --launch Pixel_6
# Launch your app (from the root of your code repo)
flutter run
```
If everything went well, you should have seen an emulator launch as well as your Flutter app.

## Mac

You'll need XCode in order to launch a Mac app.  I installed `mas` via Brew rather than go through the App Store.
```bash
brew install mas
```
Once `mas` is installed, you can install XCode by searching for it, retrieving the "id" and running an install commandx
```bash
mas search xcode | awk '($2 == "Xcode") {print $1}' | xargs mas install
```
Then, accept the XCode licenses.
```bash
sudo xcodebuild -license
```
And finally, install Cocoa Pods.
```bash
brew install cocoapods
```

