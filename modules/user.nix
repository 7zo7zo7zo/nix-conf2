{ inputs, ... }:

{
	flake.modules.nixos.user = {
		home-manager.sharedModules = [
			inputs.self.modules.homeManager.user
		];

		programs.zsh.enable = true;

		users.users.${config.flake.primaryUser} = {
			isNormalUser = true;
			home = "/home/${config.flake.primaryUser}";
			shell = pkgs.zsh;
			extraGroups = [ "wheel" "audio" "video" ];
		};
	}

	flake.modules.homeManager.user = {
		user.${config.flake.primaryUser} = {
			home.username = ${config.flake.primaryUser};
			home.homeDirectory = "/home/${config.flake.primaryUser}";
		}
	};
}
