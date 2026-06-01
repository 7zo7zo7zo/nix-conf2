{ inputs, ... }:

{
	flake.modules.nixos.user = {
		home-manager.sharedModules = [
			inputs.self.modules.homeManager.user
		];

		programs.zsh.enable = true;

		users.users.steve = {
			isNormalUser = true;
			home = "/home/steve";
			shell = pkgs.zsh;
			extraGroups = [ "wheel" "audio" "video" ];
		};
	}

	flake.modules.homeManager.user = {
		user.${user} = {
			home.username = ${user};
			home.homeDirectory = "/home/${user}";
		}
	};
}
