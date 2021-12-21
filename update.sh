wget -N -x -i dl.txt
find ~/kuu/Updates/ -type f | sort | uniq >filelist
git add .
git commit -m "`date`"
git push -f origin master
