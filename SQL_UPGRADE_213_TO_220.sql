DELETE FROM `settings` WHERE `group` = 'mail_server';
INSERT INTO `settings` (`id`, `group`, `variable`, `value`, `default`, `group_access`, `description`, `is_deleted`) VALUES
(NULL, 'mail_server', 'sendgrid_username', NULL, '', 'administrator, super_user', 'Sendgrid Username', 'false'),
(NULL, 'mail_server', 'sendgrid_password', NULL, '', 'administrator, super_user', 'Sendgrid Password', 'false'),
(NULL, 'mail_server', 'sendgrid_api_key', NULL, '', 'administrator, super_user', 'Sendgrid API Key', 'false');