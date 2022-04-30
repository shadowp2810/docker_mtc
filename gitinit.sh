git init &&
git remote add origin https://gitlab.com/groupnamehere/$(echo ${PWD} | awk -F/ '{print $NF}').git &&
git add . && 
git commit -m "initial" &&
git branch -m master main && 
git push -u origin main