{ pkgs, lib, ... }:
{
  programs.ssh = {
    enable = true;
    matchBlocks = {
      "git.wastring.com" = {
        hostname = "git.wastring.com";
        port = 55503;
        user = "git";
        identityFile = "/home/fw/.ssh/id_rsa";
      };
      "desktop" = {
        hostname = "wastring.com";
        port = 55502;
        user = "fw";
        identityFile = "/home/fw/.ssh/id_rsa";
      };
      "lth" = {
        hostname = "login.student.lth.se";
        port = 22;
        user = "fr7658wa-s";
      };
      "dm2" = {
        hostname = "192.168.0.190";
        port = 22;
        user = "fw";
        identityFile = "/home/fw/.ssh/fw-ssh-key";
      };
      "ha1" = {
        hostname = "hosted-agent-1";
        port = 22;
        user = "fw";
        identityFile = "/home/fw/.ssh/fw-ssh-key";
      };
      "ha2" = {
        hostname = "192.168.0.133";
        port = 22;
        user = "fw";
        identityFile = "/home/fw/.ssh/fw-ssh-key";
      };
      "ha3" = {
        hostname = "192.168.0.120";
        port = 22;
        user = "fw";
        identityFile = "/home/fw/.ssh/fw-ssh-key";
      };
      "ha4" = {
        hostname = "192.168.0.52";
        port = 22;
        user = "fw";
        identityFile = "/home/fw/.ssh/fw-ssh-key";
      };
      "mac" = {
        hostname = "192.168.0.149";
        port = 22;
        user = "ifacts";
        identityFile = "/home/fw/.ssh/ifacts-ssh-key";
      };
      "backups" = {
        hostname = "192.168.0.120";
        port = 22;
        user = "github";
        identityFile = "/home/fw/.ssh/github-ssh-key";
      };
      "malmo" = {
        hostname = "192.168.0.138";
        port = 22;
        user = "ifacts";
        identityFile = "/home/fw/.ssh/ifacts-ssh-key";
	};
      "kobo" = {
        hostname = "192.168.1.192";
        port = 22;
        user = "root";
      };
      "disa" = {
        hostname = "62.63.222.22";
        port = 55505;
        user = "disah";
        identityFile = "/home/fw/.ssh/id_rsa";
      };
      "laptop" = {
        hostname = "62.63.222.22";
        port = 55504;
        user = "fw";
        identityFile = "/home/fw/.ssh/id_rsa";
      };
    };
  };
}
