=begin note
==> defining a class in perl is equivalent to define a package; and the scope of the class
is from the package declaration to the end of file, or to the next package declaration.
==> to create an object, first we need to create a constructor(usually named new) which 
is a subroutine within the package that returns an object reference which is created by
blessing a reference to the package's class.
bless() function, is used to return a reference which ultimately becomes an object.
=cut

package Person; #new class definition
sub new {
   my $class = shift;
   my $self = { #using perl hash reference
      _firstName => shift,
      _lastName  => shift,
      _ssn       => shift,
   };
   # Print all the values just for clarification.
   print "First Name is $self->{_firstName}\n";
   print "Last Name is $self->{_lastName}\n";
   print "Social Security Number is $self->{_ssn}\n";
   bless $self, $class;
   return $self;
}
sub setFirstName {
   my ( $self, $firstName ) = @_;
   $self->{_firstName} = $firstName if defined($firstName);
   return $self->{_firstName};
}

sub getFirstName {
   my( $self ) = @_;
   return $self->{_firstName};
}
1;

#creating an object
$object = new Person( "Mohammad", "Saleem", 23234345);
print("$object\n");