<?php
$cfg['Servers'][1]['host'] = getenv('DB_HOST');
$cfg['Servers'][1]['port'] = getenv('DB_PORT');
$cfg['Servers'][1]['user'] = getenv('DB_USER');
$cfg['Servers'][1]['password'] = getenv('DB_PASS');
$cfg['Servers'][1]['auth_type'] = 'config';
$cfg['PmaAbsoluteUri'] = '';
