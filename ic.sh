#Intenet check For OS X
rm -f temp
ping 8.8.8.8 > temp &
while true
do
    grepop=`tail -n 1 temp | grep -o ttl=.* | sed "s/time/, time/g"`
    if [ "$grepop" ];
    then
        say "Connected to the internet. Echo response received with $grepop"
        sleep 1
    fi
done
