from functools import reduce
from dateutil import parser
import threading
import datetime
import socket
import time
client_data = {}	#to store client addr and clock data
def startRecieveingClockTime(conn, addr): #nested thread function used to receive clock time from a connected client
	while True:
		clock_time_string = conn.recv(1024).decode()
		clock_time = parser.parse(clock_time_string)
		clock_time_diff = datetime.datetime.now() - clock_time
		client_data[addr] = {"clock_time": clock_time,"time_diff" : clock_time_diff,"connector": conn}
		print("Client Data updated with: "+ str(addr),end = "\n\n")
		time.sleep(5)

def startConnecting(master_server): #master thread function used to open portal for accepting clients over given port
	while True: # fetch clock time at slaves / clients
		# accepting a client / slave clock client
		master_slave_connector, addr = master_server.accept()
		slave_addr = str(addr[0]) + ":" + str(addr[1])
		print(slave_addr + " got connected successfully")
		current_thread = threading.Thread(target = startRecieveingClockTime,args = (master_slave_connector,slave_addr, ))
		current_thread.start()

# subroutine function used to fetch average clock diff
def getAverageClockDiff():
	current_client_data = client_data.copy()
	time_diff_list = list(client['time_diff'] for client_addr, client in client_data.items())
	sum_of_clock_diff = sum(time_diff_list, datetime.timedelta(0, 0))
	average_clock_diff = sum_of_clock_diff / len(client_data)
	return average_clock_diff

def synchronizeAllClocks():
	while True:
		print("New synchroniztion cycle started.")
		print("Number of clients to be synchronized: " + str(len(client_data)))
		if len(client_data) > 0:
			average_clock_diff = getAverageClockDiff()
			for client_addr, client in client_data.items():
				try:
					synchronized_time = datetime.datetime.now() + average_clock_diff
					client['connector'].send(str(synchronized_time).encode())
				except Exception as e:
					print("Something went wrong while sending synchronized time through " + str(client_addr))
		else :
			print("No client data. Synchronization not applicable.")
		time.sleep(5)

# function used to initiate the Clock Server / Master Node
def initiateClockServer(port = 8080):
	master_server = socket.socket()
	master_server.setsockopt(socket.SOL_SOCKET,socket.SO_REUSEADDR, 1)
	print("Socket at master node created successfully\n")
	master_server.bind(('', port))
	master_server.listen(10)
	print("Clock server started...\n")
	print("Starting to make connections...\n")
	master_thread = threading.Thread(target = startConnecting,args = (master_server, ))
	master_thread.start()
	# start synchroniztion
	print("Starting synchronization parallely...\n")
	sync_thread = threading.Thread(target = synchronizeAllClocks,args = ())
	sync_thread.start()

if __name__ == '__main__':
	initiateClockServer(port = 8080)