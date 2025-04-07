{ pkgs, lib, ... }:
{
  programs.firefox = {
    enable = true;
    profiles.default = {
      isDefault = true;
      userChrome = ''
        @import "${
          builtins.fetchGit {
            url = "https://github.com/rockofox/firefox-minima";
            ref = "main";
            rev = "dc40a861b24b378982c265a7769e3228ffccd45a"; # <-- Change this
          }
        }/userChrome.css";
      '';
      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };
    };
  };
}
