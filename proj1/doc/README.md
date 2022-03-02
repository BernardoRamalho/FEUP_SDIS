# How to Run
### Normal Version
1. Open 5 separate terminal windows.
2. On 4 of them enter the scripts/ directory and on the other enter src/
3. On the one that is in src/build start the rmiregistry: "start rmiregistry" on windows or "rmiregistry &" on linux and on mac "rmiregistry" .
4. On any one of the other 4 run h cleanupAll.sh && sh compile.sh
5. In 3 of them run one of the followin commands:
    - sh peer.sh 1.0 0 clientPeer0 224.0.0.1 3456 224.0.0.2 3457 224.0.0.3 3458
    - sh peer.sh 1.0 1 clientPeer1 224.0.0.1 3456 224.0.0.2 3457 224.0.0.3 3458
    - sh peer.sh 1.0 2 clientPeer2 224.0.0.1 3456 224.0.0.2 3457 224.0.0.3 3458
6. In the one thats left run sh test.sh clientPeer0 BACKUP ../testImage.jpeg 2 (or for the matter any path to a file on your computer)
7. On the TestApp Run sh test.sh clientPeer0 RESTORE ../testImage.jpeg

8. Start yet another peer on scripts/ folder:
    - sh peer.sh 1.0 3 clientPeer3 224.0.0.1 3456 224.0.0.2 3457 224.0.0.3 3458
9. On the TestApp Run sh test.sh clientPeer1 RECLAIM 0 (the number represets the maximum amount of memory a peer can have so try with 130 too)

### Enhanced Version
For testing the enhancements we sugest you follow the next steps.

1. Open 7 separate terminal windows.
2. On 6 of them enter the scripts/ directory and on the one thats left enter src/build.
3. On the one that is in src/build start the rmiregistry: "start rmiregistry" on windows or "rmiregistry &" on linux and on mac "rmiregistry" .
4. On any one of the other 5 run sh cleanupAll.sh && sh compile.sh
5. In 4 of them run one of the followin commands:
    - sh peer.sh 2.0 0 clientPeer0 224.0.0.1 3456 224.0.0.2 3457 224.0.0.3 3458
    - sh peer.sh 2.0 1 clientPeer1 224.0.0.1 3456 224.0.0.2 3457 224.0.0.3 3458
    - sh peer.sh 2.0 2 clientPeer2 224.0.0.1 3456 224.0.0.2 3457 224.0.0.3 3458
    - sh peer.sh 2.0 3 clientPeer3 224.0.0.1 3456 224.0.0.2 3457 224.0.0.3 3458
    - sh peer.sh 2.0 4 clientPeer4 224.0.0.1 3456 224.0.0.2 3457 224.0.0.3 3458
6. In the one thats left run sh test.sh clientPeer0 BACKUP ../testImage.jpeg 2 ( **You will probably notice that the chunks are now with the desired replication degree even tho there are more peers.** )

7. On the TestApp Run sh test.sh clientPeer0 RESTORE ../testImage.jpeg (**The chunk data is now sent over TCP instead of being sent over a multicast channel.**)

8. Stop ClientPeer4 (ctrl + c on the terminal running the process)
9. On the TestApp Run sh test.sh clientPeer0 DELETE ../testImage.jpeg
10. On the terminal which was running clientPeer4 run sh peer.sh 2.0 4 clientPeer5 224.0.0.1 3456 224.0.0.2 3457 224.0.0.3 3458 (this will create a Peer5 which has the same folder as 4)
11. Verify that the chunks on Peer4 folder got deleted (**Our Peer enhanced asks the other peers for deleted chunks and procedes to delete them**)

##### Extra Notes

Feel free to create peers on both versions and test. Our enhanced peers work with both normal and enhanced versions...
