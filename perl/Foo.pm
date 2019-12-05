package Foo;
print "Begin and Block Demo\n";

BEGIN { #same as constructor
   print "This is BEGIN Block\n" 
}
sub bar { 
   print "Hello $_[0]\n" 
}

sub blat { 
   print "World $_[0]\n" 
}
END { #same as destructor
   print "This is END Block\n" 
}

1;

# if(!defined($pid = fork())) {
#    # fork returned undef, so unsuccessful
#    die "Cannot fork a child: $!";
# } elsif ($pid == 0) {
#    print "Printed by child process\n";
#    exec("date") || die "can't exec date: $!";
  
# } else {
#    # fork returned 0 nor undef
#    # so this branch is parent
#    print "Printed by parent process\n";
#    $ret = waitpid($pid, 0);
#    print "Completed process id: $ret\n";

# }

# 1;

#A module can be loaded by calling the require function
#require Foo;

Foo::bar( "a" );
Foo::blat( "b" );

# A module can be loaded by calling the use function.
#use Foo;

bar( "a" );
blat( "b" );

print "Hello, World\n";

while(<DATA>) {
  print $_;
}

__END__

=head1 Hello, World Example
This example demonstrate very basic syntax of Perl.
print "Hello, Universe\n";
