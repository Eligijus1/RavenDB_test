<?php

use RavenDBTest\RavenDB;

include_once 'Class/RavenDB.php';


$r = new RavenDB();

$r->putDocument(['testDoc1' => 1, 'Name' => 'aaaa']);

$d = $r->getDocumentsList();
var_dump($d);



