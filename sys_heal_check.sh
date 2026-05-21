echo " мониторинг сети "
echo -e "\n[1/3] загрузка оперативной памяти:"
free -h | awk 'NR==1{print "      " $2" | " $3 " | " $4} NR==2{print "RAM:   " $2 " Використанно: " $3 " | Свободно: " $4}'
echo -e "\n[2/3} проверка связи сети:"
HOST="8.8.8.8" 
if ping -c 2 $HOST  > /dev/null; then
    echo "[OK] host is default" 
else 
    echo "[alert] alert host"
fi
echo -e "/n[3/3] active host port[TCP]:"
ss -tuln |grep "LISTEN" | awk '{print " listen port " $5}'
echo "successfully" 