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
    coonnected =True 
    while coonnected:
        msg_lengh=conn.recv(HEADER).decode(FORMAT) #recve client massage lengh on 64 bit and decode it on UTF-8
        msg_lengh=int(msg_lengh) # get the real lenght of client massage
        msg=conn.recv(msg_lengh).decode(FORMAT) #receve the masge on its fixed lengh
        if msg == DISCONNECT_MESSAGE:
            print(f'{conn} is disconnected!')
            break
        else:
            print(f"{addr}:{msg}")
            conn.send(input("SERVER: ").encode(FORMAT))
    conn.close()


def start():
    server.listen() #weting for client acction
    while True:
        conn , addr =server.accept() #accept client action and block anther reqests till the prosses compleat
        thread=threading.Thread(target=handel_client,args=(conn,addr)) #call handel_client method in a thred
        thread.start()


print(f'[STARTING] server {SERVER} is starting..........................')
start()

