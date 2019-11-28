Vagrant.configure("2") do |config|

## Deploying servers

  config.vm.define "server1" do |server1|
    server1.vm.box = "debian/buster64"

    server1.vm.network "private_network", virtualbox__intnet: "int7", type: "dhcp"

    server1.vm.provision "file", source: "./config/server1/interfaces", destination: "/tmp/interfaces"
    server1.vm.provision :shell , path: "./helper_scripts/config_server.sh"

  end

  config.vm.define "server2" do |server2|
    server2.vm.box = "debian/buster64"

    server2.vm.network "private_network", virtualbox__intnet: "int5", type: "dhcp"

    server2.vm.provision "file", source: "./config/server2/interfaces", destination: "/tmp/interfaces"
    server2.vm.provision :shell , path: "./helper_scripts/config_server.sh"

  end

  config.vm.define "server3" do |server3|
    server3.vm.box = "debian/buster64"

    server3.vm.network "private_network", virtualbox__intnet: "int8", type: "dhcp"

    server3.vm.provision "file", source: "./config/server3/interfaces", destination: "/tmp/interfaces"
    server3.vm.provision :shell , path: "./helper_scripts/config_server.sh"

  end

  config.vm.define "server4" do |server4|
    server4.vm.box = "debian/buster64"

    server4.vm.network "private_network", virtualbox__intnet: "int6", type: "dhcp"

    server4.vm.provision "file", source: "./config/server4/interfaces", destination: "/tmp/interfaces"
    server4.vm.provision :shell , path: "./helper_scripts/config_server.sh"

  end

## Done deploying servers
## Deploying switches

  config.vm.define "l2" do |l2|
    l2.vm.box = "CumulusCommunity/cumulus-vx"

    l2.vm.network "private_network", virtualbox__intnet: "int2", auto_config: false #swp1
    l2.vm.network "private_network", virtualbox__intnet: "int4", auto_config: false #swp2
    l2.vm.network "private_network", virtualbox__intnet: "int5", auto_config: false #swp3
    l2.vm.network "private_network", virtualbox__intnet: "int7", auto_config: false #swp4
    l2.vm.network "forwarded_port", guest: 22, host: 2500, id: 'ssh'

    l2.vm.provision :ansible do |ansible|
      ansible.playbook = "playbooks/l2.yml"
    end
  end

  config.vm.define "l1-1" do |l11|
    l11.vm.box = "CumulusCommunity/cumulus-vx"

    l11.vm.network "private_network", virtualbox__intnet: "int1", auto_config: false #swp1
    l11.vm.network "private_network", virtualbox__intnet: "int2", auto_config: false #swp2
    l11.vm.network "forwarded_port", guest: 22, host: 2501, id: 'ssh'

    l11.vm.provision :ansible do |ansible|
      ansible.playbook = "playbooks/l11.yml"
    end
  end

  config.vm.define "l1-2" do |l12|
    l12.vm.box = "CumulusCommunity/cumulus-vx"

    l12.vm.network "private_network", virtualbox__intnet: "int1", auto_config: false #swp1
    l12.vm.network "private_network", virtualbox__intnet: "int3", auto_config: false #swp2
    l12.vm.network "forwarded_port", guest: 22, host: 2502, id: 'ssh'

    l12.vm.provision :ansible do |ansible|
      ansible.playbook = "playbooks/l12.yml"
    end
  end

  config.vm.define "l3-1" do |l31|
    l31.vm.box = "CumulusCommunity/cumulus-vx"

    l31.vm.network "private_network", virtualbox__intnet: "int9", auto_config: false #swp1
    l31.vm.network "private_network", virtualbox__intnet: "int4", auto_config: false #swp2
    l31.vm.network "forwarded_port", guest: 22, host: 2503, id: 'ssh'

    l31.vm.provision :ansible do |ansible|
      ansible.playbook = "playbooks/l31.yml"
    end
  end

  config.vm.define "l3-2" do |l32|
    l32.vm.box = "CumulusCommunity/cumulus-vx"

    l32.vm.network "private_network", virtualbox__intnet: "int9", auto_config: false #swp1
    l32.vm.network "private_network", virtualbox__intnet: "int10", auto_config: false #swp2
    l32.vm.network "forwarded_port", guest: 22, host: 2504, id: 'ssh'

    l32.vm.provision :ansible do |ansible|
      ansible.playbook = "playbooks/l32.yml"
    end
  end

  config.vm.define "l4" do |l4|
    l4.vm.box = "CumulusCommunity/cumulus-vx"

    l4.vm.network "private_network", virtualbox__intnet: "int3", auto_config: false #swp1
    l4.vm.network "private_network", virtualbox__intnet: "int10", auto_config: false #swp2
    l4.vm.network "private_network", virtualbox__intnet: "int8", auto_config: false #swp3
    l4.vm.network "private_network", virtualbox__intnet: "int6", auto_config: false #swp4
    l4.vm.network "forwarded_port", guest: 22, host: 2505, id: 'ssh'

    l4.vm.provision :ansible do |ansible|
      ansible.playbook = "playbooks/l4.yml"
    end
  end
## Done deploying switches
end
