#!/usr/bin/env perl

use strict;
use warnings;
use lib './module';
use mysqli_connection;
use Data::Dumper;
{
	local $Data::Dumper::Deparse = 0; #リファレンスの中身をDumperで表示しない.1で表示する.
}

&main;

sub main{
	my $db_user=new mysqli_connection;
	$db_user->connect("performance_schema","localhost","3306","root","");
	my @data=$db_user->db_fetch_assoc("SELECT * FROM users;");
	
	$db_user->disconnect;
	
	print Dumper @data;
}