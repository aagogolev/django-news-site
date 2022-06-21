Vagrant.configure("2") do |config|
	config.vm.define "django-server" do |web|
		web.vm.box = "ubuntu/xenial64"
        web.vm.network "public_network", ip: "192.168.0.99"
		web.vm.hostname = "django-server"

		web.vm.provision "shell" do |s|
			ssh_pub_key = File.readlines("#{Dir.home}/.ssh/id_rsa.pub").first.strip
			s.inline = <<-SHELL
			echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys
			echo #{ssh_pub_key} >> /root/.ssh/authorized_keys
			SHELL
		end

		web.vm.provider "virtualbox" do |v|
			v.name = "django-server"
			v.memory = 1048
			v.cpus = 1
		end

        web.vm.provision "ansible", playbook: "install_app.yml"

	end
end