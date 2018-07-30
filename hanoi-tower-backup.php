<?php
  const ONE_DAY_SECOND = 86400;

  if(isset($argv[1])) {
    $p = intval($argv[1]);
  } else {
    $p = intval(date("j"));
  }

  if($p == 1) {
    echo 180 * ONE_DAY_SECOND;
    exit(0);
  }
  for($i = 0; $i <5;$i++) {
    if(0 != 0x01 & ( $p >> $i )) {
      $m = 0x01 << $i;
        break;
    }
  }
  echo $m * 2 * ONE_DAY_SECOND;
?>
