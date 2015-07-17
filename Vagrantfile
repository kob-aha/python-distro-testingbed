ENV['VAGRANT_DEFAULT_PROVIDER'] = 'docker'
 
Vagrant.configure("2") do |config|
  config.vm.define "python-distro" do |a|
    a.vm.provider "docker" do |d|
	  d.vagrant_machine = "dockerhost"
      d.vagrant_vagrantfile = "./DockerHostVagrantfile"
	  
      d.build_dir = "."
      d.build_args = ["-t=python-distro"]
      d.name = "python-distro"
      d.remains_running = false
      d.volumes = ["/vagrant:/usr/local/distro-src"]	  
    end
  end
end
