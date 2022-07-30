#!/bin/bash
#Version:0.1

funcShowErrorOperation() {
  echo "\033[1m 您的操作有误 \033[0m"
  read -p "请输入任意键继续"
  funcShowMainMenu
}

funcShowSuccessOperation() {
  echo "\033[1m 操作执行完毕，请继续操作。如需退出请 ctrl+c  \033[0m"
  read -p "请输入任意键继续"
  funcShowMainMenu
}

# funcShowMainMenu 主菜单显示
funcShowMainMenu() {
  clear
  echo "\033[37m----------------------------------------\033[0m"
  echo "\033[1m 欢迎使用 Jay 的工具小助手 \033[0m"
  echo "\033 1. git 批量清理 生成 \033[0m"
  echo "\033[37m----------------------------------------\033[0m"

  funcSelectMenu
}

funcSelectMenu() {
  read -p "请选择需要执行的指令：" jtoolCommand
  echo "\033[37m 你选择了 $jtoolCommand"

  case $jtoolCommand in
  1)
    read -p "请输入需要删除的 git 分支前缀：" jtoolWaitDeleteBranch

    if [-z $ampModelName ]; then
      echo "\033[37m 输入不能为空"
      funcShowErrorOperation
    else
      # 删除所有分支（排除main分支）
      git branch | grep $jtoolWaitDeleteBranch | grep -v "main\|master" | xargs git branch -D
      funcShowSuccessOperation
    fi
    ;;

  *) funcShowErrorOperation ;;
  esac
}

funcShowMainMenu
