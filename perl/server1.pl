#!/usr/bin/perl -w  
use IO::Socket;   
use strict;   
use warnings;   
my $socket = new IO::Socket::INET (   
LocalHost => 'localhost',   
LocalPort => '1234',   
Proto => 'tcp',   
Listen => 1,   
Reuse => 1,   
);   
die "Could not create socket: $!n" unless $socket;   
print "Waiting for the client to send data\n";   
my $new_socket = $socket->accept();   
while(<$new_socket>) {   
print $_;   
}   
close($socket);  