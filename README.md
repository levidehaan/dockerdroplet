# dockerdroplet
A quick drupal installer using vagrant

###dd init:
`
./dd <sitename> <dbrootpass> <dbname> <dbuser> <dbpass> <drupaladminacctname> <drupaladminpass> <listofpackages for drush wraped in quotes> <theme>
`

###dd destroy - removes all docker images and virtualmachine if you're using one.
`
./dd destroy
`

example:

`
./dd test tester drupal drupal tester admin chezisgood "views responsive_bartik" responsive_bartik
`

`
./dd destroy
`
