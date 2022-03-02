#!/bin/bash

cd ../src/build

osascript -e 'tell application "Terminal"' -e 'do script "cd '"$(pwd) && rmiregistry"\" -e 'end tell'

osascript -e 'tell application "Terminal"' -e 'do script "cd '"$(pwd) && java Peer.Peer 2.0 0 clientPeer0 224.0.0.1 3456 224.0.0.2 3457 224.0.0.3 3458"\" -e 'end tell'

osascript -e 'tell application "Terminal"' -e 'do script "cd '"$(pwd) && java Peer.Peer 2.0 1 clientPeer1 224.0.0.1 3456 224.0.0.2 3457 224.0.0.3 3458"\" -e 'end tell'

osascript -e 'tell application "Terminal"' -e 'do script "cd '"$(pwd) && java Peer.Peer 2.0 2 clientPeer2 224.0.0.1 3456 224.0.0.2 3457 224.0.0.3 3458"\" -e 'end tell'

sleep 1

java App.TestApp clientPeer0 BACKUP ../testImage.jpeg 2

sleep 2

java App.TestApp clientPeer0 RESTORE ../testImage.jpeg

sleep 3

osascript -e 'tell application "Terminal"' -e 'do script "cd '"$(pwd) && java Peer.Peer 2.0 3 clientPeer3 224.0.0.1 3456 224.0.0.2 3457 224.0.0.3 3458"\" -e 'end tell'

sleep .5

java App.TestApp clientPeer1 RECLAIM 130