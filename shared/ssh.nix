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
        hostname = "docker-master2";
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
      "ba6" = {
        hostname = "buildagent6";
        port = 22;
        user = "fw";
        identityFile = "/home/fw/.ssh/fw-ssh-key";
      };
      "ba2" = {
        hostname = "192.168.0.120";
        port = 22;
        user = "fw";
        identityFile = "/home/fw/.ssh/fw-ssh-key";
      };
      "backups" = {
        hostname = "192.168.0.120";
        port = 22;
        user = "github";
        identityFile = "/home/fw/.ssh/github-ssh-key";
      };
      "backup1" = {
        hostname = "192.168.0.220";
        port = 22;
        user = "fw";
        identityFile = "/home/fw/.ssh/fw-ssh-key";
      };
      "dashboard" = {
        hostname = "192.168.0.159";
        port = 22;
        user = "fw";
        identityFile = "/home/fw/.ssh/fw-ssh-key";
      };
      "kub1" = {
        hostname = "192.168.0.52";
        port = 22;
        user = "fw";
        identityFile = "/home/fw/.ssh/fw-ssh-key";
      };
      "mac" = {
        hostname = "192.168.0.206";
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
    };
  };
}
