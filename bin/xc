#!/usr/bin/env ruby

# Open xcode without any previous projects being opened as well.
# We first look for a workspace, then a project in the current directory, opening the first that is found.

f = []
f.concat Dir["*.xcworkspace"]
f.concat Dir["*.xcodeproj"]

if f.length > 0
  puts "opening #{f.first}"
  `open -a /Applications/Xcode.app #{f.first} --args -ApplePersistenceIgnoreState YES`
  exit 0
end

puts "No Xcode projects found"
exit 1
