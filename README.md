# MySQL connection Library.
https://github.com/Hukanzen/my_MySQL_library

* MySQL を PHP,Perl から操作する関数やClassが非常に自分に合わなかったので、魔改造したものです。

* そこまで大したものでは、ありません。

## 利点
* 
<pre>

BEGIN

構文組み立て

接続

while(データを持ってくる){

    持ってきたデータを処理する

}

切断

END

</pre>

上記のようなプログラムを下記の様に書けます．

<pre>

BEGIN

構文組み立て

接続

データを変数に代入

切断

foreach(変数){

    変数内のデータを処理する

}

END

</pre>

* DBとの接続時間を減らせます



## DBのサンプル
|USER | CURRENT_CONNECTIONS | TOTAL_CONNECTIONS|
|-----|---------------------|------------------|
| UNKNOWN_MYSQL_US |                   0 |                 1 |
| NULL             |                  18 |                20 |
| root             |                   1 |                 3 |

## Perl
* `use_Sample.pl` と，`db_Sample.pl` を実行し，比べてみてください．

* Perlの実行結果
```bash
$VAR1 = [
          'UNKNOWN_MYSQL_US',
          '0',
          '1'
        ];
$VAR2 = [
          undef,
          '18',
          '20'
        ];
$VAR3 = [
          'root',
          '1',
          '3'
        ];
```
## PHP
* 各関数を使ってみてください．


# 連絡先
Twitterが一番捕まりやすいです．[@AkihisaYoshii4](https://twitter.com/AkihisaYoshii4)

PHP:PDO版も製作予定。
