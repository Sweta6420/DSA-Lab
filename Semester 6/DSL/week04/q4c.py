import socket
serverIP = 'localhost'
serverPort = 16001
cSock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
cSock.connect((serverIP, serverPort))
message = input("Input integers with space in between: ")
# message2 = input("Enter the length of the set: ")
cSock.send(message.encode())
# cSock.send(message2.encode())
data = cSock.recv(1024)
temp = [float(x) for x in data.decode().split(' ')]
print("The total of all numbers is: " + str(temp[0]))
print("The lowest number is: " + str(temp[1]))
print("The highest number is: " + str(temp[2]))
print("The mean is: " + str(temp[3]))
cSock.close()