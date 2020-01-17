ENV["GEM_PATH"] = nil
ENV["GEM_HOME"] = nil

required_plugins = %w( vagrant-hostsupdater vagrant-berkshelf vagrant-omnibus )
required_plugins.each do |plugin|
  exec "vagrant plugin install #{plugin} ;vagrant #{ARGV.join(" ")}" unless Vagrant.has_plugin? plugin || ARGV[0] == 'plugin'
end

Vagrant.configure("2") do |config|
  config.omnibus.chef_version = '14.12.9'
  config.vm.box = "ubuntu/xenial64"

  config.vm.define "app" do |app|
    app.vm.network "private_network", ip: "192.168.10.200"
    app.hostsupdater.aliases = ["itjobswatch.local"]
    app.vm.synced_folder "job-watch", "/home/ubuntu/job-watch"

    app.vm.provision "chef_solo" do |chef|
      chef.cookbooks_path = ["C:/Users/Chef/infrastructure/cookbooks"]
      chef.add_recipe "it-job-watch::default"
    end
  end
end
