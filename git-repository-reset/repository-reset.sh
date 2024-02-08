#!/bin/bash

echo "Enter username:"
read username
echo "Enter password:"
read -s password

remote=$(git remote get-url origin)
auth_remote=${remote/https:\/\//https:\/\/${username}:${password}@}

git fetch $auth_remote

branches=$(git branch -r)
branch=$(git branch -r| head -n 1 | awk -F'/' '{print $NF}')
if [[ $branches == *"master"* ]]; then
	branch="master"
fi
if [[ $branches == *"develop"* ]]; then
	branch="develop"
fi

git checkout "$branch"
git pull $auth_remote
git stash clear
branches_to_delete=$(git branch | grep -v "$branch")
for branch_to_delete in $branches_to_delete
do
   git branch -D "$branch_to_delete"
done

echo "Git repository restored"