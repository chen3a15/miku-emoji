@echo off
setlocal

echo [1/7] 检查工作区状态
git status --short
pause

echo [2/7] 创建孤儿分支
git checkout --orphan new_branch || goto :error

echo [3/7] 添加并提交
git add -A || goto :error
git commit -m "枣尚耗" || goto :error

echo [4/7] 删除旧 main
git branch -D main || goto :error

echo [5/7] 改名为 main
git branch -m main || goto :error

echo [6/7] 强制推送并绑定上游
git push -u -f origin main || goto :error

echo [7/7] 完成
git log --oneline -1
git branch -vv
pause
exit /b 0

:error
echo 出错了，请检查上一步输出。
pause
exit /b 1