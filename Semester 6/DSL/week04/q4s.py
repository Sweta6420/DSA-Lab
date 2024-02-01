import socket
serverIP = 'localhost'
serverPort = 16001
serverSock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
serverSock.bind((serverIP, serverPort))
serverSock.listen(1)
print("TCP server has started and is ready to receive")
while 1:
	conn, addr = serverSock.accept()
	data = conn.recv(1024)
	if not data: break
	temp = [float(x) for x in data.decode().split(' ')]
	print("Received data:", temp)
	length = len(temp)
	maximum = max(temp)
	minimum = min(temp)
	total = sum(temp)
	mean = total/length
	msg = str(total) + " " + str(minimum) + " " + str(maximum) +" " + str(mean)
	conn.send(msg.encode())