Vagrant.configure("2") do |config|
  config.vm.define "mysql" do |a|
    a.vm.provider "docker" do |d|
      d.image = "mysql"
      d.name = "mysql"
      d.remains_running = true
      d.create_args = ["-e", "MYSQL_ROOT_PASSWORD="+ENV['DBROOT'], "-e", "MYSQL_USER="+ENV['DBUSER'], "-e", "MYSQL_PASSWORD="+ENV['DBPASS'], "-e", "MYSQL_DATABASE="+ENV['DBNAME']]
    end
  end
  config.vm.define "drupal" do |a|
    a.vm.provider "docker" do |d|
      d.build_dir = "./drupal/"
      d.link = ("mysql:mysql")
      d.build_args = ["-t=drupalbase -e DBUSER="+ENV['DBROOT']+" -e DBPASS="+ENV['DBPASS']+" -e ACCTNAME="+ENV['ACCTNAME']+" -e ACCTPASS="+ENV['ACCTPASS']+" -e DRUSHDLLIST="+ENV['DRUSHDLLIST']+" -e THEME="+ENV['THEME']]
      d.ports = ["8080:8080"]
      d.name = "drupal"
      d.remains_running = true
      d.volumes = ["/data:/srv/drupal/www/sites/all"]
    end
  end
  config.vm.define "nginx" do |a|
    a.vm.provider "docker" do |d|
      d.build_dir = "./server/"
      d.build_args = ["-t=server"]
      d.ports = ["8081:80"]
      d.name = "server"
      d.remains_running = true
      d.create_args = ["--volumes-from drupal"]
    end
  end
end