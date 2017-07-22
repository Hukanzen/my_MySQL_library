package mysqli_connection;

use constant INIT => 0; # 初期化定数宣言 

use strict;
use DBI;

sub new{
	my $class=shift; # 1パラメータの内容はクラス名、ここでは Class1
	my %self; #メンバ変数を保持する連想配列
	%self->{dbh}=INIT;
	return belss %self,$class; #メンバ変数を保持する連想配列をクラス名に連携する
}

# データベース接続
sub connect{
	my $self=shift; # 第1引数は Class1 オブジェクト(メンバ変数を保持する連想配列)
	my ($name,$host,$port,$user,$pass)=@_;
	#my $dbh = DBI->connect("dbi:mysql:dbname=$DB_NAME;host=$DB_HOST;port=$DB_PORT","$DB_USER","$DB_PASS") or die "$!\n Error: failed to connect to DB.\n";
	my $dbh = DBI->connect("dbi:mysql;dbname=".$name.";host=".$host.";port=".$port,$user,$pass) or die "$!\n Error: failed to connect to DB.\n"; # データベースハンドルオブジェクト
	$self->{dbh}=$dbh;

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
	#my $self=shift;
	my ($self,$sql)=@_;

	my $dbh=$self->{dbh};

	# クエリー用意
	my $sth = $dbh->prepare($sql);

	# クエリー発行
	return $sth->execute();
}

# クエリー内容を実行
sub db_fetch_assoc{
	my $self=shift;
	my ($sql)=@_;

	my $query=&db_query($self,$sql);

	my @db_data;
	while(my $ary_ref=$query->fetchrow_arrayref){
		my @line=@$ary_ref;
		push(@db_data,@line);
	}

	return @db_data;
}

1; # packageなので