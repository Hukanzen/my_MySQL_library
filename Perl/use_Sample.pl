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
	my $db_user=mysqli_connection->new;
	$db_user->connect("performance_schema","localhost","3306","root","");
	my @data=$db_user->db_fetch_assoc("SELECT * FROM users;");
	
	$db_user->disconnect;

	#print Dumper @data;

	foreach(@data){
		#print "$_->[0]"."\n";
		print "$_->{TOTAL_CONNECTIONS}"."\n";
	}
}
