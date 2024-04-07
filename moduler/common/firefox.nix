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
                rev = "c5580fd04e9b198320f79d441c78a641517d7af5"; # <-- Change this
            }
          }/userChrome.css";
          '';
      settings = {
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };
    };
  };
}
