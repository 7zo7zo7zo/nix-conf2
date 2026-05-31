{ inputs, ... }:

{
	flake.nixosConfigurations.lenovo = inputs.nixpkgs.lib.nixosSystem {
		modules = with inputs.self.modules.nixos; [
			base
			audio
			bluetooth
			printer

			{
				imports = [
          ../hardware-configuration.nix
        ];
				networking.hostName = "lenovo";
			}
		];
	}
}
