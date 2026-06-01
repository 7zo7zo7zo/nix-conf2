{ inputs, ... }:

{
	flake.modules.nixos.user =
		{pkgs, ...}:
		{

			programs.zsh.enable = true;

			users.users.steve = {
				isNormalUser = true;
				home = "/home/steve";
				shell = pkgs.zsh;
				extraGroups = [ "wheel" "audio" "video" ];
			};
	};

	flake.modules.homeManager.user = {
		home.username = "steve";
		home.homeDirectory = "/home/steve";
	};
}
