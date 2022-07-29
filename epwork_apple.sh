#!/bin/bash
osascript<<EOF
    tell application "iTerm"
        activate
        select first window
        # Create new tab
        tell current window
            create tab with default profile
        end tell

        # 垂直分割为3个区域
        # A区 - 依赖服务区
        # B区 - 开发服务区
        # C区 - 其他指令区
        tell current session of current window
            split vertically with default profile
            split vertically with default profile
        end tell

        # 将A区水平分割为4个小区（A-1,A-2,A-3,A-4)
        tell first session of current tab of current window
            split horizontally with default profile
            split horizontally with default profile
            split horizontally with default profile
            write text "gometa"
            write text "pwd"
        end tell

        # 将A-4 垂直分割为2个区域，(A-4-1,A-4-2)
        tell fourth session of current tab of current window
            split vertically with default profile
        end tell

        # 将A-3 垂直分割为2个区域，(A-3-1,A-3-2)
        tell third session of current tab of current window
            split vertically with default profile
        end tell

        # 将A-2 垂直分割为2个区域，(A-2-1,A-2-2)
        tell second session of current tab of current window
            split vertically with default profile
        end tell

        # 将A-1 垂直分割为2个区域，(A-1-1,A-1-2)
        tell first session of current tab of current window
            split vertically with default profile
        end tell

        tell first session of current tab of current window
            write text "gometa"
            write text "ampuser"
        end tell

        tell second session of current tab of current window
            write text "gometa"
            write text "amptask"
        end tell

        tell third session of current tab of current window
            write text "gometa"
            write text "ampcore"
        end tell

        tell fourth session of current tab of current window
            write text "gometa"
            write text "ampstatistic"
        end tell

        tell fifth session of current tab of current window
            write text "gometa"
            write text "ampmanager"
        end tell

        tell sixth session of current tab of current window
            write text "sleep 10"
            write text "gometa"
            write text "ampmanagerapi"
        end tell

        tell seventh session of current tab of current window
            write text "sleep 10"
            write text "gometa"
            write text "ampcoreapi"
        end tell

        tell eighth session of current tab of current window
            write text "sleep 20"
            write text "gometa"
            write text "amphttpapi"
        end tell

        tell ninth session of current tab of current window
            write text "gometa"
            write text "pwd"
        end tell
    end tell
EOF
