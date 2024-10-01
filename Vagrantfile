Vagrant.configure("2") do |config|
	
	config.vm.box = "ubuntu/bionic64"    #ubuntu 18.04

	config.vm.provider  "virtualbox" do |vb|  #ustawienia vmki
		vb.memory = "1024"
		vb.cpus = 2
	end

	config.vm.provision "shell", inline: <<-SHELL      #instalacja dockera
		sudo apt-get update
		sudo apt-get install -y docker.io docker-compose
	  SHELL

	config.vm.network "forwarded_port", guest: 80, host: 9090  #wejscie na stronke bedzie http://localhost:9090 bo byl problem z nginxem i 8080 u mnie
	 
end
