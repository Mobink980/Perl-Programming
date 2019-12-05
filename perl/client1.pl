use strict;   
use warnings;   
use IO::Socket;   
my $socket = new IO::Socket::INET (   
PeerAddr => 'localhost',   
PeerPort => '1234',   
Proto => 'tcp',   
);   
die "Could not create socket: $!n" unless $socket;  
print "Enter the data:\n";  
my $data = <STDIN>;  
chomp $data;  
print $socket "This is the data entered by user '$data'\n";  
close($socket); 