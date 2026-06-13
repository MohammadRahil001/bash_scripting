#check root user
if [[ $(whoami) != "root" ]]
then
	echo "you need root permission for this tool..."
	exit 1
fi

#user management function
user_management(){
	clear
	while true
	do
		echo '''
----------------------------------------------------		
		1 --> User create
		2 --> User delete
		3 --> User Lock
		4 --> User Unlock
		5 --> Main menu
----------------------------------------------------		
		'''
		read -p "choice: " x
		
		if [ $x -eq 5 ]
		then
			return
		fi
		clear
		read -p "Enter username: " user
		case $x in
			1 )
				adduser $user
				if [ $? -eq 0 ]
				then
					echo "User successfully created..."
				fi;;
			2 )
				userdel -rf $user
				if [ $? -eq 0 ]
				then
					echo "User successfully deleted..."
				fi;;
			3 )
				usermod -L $user

				if [ $? -eq 0 ]
				then
					echo "$user account lock successfully..."
				fi;;


			4 )
				usermod -U $user
				if [ $? -eq 0 ]
				then
					echo "$user account unlock successfully.."
				fi;;
			* )
				echo "Invalide choice...";;
		esac
		echo '''-----------------------------------------------------'''
	done

}


#process management
process_management(){
	clear
	while true
	do
		echo '''
----------------------------------------------------		
		1 --> List process
		2 --> Kill process
		3 --> Search process
		4 --> List jobs
		5 --> Main menu
----------------------------------------------------		
		'''
		read -p "choice: " choice
		clear
		case $choice in
			1 )
				echo "$(ps | sort  -r | awk 'NR>5{print}')";;
	
			2 )
				read -p "Provide PID of process: " PID
				kill -9 $PID
				if [ $? -eq 0 ]
				then
					echo "Process successfully terminated..."
				fi;;
			3 )
				read -p "Enter Process name to Search: " search
				ps aux | grep $search;;
			4 )
				echo "Jobs: $(jobs)";;
			5 )
				return;;
			* )	
				echo "Invalide choice...";;

		esac
		echo '''-----------------------------------------------------'''
	done
}



#network_management
network_management(){
	clear
	while true
	do
		echo '''
----------------------------------------------------		
		1 --> Find IP address
		2 --> Check open ports
		3 --> Route table
		4 --> Ping test
		5 --> Main menu
----------------------------------------------------		
		'''

		read -p "choice: " choice
		clear
		case $choice in
			1 )
				echo "Listing all ip addr ..."
				echo "$(ip a | grep "inet")";;

			2 )
				echo "Listing open ports..."
				echo "$(ss -tulnp | egrep -i "LISTEN|LISTNING")";;
			3 )
				echo "$(ip route)";;
			4 )
				ping -c 3 google.com;;
			5 )
				return;;
			* )
				echo "Invalide choice...";;

		esac
		echo '''-----------------------------------------------------'''
	done
}



#display menu
menu(){
	echo '''
#############################################
	1 --> User management
	2 --> Process management
	3 --> Network infomation
	4 --> exit
#############################################
	'''
	read -p "choice: " choice
	case $choice in
		1 )
			user_management;;
		2 )
			process_management;;
		3 )
			network_management;;
		4 )
			echo "Exiting..."
			sleep 1
			exit 0;;
		* )
			echo "Invalide choice...";;

	esac
}

while true
do
	clear
	menu
done

