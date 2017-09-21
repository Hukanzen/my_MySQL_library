<?php
/* 
    未完成
            */

class mysqli_connection
{
	/* mysqli 関連の自作関数 */
	/* リンクid */
	private $pri_linkid;

	/* コンストラクタ．全て埋まる指定があれば，DBと接続する */
	public function __construct($server,$user,$pass,$db_name){
		if(isset($server) and isset($user) and isset($pass) and isset($db_name)){
			$this->db_connect($server,$user,$pass,$db_name);	
		}
	}

	/* DBと接続 */
	public function db_connect($server,$user,$pass,$db_name){
		$linkid=mysqli_connect($server,$user,$pass,$db_name);
		if(!$linkid) die("Failure mysqli_connect".mysqli_error($linkid));
		/* 文字コードの指定 */
		mysqli_set_charset($linkid,"utf8");
		//return $linkid;
		$this->$pri_linkid=$linkid;
	}

	/* クエリの作成 */
	public function db_query($SQL,$linkid){
		/* エスケープ */
		$SQL=mysqli_real_escape_string($linkid,$SQL);
		$rslt=mysqli_query($linkid,$SQL);
		if(!$rslt) die("$SQL is Failure".mysqli_error($linkid));
		return $rslt;
	}

	/* SQL文で取得できるデータの個数を返す．*/
	public function db_num_rows($SQL,$linkid){
		$rslt=db_query($SQL,$linkid);
		$num=mysqli_num_rows($rslt);
		return $num;
	}

	function db_fetch($SQL,$linkid){
		$data=array();
		$rslt=db_query($SQL,$linkid);
		while($fet=mysqli_fetch_assoc($rslt)){
			array_push($data,$fet);
		}
		return $data;
	}

	function db_a_query($aSQL,$linkid){
		$aRSLT=array();
		foreach($aSQL as $sql){
			$rslt=db_query($sql,$linkid);
			if(!$rslt){
				die("$sql is Failure.".mysqli_error($linkid));
				break;
			}
			array_push($aRSLT,$rslt);
		}
		return $aRSLT;
	}

	function db_a_fetch_assoc($aSQL,$linkid){
		$aRSLT=db_a_query($aSQL,$linkid);
		$aFET=array();
		$i=0;
		foreach($aRSLT as $rslt){
				array_push($aFET,array());
			while($fet=mysqli_fetch_assoc($rslt)){
				array_push($aFET[$i],$fet);
			}
			$i++;
		}
		return $aFET;
	}

	function db_close($linkid){
		mysqli_close($linkid);
	}
}
?>
