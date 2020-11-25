# sample_crypto

This sample application demonstrates the use of RSA cryptographic algorithm by emulating communication between a client and a server.

## Plug and play

You do not need to install any thing other than running 'flutter packages get' after cloning this repo. 

You can see how client sends a message by encrypting it with server's public key which can only be decrypted by server's private key.

# Screenshots

## Initial state
![](images/1.jpg)
## Client sends a message encrypting it with server's public key
![](images/2.jpg)
## Message is decrypted by the server using it's private key
![](images/3.jpg)
## Server sends a message encrypting it with client's public key
![](images/4.jpg)
## Message is decrypted by the client using it's private key
![](images/5.jpg)

## Acknowledgement

I have used the [cypton](https://pub.dev/packages/crypton/example) package in this project. Thanks to the creator of this package, [konstantinullrich.de](https://pub.dev/publishers/konstantinullrich.de/packages).