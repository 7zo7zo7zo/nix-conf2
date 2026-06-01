{ inputs, ... }:

{
	flake.primaryUser = "steve";

	flake.nixosConfigurations.lenovo = inputs.nixpkgs.lib.nixosSystem {
		system = "x86_64-linux";

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

