import socket

#define constants 
HEADER = 64
PORT = 5050
FORMAT = 'utf-8'
DISCONNECT_MESSAGE = "KILL"
SERVER ="192.168.1.5" #here We should set the IP of the server manually
ADDR=(SERVER,PORT)

#-----------------------------------------------------------------------------------------------------------------
client = socket.socket(socket.AF_INET, socket.SOCK_STREAM) #difine the client 
client.connect(ADDR) # connect client to the server


def send(msg):
    message = msg.encode(FORMAT)
    client.send(message)
    print(f"SERVER:{client.recv(1024).decode(FORMAT)}")#to recve massage from the server

while True:
    massage=input()
    if massage!=DISCONNECT_MESSAGE:
        send(massage)
    else:
        send(massage)
        quit()



        
