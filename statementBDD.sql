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

