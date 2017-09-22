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


## Perl
* `use_Sample.pl` と，`db_Sample.pl` を実行し，比べてみてください．

* Perlの実行結果<br>
<table>
    <tr><td><pre>$ perl use_Sample.pl > perl_sample.txt</pre></td><td><a href=Perl/perl_sample.txt>perl_sample.txt</a></td></tr>
</table>

## PHP
* 各関数を使ってみてください．

* PHPの実行結果
<table>
    <tr><td><pre>$ php sample.php > php_sample.txt</pre></td><td><a href="PHP/php_sample.txt">php_sample.txt</td></tr>
    <tr><td><pre>$ php class_sample.php > php_class_sample.txt</pre></td><td><a href="PHP/php_class_sample.txt">php_class_sample.txt</td></tr>
</table>


# 連絡先
Twitterが一番捕まりやすいです．[@AkihisaYoshii4](https://twitter.com/AkihisaYoshii4)

PHP:PDO版も製作予定。
