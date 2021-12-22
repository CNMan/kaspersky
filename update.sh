wget -N -x -i dl.txt
find ~/kuu/Updates/ -type f | sort | uniq >filelist
rm -rf sha1sum
cat filelist | while read line; do sha1sum $line >>sha1sum; done
git add .
git commit -m "`date`"
git push -f origin master
