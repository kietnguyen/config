#!/bin/bash
sed -i 's/mode:\t\t.*/mode:\t\tblank/' $HOME/.xscreensaver \
                                `# switch screensave mode to blank`   && \
    xscreensaver-command -lock  `# lock screen`                       && \
    sleep 1                     `# 1s timeout`                        && \
    xset dpms force off         `# turn off monitor`
