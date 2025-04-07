{ config, pkgs, ... }:
{
  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    settings = {
      AuthenticationMethods = "publickey password";
      TrustedUserCAKeys = "/etc/ssh/ssh_ca.pub";
      Banner = "none";
      PasswordAuthentication = true;
      # PasswordAuthentication = false;
      PubKeyAuthentication = true;
      Port = 22;
    };
  };
}
