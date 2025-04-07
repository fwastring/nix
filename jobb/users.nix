{
  config,
  pkgs,
  ...
}:
{
  # TODO: Configure your system-wide user settings (groups, etc), add more users as needed.
  users = {
    defaultUserShell = pkgs.bash;
    groups = {
      ios = { };
    };
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
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDALsdpwvC0w/Aj+1fWtzJyyWoUrGkdh8o2thVHeQQBNo0D7cmVberYmi4Cv9gWGX6PaElrnOl0KRdGyro2wxOYokSxgk2VgWW67BFITAQAbKyG2NhXXPbhb4jccDo7WH7TtOG8IofuJTPRu1Duda6k4RN0I0CkyAN6LGX+zy49cq0qKf9ijXYhCDYNih3+Fu/ig0aW/SYmsVoUl2VFTWdI5x5/wLvIjTEZhmAtYIeYADaLnom356cFrUysZa++FUujQAz3Ow236BvP95XZdTsqvfWNZFNIpC9VYF72JeIDCs5wDIr0GFmanF2On1nar+jJpoOE8SdHt357p5g/PqXV5TisN2xQRkqVwO9tWtMl4sF84jA4ULnY2gQWv9jErMxymUQ1IwuPUzDDlbRHCtfexAtkBy7wv6xslKAzG1QahvF/btNs5Caj3LN31rgAuxyooCbKGKTeBP3kHPKcz1iupgidfbO/QqVXBRQJTEdGyAKa8hVmLQZZPC/XUhxESAk= fw@fw-nix"
          ];
        };
      };
      max = {
        initialPassword = "password";
        isNormalUser = true;
        description = "Max Huldin";
        extraGroups = [
          "audio"
          "docker"
        ];
      };
      runner = {
        initialPassword = "password";
        isNormalUser = true;
        description = "github runner";
        extraGroups = [
          "docker"
        ];
      };
    };
  };
}
