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
      ios = {
        initialPassword = "password";
        isNormalUser = true;
        description = "iOS Integration";
        group = "ios";
        openssh.authorizedKeys = {
          keys = [
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDIQ9GkzI12xKZyZMmBusLw3UkxdkKEmifxTxSP74YnOXM7SknBUxkpAm0OY3wwbeF8Qht8O/mUM8x1ILpjIUPg2OZh2OslqU+slcoWAoeR8DE6hEwUIrozzlqLkL3JKIE1g2Sx7Gay7QheTJH4e51sXn15Gb3h3ByTa1LyQCWBXP4BPRs4hbVbGu0U1Qe3qav+ubnEthmLbaE+jS6SZb0TkQqKFJIq3skCRI59AkWTCOywhB3CpwP05y/to4EKUDYttf8r8pyfvJ7WMTYHFPCL3uVnutAuIVScHchMwt52kRHD8sZR2/vOM8tOeWB3zIo2XYyCIKlZjm318unqlLv8ol3sfzsSHcEvXLzXxF66/NmpTfjtlnze6hE/GxvjxC4zM7oCf/7o0UNq8VrQto0qUScjqgv5uP7GOitx2dVMGjFfGmXngeBPEIbN+WrPFPUrzylZP5tivrnyzamm7SlGUMlvtKm/G5vurxjtrvpvLKDPvKLAtueTii2xViOXTxZBQw6/mvLyhIrc3+jepgUvTVyKb88Home0WPzedCWPqzkHWgo7wvh4ybZ/JDJv2Gh1vKtKPNUwUbwl2ljJ8DagHK3qxyrfVFo9b+NmR+S21RBzF8CVhP3+MVGRNtsGMxLm4GjvODpcJrCPj/5R6NAWE7sBCP63SvHaLnlaHefsHQ== ios"
          ];
        };
      };
    };
  };
}
