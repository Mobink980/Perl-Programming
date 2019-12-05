#!/usr/bin/perl -w
# Filename : client.pl
#a socket is an IP address and a port, enabling connection to send and recieve data over a network.
=begin comment
To Create a Client:
==> Create a socket with socket call.
==> Connect (the socket) to the server using connect call.
=cut

use strict;
use Socket;
# initialize host and port
my $host = shift || 'localhost';
my $port = shift || 7890;
my $server = "localhost";  # Host IP running the server

# create the socket, connect to the port
socket(SOCKET,PF_INET,SOCK_STREAM,(getprotobyname('tcp'))[2])
   or die "Can't create a socket $!\n";

#connect call to connect to the server. syntax {connect( SOCKET, ADDRESS );}
=begin comment
==> SOCKET is the descriptor returned by socket call, issued by the client
==> ADDRESS is a socket address similar to the bind call, 
with the difference that it contains the ip address of the remote server 
==> If client connects to the server successfully, it can start sending
commands to the server using SOCKET descriptor. 
=cut
connect( SOCKET, pack_sockaddr_in($port, inet_aton($server)))
   or die "Can't connect to port $port! \n";

my $line;
while ($line = <SOCKET>) { #it prints whatever the server sent into the SOCKET 
   print "$line\n";
}
close SOCKET or die "close: $!";