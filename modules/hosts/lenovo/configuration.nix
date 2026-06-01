{ inputs, ... }:

{
	flake.nixosConfigurations.lenovo = inputs.nixpkgs.lib.nixosSystem {
		modules = with inputs.self.modules.nixos; [
			base
			user

			{
				imports = [
					../hardware-configuration.nix
				];

				networking.hostName = "lenovo";
				system.stateVersion = "25.11";

				home-manager = {
					useGlobalPkgs = true;
					useUserPackages = true;
					home.stateVersion = "25.11";
				}
			}
		];
	}
}

