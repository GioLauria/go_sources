#!/bin/bash
set -x
declare -A folder
_project_name="go_sources"
_remote_project_name="https://github.com/GioLauria/$_project_name.git"
_user_name="Giovanni Lauria"
_email="giovanni.lauria+coding@gmail.com"
_commit_string="Commit of `date +%Y%m%d` - `date +%s` - "
_remote_alias="origin"
_main_repo="main"
_path=`pwd`

_default=$1
if [[ $_default == "" ]]
then
    echo "Default parameter missing. Exiting."
    exit
elif [[ $_default == "init" ]]
then    
    rm -rf .git
    git init
    git config user.name $_user_name
    git config user.email $_email
    git remote remove $_remote_alias
    git remote add $_remote_alias $_remote_project_name
    git checkout -b $_main_repo
    git add *
    git commit -m "$_commit_string REPO INIT"
    git push --set-upstream origin $_main_repo  # After first commit
    git push -u $_remote_alias $_main_repo
else
    cd "${_path}"
    folder[0,0]="."
    folder[0,1]=$_default                #remarks

    # create other array entries if needed

    _len_array=${#folder[@]}

    for i in $(((_len_array/2)-1))   # it is a n*2 array so the real lenght is /2 (-1 for the index)
    do
        cd  "$_path${folder[$i,0]}"
        git add -A
        git commit -m "$commit_string${folder[$i,1]}"
        git push origin
        git checkout $_main_repo
        git merge development
        git push origin 
        git checkout development
    done
fi