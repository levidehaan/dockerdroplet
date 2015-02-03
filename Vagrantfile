#setting env vars
ENV['DBROOT'] = "tester"
ENV['DBUSER'] = "drupal"
ENV['DBPASS'] = "tester"
ENV['DBNAME'] = "drupal"
ENV['SITENAME'] = "test"
ENV['ACCTNAME'] = "admin"
ENV['ACCTPASS'] = "chezisgood"
ENV['DRUSHDLLIST'] = "views responsive_bartik"
ENV['THEME'] = "responsive_bartik"

Vagrant.configure("2") do |config|

  config.vm.define "mysql" do |a|
    a.vm.provider "docker" do |d|
      d.image = "mysql"
      d.name = "mysql"
      d.has_ssh         = false
      d.remains_running = true
      d.create_args = ["-e", "MYSQL_ROOT_PASSWORD="+ENV['DBROOT'], "-e", "MYSQL_USER="+ENV['DBUSER'], "-e", "MYSQL_PASSWORD="+ENV['DBPASS'], "-e", "MYSQL_DATABASE="+ENV['DBNAME']]
    end
  end

  config.vm.define "drupal" do |b|
    b.vm.provider "docker" do |f|
      f.build_dir = "./drupal/"
      f.build_args = ["-t=drupalbase"]
      f.has_ssh         = false
      f.name = "drupal"
      f.remains_running = false
      f.volumes = ["/srv/drupal/www"]
      f.create_args = ["-d", "--link", "mysql:mysql", "-e", "SITENAME="+ENV['SITENAME'], "-e", "DBROOT="+ENV['DBROOT'], "-e", "DBNAME="+ENV['DBNAME'],"-e", "DBUSER="+ENV['DBUSER'], "-e", "DBPASS="+ENV['DBPASS'], "-e", "ACCTNAME="+ENV['ACCTNAME'], "-e", "ACCTPASS="+ENV['ACCTPASS'],"-e", "DRUSHDLLIST="+ENV['DRUSHDLLIST'], "-e", "THEME="+ENV['THEME']]
      f.cmd = ["bash", "/root/installer.sh"]
    end
  end

  config.vm.define "nginx" do |c|
    c.vm.provider "docker" do |r|
      r.build_dir = "./server/"
      r.build_args = ["-t=server"]
      r.has_ssh         = false
      r.ports = ["8081:80"]
      r.name = "server"
      r.remains_running = true
      r.create_args = ["--volumes-from", "drupal", "--link", "mysql:mysql"]
    end
  end
end