{ pkgs, lib, ... }:
{
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      systemWide = true;
    };
    blueman.enable = true;
  };
  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Disable = "Headset";
        };
      };
    };
  };

}
