<<<<<<< HEAD
package my_MySQL_library::Perl::module::mysqli_connection;

use constant INIT => 0; # 初期化定数宣言 

use strict;
use DBI;
use Data::Dumper;
{
	local $Data::Dumper::Deparse = 1; #リファレンスの中身をDumperで表示する
}

sub new{
	my $class=shift; # 1パラメータの内容はクラス名、ここでは Class1
	my $self={dbh=>INIT}; #メンバ変数を保持する連想配列．無名ハッシュのリファレンス
	return bless $self,$class; #メンバ変数を保持する連想配列をクラス名に連携する
}

# データベース接続
sub connect{
	my $self=shift; # 第1引数は Class1 オブジェクト(メンバ変数を保持する連想配列)
	my ($name,$host,$port,$user,$pass)=@_;
	my $connect_str="dbi:mysql:dbname=".$name.";host=".$host.";port=".$port;
	print $connect_str;
	my $dbh = DBI->connect($connect_str,$user,$pass) or die "$!\n Error: failed to connect to DB.\n"; # データベースハンドルオブジェクト
	$self->{"dbh"}=$dbh;
	
	return 0;
}

# データベース切断
sub disconnect{
	my $self=shift; 
	my $dbh=$self->{dbh};

	return $dbh->disconnect;
}

# クエリー出力
sub db_query{
	my $self=shift;
	my ($sql)=@_;

	my $dbh=$self->{"dbh"};
	print Dumper($self);
	
	# クエリー発行
	return $dbh->prepare($sql);
}

# クエリー内容を実行
sub db_fetch_assoc{
	my $self=shift;
	my ($sql)=@_;

	my $sth=&db_query($self,$sql);

	# クエリー実行
	$sth->execute();

	my @db_data;
	while(my $ary_ref=$sth->fetchrow_arrayref){
		my @line=@$ary_ref;
		push(\@db_data,\@line);
	}
	#print Dumper @db_data;
	return @db_data;
}

1; # packageなので
=======
#package my_MySQL_library::Perl::module::mysqli_connection;
package mysqli_connection;

use constant INIT => 0; # 初期化定数宣言 

use strict;
use DBI;
use Data::Dumper;
{
	local $Data::Dumper::Deparse = 1; #リファレンスの中身をDumperで表示する
}

sub new{
	my $class=shift; # 1パラメータの内容はクラス名、ここでは Class1
	my $self={dbh=>INIT}; #メンバ変数を保持する連想配列．無名ハッシュのリファレンス
	return bless $self,$class; #メンバ変数を保持する連想配列をクラス名に連携する
}

# データベース接続
sub connect{
	my $self=shift; # 第1引数は Class1 オブジェクト(メンバ変数を保持する連想配列)
	my ($name,$host,$port,$user,$pass)=@_;
	my $connect_str="dbi:mysql:dbname=".$name.";host=".$host.";port=".$port;
	#print $connect_str;
	my $dbh = DBI->connect($connect_str,$user,$pass) or die "$!\n Error: failed to connect to DB.\n"; # データベースハンドルオブジェクト
	$self->{"dbh"}=$dbh;
	
	return 0;
}

# データベース切断
sub disconnect{
	my $self=shift; 
	my $dbh=$self->{dbh};

	return $dbh->disconnect;
}

# クエリー出力
sub db_query{
	my $self=shift;
	my ($sql)=@_;

	my $dbh=$self->{"dbh"};
	print Dumper($self);
	
	# クエリー発行
	return $dbh->prepare($sql);
}

# クエリー内容を実行
sub db_fetch_assoc{
	my $self=shift;
	my ($sql)=@_;

	my $sth=&db_query($self,$sql);

	# クエリー実行
	$sth->execute();

	my @db_data;
	# hash として，保存する
	while(my $hash_ref=$sth->fetchrow_hashref){
		my %line=%$hash_ref;
		push(\@db_data,\%line);
	}
	# array として，保存する
	#while(my $ary_ref=$sth->fetchrow_arrayref){
	#	my @line=@$ary_ref;
	#	push(\@db_data,\@line);
	#}
	print Dumper @db_data;
	return @db_data;
}

1; # packageなので
>>>>>>> 63bbd06724e3b2626b2365c62b53e90bd59ea906
