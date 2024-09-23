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
      "kobo" = {
        hostname = "192.168.1.192";
        port = 22;
        user = "root";
      };
      "disa" = {
        hostname = "192.168.1.242";
        port = 22;
        user = "disah";
        identityFile = "/home/fw/.ssh/id_rsa";
      };
    };
  };
}
