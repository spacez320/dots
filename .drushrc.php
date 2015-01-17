<?php

// verbosity
$options['v'] = 1;

// shell aliases
$options['shell-aliases']['pull'] = '!git pull';
$options['shell-aliases']['push'] = '!git push';
$options['shell-aliases']['wipe'] = 'cache-clear all';
$options['shell-aliases']['offline'] = 'variable-set -y --always-set maintenance_mode 1';
$options['shell-aliases']['online'] = 'variable-delete -y --exact maintenance_mode';

// default settings for drupal installs
$options['site-install'] = array(
    'account-name' => 'admin',
    'site-name' => gethostname()
);

// clone extensions from drupal.org
$options['package-handler'] = 'git_drupalorg';

// always submodule
$options['gitsubmodule'] = true;

// database dumping
$options['drump-dir'] = '/var/drush/bak/';

// send anonymous usage stats to Drush dev
$options['drush_usage_log'] = TRUE;
$options['drush_usage_send'] = TRUE;

?>
