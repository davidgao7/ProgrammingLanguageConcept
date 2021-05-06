# this is a program language that follows both dynamic scoping and static scoping

$x = 50; # global variable

sub fun2{
  return $x; # this x can see the local $x 10 at line 12
}

#local : dynamic scoping
#my   : static scoping
sub fun1{
  local $x = 10; #local: make variable visible up the call statck too (fun2 can see x too)
  my $y = fun2(); #my: makes variable visible only where it's declared(only visible in fun1)
  return $y;
}

print fun1(); #10 since the 'local' on line 12, it's visible to fun2(dynamic)

sub fun3{
  my $x = 10; # x is only visible in fun3 only now, fun2 can only see the global x 50 now
  my $y = fun2();
  return $y;
}

print fun3(); #50 since the 'my' in line 20, it's only visible in fun3 now (static)
#run perl: perl xxx.perl
