#!usr/bin/perl
# Global variable
$string = "Hello, World!";
=begin comment
value types can be one of the below:
SCALAR
ARRAY
HASH
CODE
GLOB
REF
=cut
$var ="Hello World!";
@ages =(67,89,25,12,30,40);
@names=("Muhammad","JohnSeffer","Lisa","Marry");
print("\$ages[0] = $ages[0]\n");
@copy = @names;
$num = @names;
$num1 = 5*2+3-4*2;
print("names are @copy \n and the number of them is $num\n and the result of expression is $num1 wierd!!\n");
#defining a hash variable 
#hash is a set of key value pair
%olddata =('john',45 , 'marry',30 ,'Kumar',25);
print("$olddata{'john'}\n");

@array = qw/this is an array my friend/;
print("$array[5]\n");
print("$array[-3]\n"); #picking the element from the end
$array[50]="hello";
$size = @array;
$max_index = $#array;
print "Size:  $size\n";
print "Max Index: $max_index\n";
#sequential number arrays
@var_10=(1..10);
@var_20=(10..20);
@var_abc=(a..z);
print("@var_10\n @var_20\n @var_abc\n");

@colors=("red","blue","yellow","green");
push(@colors,"purple"); #add as last element
unshift(@colors,"orange");#add as first element
print("@colors\n"); 
shift(@colors); #remove first element  
pop(@colors); #remove last element
print("@colors\n");

@days = qw/Mon Tue Wed Thu Fri Sat Sun/; #when using qw elements are seperated by space
@workdays = @days[1,2,3]; #slicing array elements
print("@workdays\n");

@nums =(1..20); #replacing array elements
splice(@nums,5,5,21..25); #start from 5, go forward 5 times and replace elements with 21 to 25

#splitting a string 
$string1="I,am,here,to,split,an,array,in,perl";
@strings = split(',' , $string1); 
print("@strings\n");

#transforming array to strings
$string2 = join('_', @strings);
print("$string2\n");

#sorting arrays
@sorted_names= sort(@names);
@sorted_ages= sort(@ages);
print("@sorted_names\n @sorted_ages\n");

#merging arrays
@odd=(1,3,5,7,9);
@even=(2,4,6,8);
@newnumbers=(@odd,@even);
print("@newnumbers\n");

#selecting elements from lists
$var = (1,2,3,5,4,6)[3];
@list =(1,2,3,6,8,2)[2..4];
print("$var\n @list\n");

#creating hashes (3 methods)
$data{'John'}=20;
$data{'Jenifer'}=25;
$data{'George'}=33;
%data = ('Paul' => 45, 'Lisa' => 30, 'Kumar' => 40 ,'Ahmad Mohammadi'=> 50);
%data = (-James => 45, -Rasool => 30, -Marry => 40);
$data{'Ali'} = 55; #adding element into the hash
print("$data{'Ali'}\n"); #it will only print the last assignment like python
delete $data{'Ali'}; #dlete the element from hash
@array1 = @data{-James,-Marry};
print("@array1\n");

#extracting all keys from a hash
@newNames = keys %data;
$newsize = @newNames;#the size of the hash
#extracting values from hash
@newAges = values %data;
print("@newNames\n @newAges\n");
print("Hash size is:$newsize\n");

if( exists($data{'Lisa'} ) ) { #checking for existence
   print "Lisa is $data{'Lisa'} years old\n";
} else {
   print "I don't know age of Lisa\n";
}
$name = Ali;
$Age = 23;
$status = ($age > 60 )? "A senior citizen" : "Not a senior citizen"; #Exp1? Exp2:Exp3

print "$name is   $status\n";
#loops and conditional statements
foreach ('hickory','dickory','doc') {
   print;
   print "\n";
}

$count =5;
while ($count > 0) { 
  print "Countdown is: $count\n";
  $count--;
}

for ($i = 1 ; $i < 3 ; $i++) {
  print "My count is: $i\n";
}

@colors = ('red', 'blue', 'yellow', 'pink', 'black');
foreach $color (@colors) {
    if ($color eq 'blue') {
        next;
    }
    print "Color: $color\n";
    if ($color eq 'pink')  {
        last;
    }
}

$a=10;
$b=20;
$result= $a<=>$b; #returns 1,0,-1
$c="abc";
$d="de";
if($a!=$b) {
  print("$result\n");
  print('-' x 3);
  print($c.$d);
  print "\n";
}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% functions
# Function definition
sub Average {
   # get total number of arguments passed.
   $n = scalar(@_);
   $sum = 0;

   foreach $item (@_) {
      $sum += $item;
   }
   $average = $sum / $n;

   print "Average for the given numbers : $average\n";
}

# Function call
Average(10, 20, 30);

# Function definition
sub PrintList {
   my @list = @_;
   print "Given list is @list\n";
}
$a = 10;
@b = (1, 2, 3, 4);

# Function call with list parameter
PrintList($a, @b);

# Function definition
sub PrintHash {
   my (%hash) = @_;

   foreach my $key ( keys %hash ) {
      my $value = $hash{$key};
      print "$key : $value\n";
   }
}
%hash = ('name' => 'Tom', 'age' => 19);

# Function call with hash parameter
PrintHash(%hash);

# Create a reference to above function.(we use \&)
$cref = \&PrintHash;

# Function call using reference. (we just precede the reference by ampersand &)
&$cref(%hash);


# Function definition
sub Average { #this function returns the average
   # get total number of arguments passed.
   $n = scalar(@_);
   $sum = 0;

   foreach $item (@_) {
      $sum += $item;
   }
   $average = $sum / $n;

   return $average;
}

# Function call
$num = Average(10, 20, 30);
print "Average for the given numbers : $num\n";

# Function definition
sub PrintHello {
   # Private variable for PrintHello function
   my $string; #Lexical scoping is done with my
   $string = "Hello, Perl!";
   print "Inside the function $string\n";
}
# Function call
PrintHello();
print "Outside the function $string\n";

sub PrintHello {
   # Private variable for PrintHello function
   local $string;
   $string = "Hello, Perl!";
   PrintMe();
   print "Inside the function PrintHello $string\n";
}
sub PrintMe {
   print "Inside the function PrintMe $string\n";
}

# Function call
PrintHello();
print "Outside the function $string\n";

use feature 'state'; #state variables will not be reinitialized
sub PrintCount { 
   state $count = 0; # initial value

   print "Value of counter is $count\n";
   $count++;
}

for (1..5) {
   PrintCount();
}


#referencing
$var = 10;

# Now $r has reference to $var scalar.
$r = \$var;

# Print value available at the location stored in $r. 
print "Value of $var is : ", $$r, "\n"; #(when we put another $ after the reference, it will give the values stored in the memory location)

@var = (1, 2, 3);
# Now $r has reference to @var array.
$r = \@var;
# Print values available at the location stored in $r.
print "Value of @var is : ",  @$r, "\n";

%var = ('key1' => 10, 'key2' => 20);
# Now $r has reference to %var hash.(backslash is for reference)
$r = \%var;
# Print values available at the location stored in $r.
print "Value of %var is : ", %$r, "\n";

#understanding the type of a variable
$var = 10;
$r = \$var; #first make reference and then use ref() function on the reference
print "Reference type in r : ", ref($r), "\n";

@var = (1, 2, 3);
$r = \@var;
print "Reference type in r : ", ref($r), "\n";

%var = ('key1' => 10, 'key2' => 20);
$r = \%var;
print "Reference type in r : ", ref($r), "\n";

#Using the format 
=begin comment
format FormatName =  #format name is the name of the format
fieldline              #The fieldline is the specific way, the data should be formatted.
value_one, value_two, value_three       #
fieldline
value_one, value_two
.

field holders are:
@<<<< left-justified
@>>>> right-justified
@|||| centered
@####.## numeric field holder
@* multiline field holder
=cut
#$name would be written as left justify within 22 character spaces 
#and after that age will be written in two spaces.
format EMPLOYEE =
==================================================
@<<<<<<<<<<<<<<<<<<<<<< @<<    @#####.##
$name, $age,$salary;
===================================================
.

#defining a report header and also pagination with (Page @< $%)
format EMPLOYEE_TOP =
====================================================
Name                    Age     salary    Page @<
                                           $%
==================================================== 
.


select(STDOUT); #As we want the data sent to the STDOUT, we must associate EMPLOYEE with the STDOUT filehandle.
$~ = EMPLOYEE; #setting the new format name with STDOUT, using the special variable $~ or $FORMAT_NAME
$^ = EMPLOYEE_TOP; # define a header and assign it to $^ or $FORMAT_TOP_NAME variable −

@n = ("Ali", "Raza", "Jaffer");
@a  = (20,30, 40);
@s = (2000.00, 2500.00, 4000.000);

$i = 0;
foreach (@n) {
   $name = $_;
   $age = $a[$i];
   $salary = $s[$i];
   $i++;
   write;
}

#IO operations on perl
=begin comment
$fh is a scalar variable we just defined inside the open()
The second parameter defines the way we are opening the file. In this case, it is for writing(greater sign >)
The third parameter is the path to the file that we would like to open
Once the file is open we can use the $fh file-handle in a print statement(printing the text into the file)
If we want to open a file for writing we use >, but if we want to append something to file we use >>
=cut

#A my declares the listed variables to be local (lexically) to the enclosing block, file, or eval.
use strict; #these two are needed for both reading and writing
use warnings;
use 5.010; #used for appending
my $filename = 'C:\Users\Azam\Documents\report.txt'; 
open(my $fh, '>', $filename) or die "Could not open file '$filename' $!";
print $fh "My first report generated by perl\n"; 
close $fh;
open( $fh, '>>', $filename) or die "Could not open file '$filename' $!"; #we open again for appending things
say $fh "My first appendix to the report generated by perl"; #say is an equivalent for the print
close $fh;
print "done\n";
say 'done';

 
my $readfilename = 'C:\Users\Azam\Documents\report.txt';
open(my $nfh, '<:encoding(UTF-8)', $readfilename)
  or die "Could not open file '$readfilename' $!";
 
while (my $row = <$nfh>) {
  chomp $row;
  print "$row\n";
}






=begin comment
print( "what is your name?\n");
$name=<STDIN>;
print("what is your age?\n");
$age=<STDIN>;
print("what is your salary per month?\n");
$salary=<STDIN>;
print("you are $name your age is $age and you eran $salary dollars per month\n");
=cut





