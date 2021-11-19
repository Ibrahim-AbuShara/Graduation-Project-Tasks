import socket
import time
# take the server name and port name
host = '192.168.1.5' #enter your local ip address
port = 5050

# create a socket at server side
# using TCP / IP protocol
s = socket.socket(socket.AF_INET,
				socket.SOCK_STREAM)

# bind the socket with server
# and port number
s.bind(('', port))
print(f'server is listening on ip: {host} && port: {port}..............................')

# allow maximum 1 connection to
# the socket
s.listen(1)

# wait till a client accept
# connection
c, addr = s.accept()

# display client address
print("CONNECTION FROM:", str(addr))

msg = '50' #enter any msg
time.sleep(3) #sleep for 10 seconds
c.send(msg.encode('utf-8'))
# disconnect the server
c.close()
