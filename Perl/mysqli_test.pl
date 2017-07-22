#!/usr/bin/env perl

use strict;
use warnings;
use lib './module';
use mysqli_connection;

&main;

sub main{
	my $db_user=my_mysqliconnction->new("performance_schema","root","","","3306","users");

	my @data=$db_user->db_fetch_assoc("SELECT * FROM users;");
	
	$db_user->disconnect;

	foreach(@data){
		print $_."\n";
	}
}