import socket
import threading
import time
from statistics import mean
#define constants 
PORT = 5050
SERVER ="192.168.1.6"
ESP_Ip='192.168.1.12' 
#SERVER = socket.gethostbyname(socket.gethostname()) #quire to get ip addrees dinamcly
HEADER = 64 
FORMAT ="UTF-8"
ADDR=('',PORT) #make a tuple to save the port & the ip
DISCONNECT_MESSAGE = "KILL"


#--------------------------SET The SERVER-----------------------------------
server=socket.socket(socket.AF_INET, socket.SOCK_STREAM)#set the type of IP address we look for
server.bind(ADDR) #to make any deivice that tring to reach the server to hit this socket

#----------------------------------------------------------------------------------------
def Esp_32(conn,addr):
    print(f'[NEW CONNECTION] {addr} is connected!') #show the ip address of the new client
    temp=[]
    t_end = time.time() + 30 #listen from Esp for 30 sec
    while time.time() < t_end:
        msg=conn.recv(1024).decode(FORMAT)
        if msg !='\r\n' : #remove sesor bugs
            temp.append(msg)
            print(msg) 
    temp=[float(item)for item in temp]
    App_Client.send(str(mean(temp)).encode(FORMAT))
    

#---------------------------MAIN---------------------------------------------------------------------------

print(f'[STARTING] server {SERVER} is starting..........................')
while True:
    server.listen() #weting for client acction
    conn , addr =server.accept() #accept client action and block anther reqests till the prosses compleat
    print(addr[0])
    if str(addr[0]) == ESP_Ip:
        thread=threading.Thread(target=Esp_32,args=(conn,addr)) #call handel_client method in a thred
        thread.start()
    else:
        App_Client=conn
        print(type(App_Client))
