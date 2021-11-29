CREATE DATABASE IF NOT EXISTS `gateway`;
GRANT ALL ON `gateway`.* TO 'root'@'%';

CREATE DATABASE IF NOT EXISTS `usermanagement`;
GRANT ALL ON `usermanagement`.* TO 'root'@'%';

CREATE DATABASE IF NOT EXISTS `apdu`;
GRANT ALL ON `apdu`.* TO 'root'@'%';

CREATE DATABASE IF NOT EXISTS `biometricverification`;
GRANT ALL ON `biometricverification`.* TO 'root'@'%';

CREATE DATABASE IF NOT EXISTS `ca`;
GRANT ALL ON `ca`.* TO 'root'@'%';

CREATE DATABASE IF NOT EXISTS `reportsmanagement`;
GRANT ALL ON `reportsmanagement`.* TO 'root'@'%';

CREATE DATABASE IF NOT EXISTS `notificationservice`;
GRANT ALL ON `notificationservice`.* TO 'root'@'%';

CREATE DATABASE IF NOT EXISTS `keycloak`;
GRANT ALL ON `keycloak`.* TO 'root'@'%';
