{
  description = "A template that shows all standard flake outputs";

  # Inputs
  # https://nixos.org/manual/nix/unstable/command-ref/new-cli/nix3-flake.html#flake-inputs

  # A specific branch of a Git repository.
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";


  outputs = all@{  nixpkgs, ... }: {

    # Used with `nixos-rebuild --flake .#<hostname>`
    nixosConfigurations.AlGhoul = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
	./configuration.nix
      ] ;
    };


  };
}
