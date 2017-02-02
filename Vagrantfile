BOXES = ENV.has_key?('BOXES') ? ENV['BOXES'] : "wheezy,jessie,stretch"

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.synced_folder ".", "/vagrant"
  config.vm.provision "shell" do |s|
    s.path = "provision.sh"
    s.args = "#{BOXES}"
  end
end
