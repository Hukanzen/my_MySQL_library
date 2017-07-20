package my_mysql::mysqli_connection;

use strict;
use DBI;

sub new{
	my $class=shift;
	my ($name,$host,$port,$user,$pass)=@_;
	#my $dbh = DBI->connect("dbi:mysql:dbname=$DB_NAME;host=$DB_HOST;port=$DB_PORT","$DB_USER","$DB_PASS") or die "$!\n Error: failed to connect to DB.\n";
	my $dbinfo="dbi:mysql;dbname=".$name.";host=".$host.";port=".$port;
	my $dbh = DBI->connect($db_info,$user,$pass) or die "$!\n Error: failed to connect to DB.\n";

	return belss $dbh;
}

sub delete{
	my ($dbh)=@_;
	$dhb->disconnect;
}

sub db_query{
	my ($sql,dbh)=@_;

	my $sth = $dbh->prepare($sql);
	$sth->execute();

	return $sth;
}