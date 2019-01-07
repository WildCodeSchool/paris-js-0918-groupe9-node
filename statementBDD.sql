INSERT INTO `allsponsored`.`sponsor` (`id`, `name`) VALUES ('1', 'Credit Agricole');
INSERT INTO `allsponsored`.`sponsor` (`id`, `name`) VALUES ('2', 'Societe General');
INSERT INTO `allsponsored`.`sponsor` (`id`, `name`) VALUES ('3', 'Banque Populaire');
INSERT INTO `allsponsored`.`sponsor` (`id`, `name`) VALUES ('4', 'BNP Parisbas');
INSERT INTO `allsponsored`.`sponsor` (`id`, `name`) VALUES ('5', 'LCL');


INSERT INTO `allsponsored`.`user` (`id`, `last_name`, `first_name`, `email`, `status`, `role`, `password`) VALUES ('1', 'Lucereau', 'Steven', 'stevens.lucereau@allsponsored.com ', 'active', 'admin', '12345');

INSERT INTO `allsponsored`.`project` (`id`, `user_id`, `name`, `status`, `visual_shirt`) VALUES ('2', '1', 'CA 10 Parkas', 'active', 'https://www.google.fr/url?sa=i&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwjgkMfjk47fAhVOzRoKHXB3Bw8QjRx6BAgBEAU&url=https%3A%2F%2Fwww.footkorner.com%2Fveste-nike-windrunner-enfant-equipe-de-france-bleu-cdm18&psig=AOvVaw0-Jeif3aOu0ytn2QqigQsA&ust=1544287059500349');
INSERT INTO `allsponsored`.`project` (`id`, `user_id`, `name`, `status`, `visual_shirt`) VALUES ('1', '1', 'CA 50 Maillots', 'active', 'https://www.google.fr/url?sa=i&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwjS3O34kY7fAhULtRoKHTdODr0QjRx6BAgBEAU&url=https%3A%2F%2Fmaillotequipedefrance2018.com%2Fensemble-equipe-de-france-enfant-exterieur-2015.html&psig=AOvVaw1Hz1EY9KZFrVKxChluF1WO&ust=1544286560060573');
INSERT INTO `allsponsored`.`project` (`id`, `user_id`, `name`, `status`, `visual_shirt`) VALUES ('3', '1', '100 ballons', 'active', 'https://www.google.fr/url?sa=i&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwiRiIO5jpPfAhUQzYUKHdUCBdgQjRx6BAgBEAU&url=http%3A%2F%2Fwww.sport-tv.org%2F2018%2F12%2Ffoot-journee-speciale-ballon-d-or-ce-lundi-sur-la-chaine-l-equipe.html&psig=AOvVaw2tjx7dCSq-iE21-46mDXaF&ust=1544457434865722');
INSERT INTO `allsponsored`.`project` (`id`, `user_id`, `name`, `status`, `visual_shirt`) VALUES ('4', '1', 'Ensemble tenue', 'active', 'https://www.google.fr/url?sa=i&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwim2YDgjpPfAhVLPBoKHY1rAxoQjRx6BAgBEAU&url=https%3A%2F%2Fwww.commeuncamion.com%2F2017%2F10%2F13%2Fquelle-tenue-pour-quel-sport%2F&psig=AOvVaw3Wr2OTXYy4rq930fmBLd46&ust=1544457515913224');
INSERT INTO `allsponsored`.`project` (`id`, `user_id`, `name`, `status`, `visual_shirt`) VALUES ('5', '1', 'Goude', 'active', 'https://www.google.fr/url?sa=i&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwjek6npjpPfAhVSxYUKHeohBK0QjRx6BAgBEAU&url=https%3A%2F%2Fwww.cdiscount.com%2Fle-sport%2Fr-survetement%2Bfc%2Bbarcelone.html&psig=AOvVaw3Wr2OTXYy4rq930fmBLd46&ust=1544457515913224');

INSERT INTO `allsponsored`.`project_has_sponsor` (`project_id`, `sponsor_id`) VALUES ('3', '5');
INSERT INTO `allsponsored`.`project_has_sponsor` (`project_id`, `sponsor_id`) VALUES ('4', '2');
INSERT INTO `allsponsored`.`project_has_sponsor` (`project_id`, `sponsor_id`) VALUES ('5', '4');



INSERT INTO `allsponsored`.`club` (`id`,`address`,`email`,`password`,`name`,`phone`,`url_logo`,`url_logo_vectorized`,`created_at`,`updated_at`) VALUES (1,'8 rue Poissy, 75006 Paris','coucou@yopmail.com','12345','Football MU',3356789,'http://colorhalloween.club/wp-content/uploads/2018/08/dessin-logo-club-de-foot-excellent-architecture-manchester-united-pertaining-to-dessin-logo-club-de-foot.png','www.logovec.com','2018-12-03 14:37:53','2018-12-03 14:37:53');
INSERT INTO `allsponsored`.`club` (`id`,`address`,`email`,`password`,`name`,`phone`,`url_logo`,`url_logo_vectorized`,`created_at`,`updated_at`) VALUES (2,'23 rue de rennes','papa@yopmail.com','67890','Basket Nantes',123456,'https://www.designevo.com/res/templates/thumb_small/red-baseball-club.png',NULL,'2018-12-03 15:29:42','2018-12-03 15:29:42');
INSERT INTO `allsponsored`.`club` (`id`,`address`,`email`,`password`,`name`,`phone`,`url_logo`,`url_logo_vectorized`,`created_at`,`updated_at`) VALUES (3,'89 rue Paris','lolo@yopmail.com','01234','Football ABC',12345,'https://www.ouest-france.fr/sites/default/files/styles/image-640x360-p/public/2017/01/17/football-le-changement-de-logo-nouvelle-mode-des-clubs-de-foot.png?itok=Zg9jG6XQ','https://www.ouest-france.fr/sites/default/files/styles/image-640x360-p/public/2017/01/17/football-le-changement-de-logo-nouvelle-mode-des-clubs-de-foot.png?itok=Zg9jG6XQ','2018-12-03 15:32:05','2018-12-03 15:32:05');
INSERT INTO `allsponsored`.`club` (`id`,`address`,`email`,`password`,`name`,`phone`,`url_logo`,`url_logo_vectorized`,`created_at`,`updated_at`) VALUES (4,NULL,'testbcrypt@yahoo.com','$2b$10$NnaUbpPWnTm7yrWWRUCqyeIVfIGbs06FoRTx.9rcWorfwFBAOJNie','Club Virtuel',NULL,NULL,NULL,'2018-12-10 17:05:02','2018-12-10 17:05:02');

INSERT INTO `allsponsored`.`contract` (`id`,`project_id`,`club_id`,`name`,`url_contract`,`url_signed_contract`,`status`,`created_at`,`updated_at`) VALUES (1,1,1,'projet CA-MU','www.contrat.com','www.contrat.com','active','2018-12-09 23:01:20','2018-12-09 23:01:20');
INSERT INTO `allsponsored`.`contract` (`id`,`project_id`,`club_id`,`name`,`url_contract`,`url_signed_contract`,`status`,`created_at`,`updated_at`) VALUES (2,2,2,'projet CA-Nantes','www.convention.com','www.covention.com','active','2018-12-09 23:01:20','2018-12-09 23:01:20');
INSERT INTO `allsponsored`.`contract` (`id`,`project_id`,`club_id`,`name`,`url_contract`,`url_signed_contract`,`status`,`created_at`,`updated_at`) VALUES (3,3,1,'projet 10 ballons','www.ballon.com','www.coo.com','active','2018-12-09 23:01:20','2018-12-09 23:01:20');


INSERT INTO `allsponsored`.`order` (`id`, `delivery_address`, `reference`, `tracking_number`, `contract_id`) VALUES ('1', '5 rue provence', '12345', '123456789', '1');
INSERT INTO `allsponsored`.`order` (`id`, `delivery_address`, `reference`, `tracking_number`, `contract_id`) VALUES ('2', '9 rue paris', '67890', '1234566789', '2');
INSERT INTO `allsponsored`.`order` (`id`, `delivery_address`, `reference`, `tracking_number`, `contract_id`) VALUES ('3', '56 rue darguerre', '098765', '0987654321', '3');

ALTER TABLE `allsponsored`.`survey` 
CHANGE COLUMN `updated_at` `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ;

INSERT INTO `allsponsored`.`survey` (`id`, `status`, `contract_id`) VALUES ('1', 'active', '1');
INSERT INTO `allsponsored`.`survey` (`id`, `status`, `contract_id`) VALUES ('2', 'active', '2');
INSERT INTO `allsponsored`.`survey` (`id`, `status`, `contract_id`) VALUES ('3', 'active', '3');

Van 18/12
UPDATE `allsponsored`.`contract` SET `name`='projet CA-MU:50 maillots' WHERE `id`='1';
UPDATE `allsponsored`.`contract` SET `name`='projet CA-Nantes:10parkas' WHERE `id`='2';

INSERT INTO `allsponsored`.`contract` (`id`, `project_id`, `club_id`, `name`, `url_contract`, `url_signed_contract`, `status`) VALUES ('4', '1', '3', 'projet CA-ABC: 50 maillots', 'www.contract.com', 'dahoidhazoid', 'active');

VAN 28/12
INSERT INTO `allsponsored`.`product` (`id`, `name`, `category`) VALUES ('1', 'maillot', 'vetement');
INSERT INTO `allsponsored`.`product` (`id`, `name`, `category`) VALUES ('2', 'short', 'vetement');
INSERT INTO `allsponsored`.`product` (`id`, `name`, `category`) VALUES ('3', 'parka', 'vetement');
INSERT INTO `allsponsored`.`product` (`id`, `name`, `category`) VALUES ('4', 'polo', 'vetement');
INSERT INTO `allsponsored`.`product` (`id`, `name`, `category`) VALUES ('5', 'chaussettes', 'vetement');
INSERT INTO `allsponsored`.`product` (`id`, `name`, `category`) VALUES ('6', 'sac', 'equipement');
INSERT INTO `allsponsored`.`product` (`id`, `name`, `category`) VALUES ('7', 'k-way', 'vetement');
INSERT INTO `allsponsored`.`product` (`id`, `name`, `category`) VALUES ('8', 'veste', 'vetement');


INSERT INTO `allsponsored`.`order_has_product` (`product_id`, `order_id`, `quantity`, `size`, `color`) VALUES ('1', '1', '10', 'M', 'blanc');
INSERT INTO `allsponsored`.`order_has_product` (`product_id`, `order_id`, `quantity`, `size`, `color`) VALUES ('2', '1', '10', 'M', 'blanc');
INSERT INTO `allsponsored`.`order_has_product` (`product_id`, `order_id`, `quantity`, `size`, `color`) VALUES ('3', '1', '10', 'M', 'bleu');
INSERT INTO `allsponsored`.`order_has_product` (`product_id`, `order_id`, `quantity`, `size`, `color`) VALUES ('4', '2', '20', 'S', 'rouge');
INSERT INTO `allsponsored`.`order_has_product` (`product_id`, `order_id`, `quantity`, `size`, `color`) VALUES ('5', '2', '15', 'L', 'rouge');
INSERT INTO `allsponsored`.`order_has_product` (`product_id`, `order_id`, `quantity`, `size`, `color`) VALUES ('6', '3', '30', 'S', 'jaune');
INSERT INTO `allsponsored`.`order_has_product` (`product_id`, `order_id`, `quantity`, `size`, `color`) VALUES ('7', '3', '30', 'M', 'jaune');


