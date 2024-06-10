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
      "wastring.com" = {
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
    };
  };
}
