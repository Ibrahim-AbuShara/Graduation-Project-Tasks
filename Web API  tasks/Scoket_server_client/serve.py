import socket
import threading

PORT = 5050
#SERVR ="192.168.1.5" static
SERVER = socket.gethostbyname(socket.gethostname()) #quire to get ip addrees dinamcly
#print(str(SERVER))
ADDR=(SERVER,PORT) #make a tuple to save the port an the ip
server=socket.socket(socket.AF_INET, socket.SOCK_STREAM)#set the type of IP address we look for
server.bind(ADDR) #to make any deivice that tring to reach the server to hit this socket

def start():
    pass
