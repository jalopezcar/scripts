#!/bin/bash

# MUST BE RUN AS ROOT

set -x

/usr/local/McAfee/AntiMalware/AntiMalwarePluginControl unload
/usr/local/McAfee/fmp/bin/FMPEntPluginControl unload
/usr/local/McAfee/MNE/bin/MNEPluginControl unload

/Library/McAfee/agent/scripts/ma stop

( crontab -l | grep -v "McAfee" ) | crontab -

rm -rf /Library/Receipts/cma.pkg
rm -rf /Library/StartupItems/ma
rm -rf /Library/StartupItems/cma

rm -rf /etc/ma.d
rm -rf /etc/cma.d

rm -rf /Library/LaunchAgents/com.mcafee*
rm -rf /Library/LaunchDaemons/com.mcafee*

rm -rf /private/var/db/receipts/com.mcafee*

rm -rf /Library/Preferences/com.mcafee*

rm -rf /Library/McAfee
rm -rf /var/McAfee
rm -rf /usr/local/McAfee

rm -rf /Library/Application\ Support/McAfee

rm -rf /Applications/McAfee\ Endpoint\ Security\ for\ Mac.app
rm -rf /Applications/Utilities/McAfee\ ePO\ Remote\ Provisioning\ Tool.app

killall fmpd
killall MNEHost
killall VShieldScanner
killall VShieldScanManager
killall VShieldUpdate
killall VShieldService
killall Menulet
killall "McAfee Reporter"
killall McAfeeEpoRemoteProvisioning
killall "McAfee Agent Status Monitor"
killall "McAfee Endpoint Security for Mac"

/usr/sbin/pkgutil --forget comp.nai.cmamac
dscl . -delete /Users/mfe
dscl . -delete /groups/mfe

