import socket
import threading

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

def handel_client(conn,addr):
    print(f'[NEW CONNECTION] {addr} is connected!') #show the ip address of the new client
    temp=[0]
    coonnected =True 
    while coonnected:
        msg=conn.recv(1024).decode(FORMAT) 
        if msg.isdigit():
                temp.append(msg)
        else:
                print(f"{addr}:{msg}")
        server.listen()
        for i in temp:
            conn.send(str(i).encode(FORMAT))       
def start():
    server.listen() #weting for client acction
    while True:
        conn , addr =server.accept() #accept client action and block anther reqests till the prosses compleat
        thread=threading.Thread(target=handel_client,args=(conn,addr)) #call handel_client method in a thred
        thread.start()


print(f'[STARTING] server {SERVER} is starting..........................')
start()
