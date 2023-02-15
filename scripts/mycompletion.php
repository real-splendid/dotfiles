#!/usr/bin/env php
<?php

$in = file_get_contents("php://stdin");
$ins = preg_split('/\s+/u', trim($in));
$outs = [
    'p' => "<?php\n\n\n",
    'f' => "function () {\n    \n}\n",
];
echo $outs[$in[0]] ?? $in;
