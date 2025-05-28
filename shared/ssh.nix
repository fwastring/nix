{ pkgs, lib, ... }:
{
  programs.ssh = {
    enable = true;
    matchBlocks = {
      "lth" = {
        hostname = "login.student.lth.se";
        port = 22;
        user = "fr7658wa-s";
        identityFile = "/home/fw/.ssh/id_rsa";
      };
      "dm2" = {
        hostname = "192.168.0.190";
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
      "kube01" = {
        hostname = "192.168.0.177";
        port = 22;
        user = "fw";
        identityFile = "/home/fw/.ssh/fw-ssh-key";
      };
      "kube02" = {
        hostname = "192.168.0.159";
        port = 22;
        user = "fw";
        identityFile = "/home/fw/.ssh/fw-ssh-key";
      };
      "kube03" = {
        hostname = "192.168.0.182";
        port = 22;
        user = "fw";
        identityFile = "/home/fw/.ssh/fw-ssh-key";
      };
      "runner01" = {
        hostname = "192.168.0.184";
        port = 22;
        user = "fw";
        identityFile = "/home/fw/.ssh/fw-ssh-key";
      };
      "docker03" = {
        hostname = "192.168.0.118";
        port = 22;
        user = "fw";
        identityFile = "/home/fw/.ssh/fw-ssh-key";
      };
    };
  };
}
