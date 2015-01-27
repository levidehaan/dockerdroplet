Vagrant.configure("2") do |config|

  config.vm.define "mysql" do |a|
    a.vm.provider "docker" do |d|
      d.image = "mysql"
      d.name = "mysql"
      d.remains_running = true
      d.create_args = ["-e", "MYSQL_ROOT_PASSWORD="+ENV['DBROOT'], "-e", "MYSQL_USER="+ENV['DBUSER'], "-e", "MYSQL_PASSWORD="+ENV['DBPASS'], "-e", "MYSQL_DATABASE="+ENV['DBNAME']]
    end
  end
  config.vm.define "drupal" do |b|
    b.vm.provider "docker" do |f|
      f.build_dir = "./drupal/"
      f.build_args = ["-t=drupalbase"]
      f.ports = ["22"]
      f.name = "drupal"
      f.remains_running = true
      f.create_args = ["--link mysql:mysql"]
      f.volumes = ["/data:/srv/drupal/www/sites/all"]
    end
  end
  config.vm.define "nginx" do |c|
    c.vm.provider "docker" do |r|
      r.build_dir = "./server/"
      r.build_args = ["-t=server"]
      r.ports = ["8081:80"]
      r.name = "server"
      r.remains_running = true
      r.create_args = ["--volumes-from drupal", "--link mysql:mysql"]
    end
  end
end