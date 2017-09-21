require "Class1.pm";

my $obj = Class1->new;  # Class1 のコンストラクタを呼出しインスタンス化
print $obj->get, "\n";  # 初期値が 0 であることを確認。
$obj->set(5);           # 値を書き換える。
print $obj->get, "\n";  # 値が 5 になったことを確認。

$obj->plus(1,2);        # 5に1と2を加算する => 8
print $obj->get,"\n";