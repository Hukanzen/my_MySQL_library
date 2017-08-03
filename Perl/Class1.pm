package Class1;

# コンストラクタ
sub new {
  my %self;   # メンバ変数を保持する連想配列
  my $class = shift;  # 第１パラメータの内容はクラス名、ここでは Class1。
  $self->{value} = 0; # メンバ変数 value を初期化
  return bless $self, $class;  # メンバ変数を保持する連想配列をクラス名に連携する。
}

# 値を返す。
sub get {
  my $self = shift;  # 第１引数は Class1 オブジェクト(メンバ変数を保持する連想配列)
  return $self->{value};  # 連想配列のメンバ 'value' の値を返す。
}

# 値を変更する。
sub set {
  my $self = shift;  # 第１引数は Class1 オブジェクト(メンバ変数を保持する連想配列)
  $self->{value} = shift; # 連想配列のメンバ 'value' の値を変更する。
}

# 既にある値に，引数の2つの値を加算する．
sub plus{
	my $self=shift;  # 第１引数は Class1 オブジェクト(メンバ変数を保持する連想配列)
	my ($x,$y)=@_;  # 引数2つを変数($x,$y)に代入
	$self->{value}+=($x+$y); # 加算する

}

1;  # <= 注意