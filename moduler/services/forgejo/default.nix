{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.services.forgejo;
  srv = cfg.settings.server;
in
with lib;
{
  options = {
    forgejo = {
      enable = mkEnableOption "enables forgejo";
      port = lib.mkOption {
        type = lib.types.int;
        default = 8003;
        description = "The port that Actual is served on.";
      };
      domain = lib.mkOption {
        type = lib.types.str;
        default = "git.wastring.com";
        description = "The hostname that Actual is served on.";
      };
    };
  };
  config = mkMerge [
    (mkIf config.actual.enable {
      services.nginx = {
        virtualHosts.${config.forgejo.domain} = {
          forceSSL = true;
          enableACME = true;
          extraConfig = ''
            client_max_body_size 512M;
          '';
          locations."/".proxyPass = "http://localhost:${toString config.forgejo.port}";
        };
      };

      sops.secrets.smtp_password = { };
      sops.secrets.forgejo-admin-password.owner = "forgejo";
      systemd.services.forgejo.preStart =
        let
          adminCmd = "${lib.getExe cfg.package} admin user";
          pwd = config.sops.secrets.forgejo-admin-password;
          user = "fw";
        in
        ''
          ${adminCmd} create --admin --email "root@localhost" --username ${user} --password "$(tr -d '\n' < ${pwd.path})" || true
          ## uncomment this line to change an admin user which was already created
          # ${adminCmd} change-password --username ${user} --password "$(tr -d '\n' < ${pwd.path})" || true
        '';

      services.forgejo = {
        enable = true;
        database.type = "postgres";
        # Enable support for Git Large File Storage
        lfs.enable = true;
        settings = {
          server = {
            DOMAIN = "${config.forgejo.domain}";
            # You need to specify this to remove the port from URLs in the web UI.
            ROOT_URL = "https://${config.forgejo.domain}/";
            HTTP_PORT = config.forgejo.port;
          };
          # You can temporarily allow registration to create an admin user.
          service.DISABLE_REGISTRATION = true;
          # Add support for actions, based on act: https://github.com/nektos/act
          actions = {
            ENABLED = true;
            DEFAULT_ACTIONS_URL = "github";
          };
          # Sending emails is completely optional
          # You can send a test email from the web UI at:
          # Profile Picture > Site Administration > Configuration >  Mailer Configuration
          mailer = {
            ENABLED = true;
            SMTP_ADDR = "mail.gandi.net";
            FROM = "noreply@${config.forgejo.domain}";
            USER = "fredrik@wastring.com";
          };
        };
        secrets = {
          mailer.PASSWD = config.sops.secrets.smtp_password.path;
        };
      };
    })
  ];

}
