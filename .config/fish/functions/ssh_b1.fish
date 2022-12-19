function ssh_b1 
    ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o Port=2200 -o 'IdentityFile="/Users/tims/DATA/GAN/ci/container_experiments/macos-vagrant-box/.vagrant/machines/xcode-build1/virtualbox/private_key"' -o KbdInteractiveAuthentication=no -o PreferredAuthentications=gssapi-with-mic,gssapi-keyex,hostbased,publickey -o PasswordAuthentication=no -o 'User="vagrant"' -o ConnectTimeout=30 -o ControlPath=/Users/tims/.ansible/cp/17d6e21220 -tt 127.0.0.1
end
