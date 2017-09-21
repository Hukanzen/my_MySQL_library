#!/usr/bin/env perl

# http://db.just4fun.biz/?Perl/DBI%E3%82%92%E4%BD%BF%E3%81%A3%E3%81%A6MySQL%E3%81%A7SELECT%E6%96%87%E3%82%92%E5%AE%9F%E8%A1%8C%E3%81%99%E3%82%8B

use strict;
use DBI;

my $DB_NAME="performance_schema";
my $DB_USER="root";
my $DB_PASS="";
my $DB_HOST="";
my $DB_PORT="3306";
my $DB_TABLE="users";

my $dbh = DBI->connect("dbi:mysql:dbname=$DB_NAME;host=$DB_HOST;port=$DB_PORT","$DB_USER","$DB_PASS") or die "$!\n Error: failed to connect to DB.\n";
my $sth = $dbh->prepare("SELECT * FROM $DB_TABLE;");
$sth->execute();

my $arr_ref;
while($arr_ref=$sth->fetchrow_arrayref){
	print $arr_ref->[0]." ".$arr_ref->[1]."\n";
}

$sth->finish;
$dbh->disconnect;