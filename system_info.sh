echo '''
================================
	   Dashbooard
================================
'''
echo "--------Date-Time----------"
echo "Time: $(date -I)"
echo "Date: $(date +%D)"
echo "Day: $(date +%A)"
echo
echo "---------User-Info---------"
echo "User: $(whoami)"
echo "Hostname: $(hostname)"
source /etc/os-release
echo "OS: $NAME"
echo "Kernal: $(uname -ms)"
echo
echo "-------System-Uptime-------"
echo "uptime: $(uptime -p)"
echo "Logged-in: $(uptime | awk '{print $4,$5}')"
echo
path="/home/$(whoami)"
echo "--------system info--------"
echo "CPU usage: $(top -bn1 | awk '/Cpu\(s\)/ {print 100-$8 "%"}')"
echo "Memory usage: $(df -h | awk 'NR==3 {print $5}')"
echo "RAM usage: $(free -h | awk 'NR==2{print $3 "/" $2}')"
echo "$path size: $(du -h $path | tail -1 | awk '{print $1}')"
echo "================================"
