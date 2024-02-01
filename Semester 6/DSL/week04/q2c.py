import socket
sock = socket.socket(socket.AF_INET,socket.SOCK_DGRAM)
udp_host = socket.gethostname()
udp_port = 12345
udp = (udp_host,udp_port)
name = input(str("Enter your name: ")) 
print("Trying to connect to ", udp_host, "(", udp_port, ")")
sock.connect(udp)
print("Connected...")
sock.sendto(name.encode(),udp)
s_name,addr = sock.recvfrom(1024)
s_name = s_name.decode()
print(s_name, "has joined the chat room\nPress Ctrl+C to exit chat room")
while True:
	message,addr = sock.recvfrom(1024)
	message = message.decode()
	print(s_name, ":", message)
	message = input(str("Me: "))
	sock.sendto(message.encode(),udp)