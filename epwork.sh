#!/bin/bash
#Version:0.1

ECOPLANTS_META_PROJECT=/Users/chengxingjie/Desktop/ecoplants_projects/meta

funcShowErrorOperation() {
  echo "\033[1m 您的操作有误 \033[0m"
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
  echo "\033 1. amp rpc 生成  \033[0m"
  echo "\033 2. model 生成 \033[0m"
  echo "\033[37m----------------------------------------\033[0m"

  funcSelectMenu
}

# funcSelectMenu 选择菜单
funcSelectMenu() {
  read -p "请选择菜单：" mainMenuCode
  echo "\033[37m 你选择了 $mainMenuCode"

  case $mainMenuCode in
  1)
    funcShowAmpRpcMenu
    ;;
    #     2) echo "选择model模式"
    #     funcWithModel
    #     ;;
  *) funcShowErrorOperation ;;
  esac
}

# funcShowAmpRpcMenu 展示AMP RPC生成
funcShowAmpRpcMenu() {
  clear
  echo "\033[37m----------------------------------------\033[0m"
  echo "\033[1m 你选择了生成 AMP RPC 代码 \033[0m"
  echo "\033 1. 生成Be RPC  \033[0m"
  echo "\033 2. 生成Api RPC  \033[0m"
  echo "\033 3. UserApp RPC  \033[0m"
  echo "\033 4. CoreApp RPC  \033[0m"
  echo "\033 5. ManagerApp RPC  \033[0m"
  echo "\033 6. StatisticApp RPC  \033[0m"
  echo "\033 7. TaskApp RPC  \033[0m"
  echo "\033 8. Manager Api RPC  \033[0m"
  echo "\033 9. Core Api RPC  \033[0m"
  echo "\033 10. Statistic Api RPC  \033[0m"
  echo "\033 11. Amp Http Api  \033[0m"
  echo "\033 12. Amp Http File Api  \033[0m"
  echo "\033 13. Data Api RPC  \033[0m"
  echo "\033 14. Data Depend Api RPC  \033[0m"
  echo "\033[37m----------------------------------------\033[0m"

  funcSelectAmpRpc
}

funcSelectAmpRpc() {
  read -p "请选择需要生成的RPC：" ampRpcGenerate
  echo "\033[37m 你选择了 $ampRpcGenerate"

  case $ampRpcGenerate in
  1)
    cd $ECOPLANTS_META_PROJECT
    eptools rpc -c services -p amp -s user_app
    eptools rpc -c services -p amp -s core_app
    eptools rpc -c services -p amp -s manager_app
    eptools rpc -c services -p amp -s statistic_app
    eptools rpc -c services -p amp -s task_app
    funcShowSuccessOperation
    ;;
  2)
    cd $ECOPLANTS_META_PROJECT
    eptools rpc -c apis -p amp -s core_api
    eptools rpc -c apis -p amp -s manager_api
    eptools rpc -c apis -p amp -s statistic_api
    eptools rpc -c apis -p amp -s data_api
    eptools rpc -c apis -p amp -s data_depend_api
    eptools api -p amp -s amp_http
    eptools api -p amp -s amp_file_http
    funcShowSuccessOperation
    ;;
  3)
    cd $ECOPLANTS_META_PROJECT
    eptools rpc -c services -p amp -s user_app
    funcShowSuccessOperation
    ;;
  4)
    cd $ECOPLANTS_META_PROJECT
    eptools rpc -c services -p amp -s core_app
    funcShowSuccessOperation
    ;;
  5)
    cd $ECOPLANTS_META_PROJECT
    eptools rpc -c services -p amp -s manager_app
    funcShowSuccessOperation
    ;;
  6)
    cd $ECOPLANTS_META_PROJECT
    eptools rpc -c services -p amp -s statistic_app
    funcShowSuccessOperation
    ;;
  7)
    cd $ECOPLANTS_META_PROJECT
    eptools rpc -c services -p amp -s task_app
    funcShowSuccessOperation
    ;;
  8)
    cd $ECOPLANTS_META_PROJECT
    eptools rpc -c apis -p amp -s core_api
    funcShowSuccessOperation
    ;;
  9)
    cd $ECOPLANTS_META_PROJECT
    eptools rpc -c apis -p amp -s manager_api
    funcShowSuccessOperation
    ;;
  10)
    cd $ECOPLANTS_META_PROJECT
    eptools rpc -c apis -p amp -s statistic_api
    funcShowSuccessOperation
    ;;
  11)
    cd $ECOPLANTS_META_PROJECT
    eptools api -p amp -s amp_http
    funcShowSuccessOperation
    ;;
  9)
    cd $ECOPLANTS_META_PROJECT
    eptools api -p amp -s amp_file_http
    funcShowSuccessOperation
    ;;
  9)
    cd $ECOPLANTS_META_PROJECT
    eptools rpc -c apis -p amp -s data_api
    funcShowSuccessOperation
    ;;
  9)
    cd $ECOPLANTS_META_PROJECT
    eptools rpc -c apis -p amp -s data_depend_api
    funcShowSuccessOperation
    ;;
  *) funcShowErrorOperation ;;
  esac
}

funcShowMainMenu