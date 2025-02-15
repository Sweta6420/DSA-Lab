#Write a program to create TCP time server in Python
import socket
import time
serversocket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
host = socket.gethostname()
port = 9991
serversocket.bind((host, port))
serversocket.listen(5)
while True:
	clientsocket,addr = serversocket.accept()
	print("Got a connection from %s" % str(addr))
	currentTime = time.ctime(time.time()) + "\r\n"
	clientsocket.send(currentTime.encode('ascii'))
	clientsocket.close()