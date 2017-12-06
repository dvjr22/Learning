<?php

namespace Acme\Tools;

class Foo {


	public function doFoo() {

		echo "Hi listeners\n";

		$this->otherFoo();

	}

	private function otherFoo() {

		echo "Private function\n";
	}

}

class Fang {

	public function doFang() {

		echo "In Fang\n";
	}

	function checkFang() {

		echo "public function\n";
	}

	public function moreTests($var) {

		echo $var. "\n";
	}

}
	




?>
