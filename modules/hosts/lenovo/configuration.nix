{ inputs, ... }:

{
	flake.nixosConfigurations.lenovo = inputs.nixpkgs.lib.nixosSystem {
		system = "x86_64-linux";

		modules = with inputs.self.modules.nixos; [
			base
			user
			audio

			{
				imports = [
					./_hardware-configuration.nix
					inputs.home-manager.nixosModules.home-manager
				];

				networking.hostName = "lenovo";
				system.stateVersion = "25.11";

				home-manager = {
					useGlobalPkgs = true;
					useUserPackages = true;

					users.steve = {
						home.stateVersion = "25.11";

						imports = with inputs.self.modules.homeManager; [
							user
						];
					};
				};
			}
		];
	};
}

