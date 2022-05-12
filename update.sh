find ~/kuu/Updates/ -type f | sort | uniq >filelist
grep '\.mft$' filelist >dl.txt
grep '\.stt$' filelist >>dl.txt
grep '\.set$' filelist >>dl.txt
grep '\.xml$' filelist >>dl.txt
sed -i 's/\/root\/kuu\/Updates/dnl-01.geo.kaspersky.com/g' dl.txt
wget -N -x -i dl.txt
rm -rf sha1sum
cat filelist | while read line; do sha1sum $line >>sha1sum; done
grep Filename dnl-01.geo.kaspersky.com/bases/as/kas5/0/kas5-0607g.xml | sed 's/"/\n/g' | sed 's/Filename=//g' | sort | uniq | grep '\-22' >diffkas
git add .
git commit -m "`date`"
git push -f origin master
