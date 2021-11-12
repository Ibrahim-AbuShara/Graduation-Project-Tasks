import socket

#define constants 
HEADER = 64
PORT = 5050
FORMAT = 'utf-8'
DISCONNECT_MESSAGE = "KILL"
SERVER ="192.168.1.4" #here We should set the IP of the server manually
ADDR=(SERVER,PORT)

#-----------------------------------------------------------------------------------------------------------------
client = socket.socket(socket.AF_INET, socket.SOCK_STREAM) #difine the client 
client.connect(ADDR) # connect client to the server


   

    
print(client.recv(2048).decode(FORMAT))    


        
