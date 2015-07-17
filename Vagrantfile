Vagrant.configure("2") do |config|

  config.vm.define "python-distro"
  config.vm.box = "hp-ess/boot2docker"  
  
  config.vm.provider :virtualbox do |vb|
      #vb.name = "dockerhost"
	  vb.name = "python-distro"
	  vb.memory = 2048
  end
  
  config.vm.provision "docker", run: "always" do |d|
    d.build_image "/vagrant", args: "-t=python-distro"	
  end
    
end
