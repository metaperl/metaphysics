<?php

	$base = '/usr/local/lib/php/smarty/' ;

// put full path to Smarty.class.php
require($base . 'Smarty.class.php');
$smarty = new Smarty();

$smarty->template_dir = '/web/www.domain.com/smarty/templates';
$smarty->compile_dir = '/web/www.domain.com/smarty/templates_c';
$smarty->cache_dir = '/web/www.domain.com/smarty/cache';
$smarty->config_dir = '/web/www.domain.com/smarty/configs';

$smarty->assign('name', 'Ned');
$smarty->display('index.tpl');

?>
