{
  config,
  pkgs,
  ...
}:
{
  users = {
    defaultUserShell = pkgs.bash;
    users = {
      fw = {
        initialPassword = "password";
        isNormalUser = true;
        description = "Fredrik Wastring";
        extraGroups = [
          "networkmanager"
          "wheel"
          "audio"
          "docker"
          "input"
        ];
        openssh.authorizedKeys = {
          keys = [
			"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFpJBGPIfPB1BwSG7aoKqwfccyZSaU7J3xpJ8behMp9N fw@core"
          ];
        };
      };
    };
  };
}
