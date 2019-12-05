#!/usr/bin/perl

# Following is the implementation of simple Class.
package MyClass;

sub new {
   print "MyClass::new called\n";
   my $type = shift;            # The package/type name
   my $self = {};               # Reference to empty hash
   return bless $self, $type;   
}

sub DESTROY {
   print "MyClass::DESTROY called\n";
}

sub MyMethod {
   print "MyClass::MyMethod called!\n";
}


# Following is the implemnetation of Inheritance.
package MySubClass;

@ISA = qw( MyClass );

sub new {
   print "MySubClass::new called\n";
   my $type = shift;            # The package/type name
   my $self = MyClass->new;     # Reference to empty hash
   return bless $self, $type;  
}

sub DESTROY {
   print "MySubClass::DESTROY called\n";
}

sub MyMethod {
   my $self = shift;
   $self->SUPER::MyMethod();
   print "MySubClass::MyMethod called!\n";
}

# Here is the main program using above classes.
package main;

print "Invoke MyClass method\n";

$myObject = MyClass->new();
$myObject->MyMethod();

print "Invoke MySubClass method\n";

$myObject2 = MySubClass->new();
$myObject2->MyMethod();

print "Create a scoped object\n";
{
   my $myObject2 = MyClass->new();
}
# Destructor is called automatically here

print "Create and undef an object\n";
$myObject3 = MyClass->new();
#undef is the initial value of scalar variables.
#It is also a function that can be used to set variables to be undefined.
undef $myObject3;

print "Fall off the end of the script...\n";
# Remaining destructors are called automatically here

