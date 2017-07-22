#!/usr/bin/env perl

use strict;
use warnings;
use lib './module';
use mysqli_connection;

&main;

sub main{
	my $db_user=new mysqli_connection;
	$db_user->connect("performance_schema","localhost","3306","root","");
	my @data=$db_user->db_fetch_assoc("SELECT * FROM users;");
	
	$db_user->disconnect;

	foreach(@data){
		print $_."\n";
	}
}