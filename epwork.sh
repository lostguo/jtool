#!/bin/bash
#Version:0.1

ECOPLANTS_META_PROJECT=/Users/chengxingjie/Desktop/ecoplants_projects/meta
JTOOL_DIR_PATH=/Users/chengxingjie/Desktop/ecoplants_projects/jtool

ampApps[1]="user_app"
ampApps[2]="core_app"
ampApps[3]="manager_app"
ampApps[4]="statistic_app"
ampApps[5]="task_app"
ampApps[6]="core_api"
ampApps[7]="manager_api"
ampApps[8]="statistic_api"
ampApps[9]="amp_http"
ampApps[10]="amp_file_http"
ampApps[11]="amp_rest"
ampApps[12]="data_api"
ampApps[13]="data_depend_api"

ampArgocdEnv[1]="staging"
ampArgocdEnv[2]="autopush"
ampArgocdEnv[3]="preprod"
ampArgocdEnv[4]="prod"

#ampAppsScope[]

declare -A ampAppsScope
ampAppsScope[1]="services"
ampAppsScope[2]="services"
ampAppsScope[3]="services"
ampAppsScope[4]="services"
ampAppsScope[5]="services"
ampAppsScope[6]="apis"
ampAppsScope[7]="apis"
ampAppsScope[8]="apis"
ampAppsScope[9]="apis"
ampAppsScope[10]="apis"
ampAppsScope[11]="apis"
ampAppsScope[12]="apis"
ampAppsScope[13]="apis"

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
  echo "\033 1. amp model 生成 \033[0m"
  echo "\033 2. amp rpc 生成  \033[0m"
  echo "\033 3. amp run 批量启动服务\033[0m"
  echo "\033 4. amp argocd 服务部署 \033[0m"
  echo "\033[37m----------------------------------------\033[0m"

  funcSelectMenu
}

# funcSelectMenu 选择菜单
funcSelectMenu() {
  read -p "请选择菜单：" mainMenuCode
  echo "\033[37m 你选择了 $mainMenuCode"

  case $mainMenuCode in
  1)
    funcSelectModelToGenerate
    ;;
  2)
    funcShowAmpRpcMenu
    ;;
  3)
    funcAMPRun
    ;;
  4)
    funcShowAmpArgocd
    ;;
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

# funcSelectMenu 选择要生成的 AMP 代码
funcSelectAmpRpc() {
  read -p "请选择需要生成的RPC：" ampRpcGenerate
  echo "\033[37m 你选择了 $ampRpcGenerate"

  case $ampRpcGenerate in
  1)
    cd $ECOPLANTS_META_PROJECT || exit
    eptools rpc -c services -p amp -s user_app
    eptools rpc -c services -p amp -s core_app
    eptools rpc -c services -p amp -s manager_app
    eptools rpc -c services -p amp -s statistic_app
    eptools rpc -c services -p amp -s task_app
    funcShowSuccessOperation
    ;;
  2)
    cd $ECOPLANTS_META_PROJECT || exit
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
    cd $ECOPLANTS_META_PROJECT || exit
    eptools rpc -c services -p amp -s user_app
    funcShowSuccessOperation
    ;;
  4)
    cd $ECOPLANTS_META_PROJECT || exit
    eptools rpc -c services -p amp -s core_app
    funcShowSuccessOperation
    ;;
  5)
    cd $ECOPLANTS_META_PROJECT || exit
    eptools rpc -c services -p amp -s manager_app
    funcShowSuccessOperation
    ;;
  6)
    cd $ECOPLANTS_META_PROJECT || exit
    eptools rpc -c services -p amp -s statistic_app
    funcShowSuccessOperation
    ;;
  7)
    cd $ECOPLANTS_META_PROJECT || exit
    eptools rpc -c services -p amp -s task_app
    funcShowSuccessOperation
    ;;
  8)
    cd $ECOPLANTS_META_PROJECT || exit
    eptools rpc -c apis -p amp -s core_api
    funcShowSuccessOperation
    ;;
  9)
    cd $ECOPLANTS_META_PROJECT || exit
    eptools rpc -c apis -p amp -s manager_api
    funcShowSuccessOperation
    ;;
  10)
    cd $ECOPLANTS_META_PROJECT || exit
    eptools rpc -c apis -p amp -s statistic_api
    funcShowSuccessOperation
    ;;
  11)
    cd $ECOPLANTS_META_PROJECT || exit
    eptools api -p amp -s amp_http
    funcShowSuccessOperation
    ;;
  12)
    cd $ECOPLANTS_META_PROJECT || exit
    eptools api -p amp -s amp_file_http
    funcShowSuccessOperation
    ;;
  13)
    cd $ECOPLANTS_META_PROJECT || exit
    eptools rpc -c apis -p amp -s data_api
    funcShowSuccessOperation
    ;;
  14)
    cd $ECOPLANTS_META_PROJECT || exit
    eptools rpc -c apis -p amp -s data_depend_api
    funcShowSuccessOperation
    ;;
  *) funcShowErrorOperation ;;
  esac
}

# funcSelectModelToGenerate 选择项目
funcSelectModelToGenerate() {
  cd $ECOPLANTS_META_PROJECT/sql/services/amp || exit
  read -e -p "请输入Model: " ampModelName
  if [ ! -f $ampModelName ]; then
    echo "\033[1m 未查询到该 model  \033[0m"
    funcSelectModelToGenerate
  else
    cd $ECOPLANTS_META_PROJECT || exit
    eptools gorm -s ./sql/services/amp/$ampModelName -d services/amp/common/model
    funcShowSuccessOperation
  fi
}

# funcAMPRun 批量启动AMP服务
funcAMPRun() {
  cd $JTOOL_DIR_PATH || exit
  bash epwork_apple.sh
}

# funcShowAmpArgocd 展示 AMP 部署
funcShowAmpArgocd() {
  clear
  echo "\033[37m----------------------------------------\033[0m"
  echo "\033[1m 你选择了进行 argocd 部署 \033[0m"
  echo "\033 1. staging  \033[0m"
  echo "\033 2. autopush  \033[0m"
  echo "\033 3. preprod  \033[0m"
  echo "\033 4. prod  \033[0m"
  echo "\033 5. 清理 argocd yaml 文件   \033[0m"
  echo "\033[37m----------------------------------------\033[0m"

  read -p "请选择环境：" ampArgocdEnv
  echo "\033[37m 你选择了 $ampArgocdEnv"
  case $ampArgocdEnv in
  1 | 2 | 3)
    funcShowAmpArgocdAppList
    ;;
  4)
    read -p "Prod 环境只支持手动模式，请按任意键继续"
    funcShowAmpArgocd
    ;;
  5)
    rm $JTOOL_DIR_PATH/out/amp_*.yaml
    read -p "argocd yaml 部署文件清理干净"
    funcShowAmpArgocd
    ;;
  *)
    read -p "您的操作有误，请按任意键继续"
    funcShowAmpArgocd
    ;;
  esac
}

# 使用指定的 argocd yaml 进行服务部署
funcArgocdDeploy() {
  cd $ECOPLANTS_META_PROJECT || exit

  eptools deploy -f "$1"
}

# funcShowAmpArgocdAppList 展示 AMP Argocd 服务
funcShowAmpArgocdAppList() {
  clear
  echo "\033[37m----------------------------------------\033[0m"
  echo "\033[1m 请选择需要部署的 amp argocd 服务 \033[0m"
  echo "\033 all. 全部   \033[0m"
  echo "\033 be. be全部服务   \033[0m"
  echo "\033 api. api全部服务   \033[0m"
  argoIdx=0
  for i in "${ampApps[@]}"; do
    let argoIdx++
    echo "\033 $argoIdx. $i   \033[0m"
  done
  echo "\033[37m----------------------------------------\033[0m"

  read -p "请输入需要部署的服务：" latestDeployAmpService

  case $latestDeployAmpService in

  all | be | api)

    # 声明关联数组 api be
    # 遍历 app 进行输出
    randStr=$(date +%s)
    argoYamlFile="/out/amp_${ampArgocdEnv[$ampArgocdEnv]}_$((randStr)).publish.yaml"
    fromPath=$JTOOL_DIR_PATH$argoYamlFile

    echo "env: ${ampArgocdEnv[$ampArgocdEnv]}" >>"$fromPath"
    echo "commit:" >>"$fromPath"
    echo "services:" >>"$fromPath"

    batchIdx=0
    for thisTimeApp in "${ampApps[@]}"; do
      let batchIdx++

      if [ "$latestDeployAmpService" == "be" ] && [ ${ampAppsScope[$batchIdx]} == "apis" ]; then
        continue
      fi

      if [ "$latestDeployAmpService" == "api" ] && [ ${ampAppsScope[$batchIdx]} == "services" ]; then
        continue
      fi

      echo "  - name: ${ampAppsScope[$batchIdx]}/amp/${ampApps[$batchIdx]}" >>"$fromPath"
      echo "    version: auto" >>"$fromPath"
      echo "    desc: |" >>"$fromPath"
      echo "      amp ${ampApps[$batchIdx]}" >>"$fromPath"
      echo "    commit: " >>"$fromPath"
    done
    echo "bot_url: " >>$fromPath

    echo "fileName is $argoYamlFile"
    funcArgocdDeploy "$argoYamlFile"
    funcShowSuccessOperation
    ;;
  1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 | 13)
    randStr=$(date +%s)
    argoYamlFile="/out/amp_${ampArgocdEnv[$ampArgocdEnv]}_$((randStr)).publish.yaml"
    fromPath=$JTOOL_DIR_PATH$argoYamlFile

    echo "env: ${ampArgocdEnv[$ampArgocdEnv]}" >>"$fromPath"
    echo "commit:" >>"$fromPath"
    echo "services:" >>"$fromPath"
    echo "  - name: ${ampAppsScope[$latestDeployAmpService]}/amp/${ampApps[$latestDeployAmpService]}" >>"$fromPath"
    echo "    version: auto" >>"$fromPath"
    echo "    desc: |" >>"$fromPath"
    echo "      amp ${ampApps[$latestDeployAmpService]}" >>"$fromPath"
    echo "    commit: " >>"$fromPath"
    echo "bot_url: " >>"$fromPath"

    echo "fileName is $argoYamlFile"
    funcArgocdDeploy "$argoYamlFile"
    funcShowSuccessOperation
    ;;
  *)
    echo "this line $latestDeployAmpService"

    randStr=$(date +%s)
    argoYamlFile="/out/amp_${ampArgocdEnv[$ampArgocdEnv]}_$((randStr)).publish.yaml"
    fromPath=$JTOOL_DIR_PATH$argoYamlFile

    echo "env: ${ampArgocdEnv[$ampArgocdEnv]}" >>"$fromPath"
    echo "commit:" >>"$fromPath"
    echo "services:" >>"$fromPath"
    tempArr=($latestDeployAmpService)
    for thisTimeApp in "${tempArr[@]}"; do
      echo "  - name: ${ampAppsScope[$thisTimeApp]}/amp/${ampApps[$thisTimeApp]}" >>"$fromPath"
      echo "    version: auto" >>"$fromPath"
      echo "    desc: |" >>"$fromPath"
      echo "      amp ${ampApps[$thisTimeApp]}" >>"$fromPath"
      echo "    commit: " >>"$fromPath"
    done
    echo "bot_url: " >>"$fromPath"

    echo "fileName is $argoYamlFile"
    funcArgocdDeploy "$argoYamlFile"
    funcShowSuccessOperation
    ;;
  esac

}

# 主入口方法
Main() {
  funcShowMainMenu
}

Main
