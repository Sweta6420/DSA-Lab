import socket 
import datetime
import time
def initiateClockServer():
	s = socket.socket()
	print("Socket successfully created")
	port = 8011
	s.bind(('', port))
	s.listen(5)
	print("Socket is listening...")
	while True:
		conn, address = s.accept()
		print('Server connected to', address)
		conn.send(str(datetime.datetime.now()).encode())
	conn.close()

if __name__ == '__main__':
	initiateClockServer()