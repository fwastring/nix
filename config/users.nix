{
  config,
  pkgs,
  ...
}:
{
  # TODO: Configure your system-wide user settings (groups, etc), add more users as needed.
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
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDALsdpwvC0w/Aj+1fWtzJyyWoUrGkdh8o2thVHeQQBNo0D7cmVberYmi4Cv9gWGX6PaElrnOl0KRdGyro2wxOYokSxgk2VgWW67BFITAQAbKyG2NhXXPbhb4jccDo7WH7TtOG8IofuJTPRu1Duda6k4RN0I0CkyAN6LGX+zy49cq0qKf9ijXYhCDYNih3+Fu/ig0aW/SYmsVoUl2VFTWdI5x5/wLvIjTEZhmAtYIeYADaLnom356cFrUysZa++FUujQAz3Ow236BvP95XZdTsqvfWNZFNIpC9VYF72JeIDCs5wDIr0GFmanF2On1nar+jJpoOE8SdHt357p5g/PqXV5TisN2xQRkqVwO9tWtMl4sF84jA4ULnY2gQWv9jErMxymUQ1IwuPUzDDlbRHCtfexAtkBy7wv6xslKAzG1QahvF/btNs5Caj3LN31rgAuxyooCbKGKTeBP3kHPKcz1iupgidfbO/QqVXBRQJTEdGyAKa8hVmLQZZPC/XUhxESAk= fw@fw-nix"
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC8ku8iCb7tXd/tfxYDW+Tj8K9kpfrYZciYUZ6tBpO80inm4EImtfyEeJTuqDWMKov2BftUKs8brNeTBCXUEvU1P0+cpOP9RtYA5tfBXf3su+iVSswJJStIxNboXHrEGKdJJRNsTv/9agshDSUBy6G5TI1cXhv/updornfA4fwOMqOmtlYEn6XCRnsrO6NBLc/uLckdbF75HOsoLvezRvuqTLjpapjaUKGVPrgNXiclIKHmuOx71kgD4FX3rSz9FgKjnfu3a7DBbrHsf/g+N9PjNF1muN9UOV6nK3WwiO9BMWi7NpAWfzJOeZg9chqzI+U6CcsqYVeESgL41so+dnv3 fw@laptop"
			"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP34dnsZSnWdDvd+3BXDwcw7wP0PjPEx2eCdBQJyGD6O fw@laptop"
          ];
        };
      };
    };
  };
}
