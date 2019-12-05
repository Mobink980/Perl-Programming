=begin comment
To Create a Server:
==> Create a socket using socket call. (first step to create the network)
==> Bind the socket to a port address using bind call. 
(sockets are useless untill they are bound to a hostname and a port number)
We use bind to specify the port that we'll be accepting connections from clients.
==> Listen to the socket at the port address using listen call.
==> Accept client connections using accept call.
=cut

#!/usr/bin/perl -w
# Filename : server.pl

use strict;
use Socket;

# use port 7890 as default
my $port = shift || 7890;
my $proto = getprotobyname('tcp'); #using tcp protocol
my $server = "localhost";  # Host IP running the server

# create a socket, make it reusable {socket( SOCKET, DOMAIN, TYPE, PROTOCOL );} 
=begin comment
==> Domain should be PF_INET which is probably 2 on the computer.
==> Type should be SOCK_STREAM for tcp/ip connection.
==> PROTOCOL should be (getprotobyname('tcp'))[2].
It is the particular protocol such as TCP to be spoken over the socket.
==> Socket function call issued by the server will be like this:
use Socket;     # This defines PF_INET and SOCK_STREAM
socket(SOCKET,PF_INET,SOCK_STREAM,(getprotobyname('tcp'))[2]);
=cut
socket(SOCKET, PF_INET, SOCK_STREAM, $proto)
   or die "Can't open socket $!\n";
#if a server dies without outstanding connection, the port is not reusable immediately.
#that is the reason we use SO_REUSEADDR using setsockopt() function.  
setsockopt(SOCKET, SOL_SOCKET, SO_REUSEADDR, 1)
   or die "Can't set socket option to SO_REUSEADDR $!\n";

# bind to a port, then listen {bind( SOCKET, ADDRESS );}
=begin comment
==> SOCKET is the descriptor returned by socket call.
==> ADDRESS is a socket address for tcp/ip that contains three elements:
1)the address family for tcp/ip which is AF_INET, probably 2 on the system.
2)the unique port number for listening to the requests (for example 21) 
3)the internet address for computer (for example 10.12.12.168) 
==> pack_sockaddr_in() packs the port and ip address into binary format.
=cut
bind( SOCKET, pack_sockaddr_in($port, inet_aton($server)))
   or die "Can't bind to port $port! \n";

#in the server side we need the listen call with the syntax {listen( SOCKET, QUEUESIZE );}
#SOCKET is the descriptor by socket call and 
#QUEUESIZE is maximum number of connection request allowed simultanously.
listen(SOCKET, 5) or die "listen: $!";
print "SERVER started on port $port\n";

# accepting a connection
=begin comment
==> Server program needs to issue a call to the accept function to accept the incomming connections.
==> The syntax is {accept( NEW_SOCKET, SOCKET );}
==> The accept call receive SOCKET descriptor returned by socket() function 
and upon successful completion, a new socket descriptor NEW_SOCKET
is returned for all future communication between the client and the server.
==> If accept call fails it returns False
==> accept() is used in an infinite loop, as soon as one connection arrives the server, the server 
may create a child to deal with it or deals with the connection request himself and then
goes back to listen to more connections.
while(1) {
   accept( NEW_SOCKET, SOCKET );
   .......
}
==> Perl gethostbyaddr Function: syntax {gethostbyaddr ADDR, ADDRTYPE}
This function Contacts the system's name-resolving service,
returning a list of information for the host ADDR of type ADDRTYPE,
as follows − ($name, $aliases, $addrtype, $length, @addrs)
Return value in scalar context: undef on error and otherwise host name 
Return value in list context: empty list on error otherwise host record
use Socket;
   $iaddr = inet_aton("127.1"); # or whatever address
   $name  = gethostbyaddr($iaddr, AF_INET);
   print "Host name is $name\n";
=cut
my $client_addr;
while ($client_addr = accept(NEW_SOCKET, SOCKET)) {
   # send them a message, close connection
   my $name = gethostbyaddr($client_addr, AF_INET );
   print NEW_SOCKET "Smile from the server"; #it prints into the NEW_SOCKET, the client will get it. 
   print "Connection recieved from $name\n";
   close NEW_SOCKET;
}