{ config, pkgs, ... }:
{
  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    settings = {
      AuthenticationMethods = "publickey password";
      TrustedUserCAKeys = "/etc/ssh/ssh_ca.pub";
	  X11Forwarding = true;
      Banner = "none";
      PasswordAuthentication = true;
      # PasswordAuthentication = false;
      PubKeyAuthentication = true;
      Port = 22;
    };
  };
}
