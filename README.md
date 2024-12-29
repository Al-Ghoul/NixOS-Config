# Usage
```sh
# 1. Clone the NixOS-Conf repo
git clone https://github.com/Al-Ghoul/NixOS-Config.git

# 2. Backup your current config 
sudo mv /etc/nixos /etc/nixos.bak

# 3. Symlink the new config
sudo ln -s ~/repos/NixOS-Config /etc/nixos

# 4. Deploy the new config 
sudo nixos-rebuild switch
```
