import socket
import threading
import time
from statistics import mean
#define constants 
PORT = 5050
#SERVER ="192.168.1.5" static
SERVER = socket.gethostbyname(socket.gethostname()) #quire to get ip addrees dinamcly
HEADER = 64 
FORMAT ="UTF-8"
ADDR=(SERVER,PORT) #make a tuple to save the port & the ip
DISCONNECT_MESSAGE = "KILL"

#---------------------------------------------------------------------
server=socket.socket(socket.AF_INET, socket.SOCK_STREAM)#set the type of IP address we look for
server.bind(ADDR) #to make any deivice that tring to reach the server to hit this socket

def Esp_32(conn,addr):
    print(f'[NEW CONNECTION] {addr} is connected!') #show the ip address of the new client
    temp=[]
    t_end = time.time() + 30
    while time.time() < t_end:
        msg=conn.recv(1024).decode(FORMAT)
        if msg !='\r\n' :
            temp.append(msg)
            print(msg) 
    temp=[float(item)for item in temp]
    send_to_app(str(mean(temp)))
    
def send_to_app(msg):
    server.listen
    client,adder=server.accept()
    client.send(msg.encode(FORMAT))        
             
def start():
    server.listen() #weting for client acction
    
    conn , addr =server.accept() #accept client action and block anther reqests till the prosses compleat
    
    thread=threading.Thread(target=Esp_32,args=(conn,addr)) #call handel_client method in a thred
    thread.start()


print(f'[STARTING] server {SERVER} is starting..........................')
start()
