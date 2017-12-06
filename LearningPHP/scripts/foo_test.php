<?php


// Files to add
require '/home/valdeslab/LearningPHP/Foo.php';
require '/home/valdeslab/LearningPHP/A.php';
require '/home/valdeslab/LearningPHP/NameSpaceTest.php';

// namespaces from above files
use Acme\Tools\Foo;
use Acme\Tools\Fang;
use Test\Tools\A;
use Triage\InsertTools;
use Pdb\InsertTools as pdb;
use Heroes\Batman;

// This doesn't seem to be working
use function Heroes\Batman\onPatrol as func;


$var = "Works, baby!\n";

$foo = new Foo();
$fang = new Fang();
$a = new A();

$foo->doFoo();
$fang->doFang();
$a->testA();

$fang->moreTests($var);


$triage = new InsertTools;
$pdb = new pdb;

$triage->insert("yup");
$pdb->insert("yup");

$batman = new Batman();
$batman->onPatrol();

?>
