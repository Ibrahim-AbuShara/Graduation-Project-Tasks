import socket
import threading

PORT = 5050
#SERVR ="192.168.1.5" static
SERVER = socket.gethostbyname(socket.gethostname())
print(str(SERVER))
