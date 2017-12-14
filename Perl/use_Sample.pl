#!/usr/bin/env perl

use strict;
use warnings;
use lib './module';
use mysqli_connection;
use Data::Dumper;
{
	local $Data::Dumper::Deparse = 1; #リファレンスの中身をDumperで表示しない.1で表示する.
}

&main;

sub main{
	# DBの名前
	my $DB_NAME="test_db";
	# DBのアドレス
	my $DB_ADDR="localhost";
	# ポート番号
	my $PORT="3306";
	# DBユーザ名
	my $USER="test_user";
	# DBユーザパスワード
	my $PASS="password";

	# クラス作成
	my $db_user=mysqli_connection->new;
	# DB接続
	$db_user->connect($DB_NAME,$DB_ADDR,$PORT,$USER,$PASS);
	# hashでデータを取得
	my @data_hash=$db_user->db_fetch_assoc_hash("SELECT * FROM test_db.test_table;");
	# arrayでデータを取得
	my @data_array=$db_user->db_fetch_assoc_hash("SELECT * FROM test_db.test_table;");	
	# DBとの接続を解除
	$db_user->disconnect;
	
	# 結果出力
	print Dumper @data_hash;
	print Dumper @data_array;
}
