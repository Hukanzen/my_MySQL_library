<?php

	/* mysqli 関連の自作関数 */
	
	/* DBと接続 */
	function db_connect($server,$user,$pass,$db_name){
		$linkid=mysqli_connect($server,$user,$pass,$db_name);
		if(!$linkid) die("Failure mysqli_connect".mysqli_error($linkid));
		/* 文字コードの指定 */
		mysqli_set_charset($linkid,"utf8");
		return $linkid;
	}

//	function db_select($linkid){
//		$db_rslt=mysqli_select_db('mecab',$linkid);
//		if(!$db_rslt) die("Failure select db".mysqli_error($linkid));
//	}

	/* クエリの作成 */
	function db_query($SQL,$linkid){
		$rslt=mysqli_query($linkid,$SQL);
		if(!$rslt) die("$SQL is Failure".mysqli_error($linkid));
		return $rslt;
	}

	/* SQL文で取得できるデータの個数を返す．*/
	function db_num_rows($SQL,$linkid){
		$rslt=db_query($SQL,$linkid);
		$num=mysqli_num_rows($rslt);
		return $num;
	}

	/* SQL文を投げて，データを取得し，配列で返す */
	function db_fetch($SQL,$linkid){
		$data=array();
		$rslt=db_query($SQL,$linkid);
		while($fet=mysqli_fetch_assoc($rslt)){
			array_push($data,$fet);
		}
		return $data;
	}

	/* 配列のSQL文を投げて，クエリを取得し，配列で返す */
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

	/* 配列のSQL文を投げて，データを取得し，配列で返す*/
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

	/* DBとの接続を切断する */
	function db_close($linkid){
		mysqli_close($linkid);
	}
?>
