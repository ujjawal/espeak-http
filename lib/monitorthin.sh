ifthin=`ps -eo pid,comm | grep thin | grep -v grep | awk '{print $1}'`
j=0;
if [ -z "$ifthin" ]
then
    thin -s 4 start -O -p 5000
else
    for i in $ifthin
    do
        j="$(( $j + 1 ))";
    done    
    if [ $j -lt 4 ]
    then
        thin -s 4 restart -O -p 5000
    fi
fi


