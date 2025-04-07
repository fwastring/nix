{ pkgs, lib, ... }:
{
	networking.firewall = {
		allowedTCPPorts = [ 80 443 ];
	};
	services.nginx = {
		enable = true;
		user = "nginx";
		group = "nginx";

		# Use recommended settings
		recommendedGzipSettings = true;
		recommendedOptimisation = true;
		recommendedProxySettings = true;
		recommendedTlsSettings = true;

		virtualHosts = {
			"brfmidgard.se" = {
				sslCertificateKey = "/etc/letsencrypt/archive/brfmidgard.se/privkey1.pem";
				sslCertificate = "/etc/letsencrypt/archive/brfmidgard.se/fullchain1.pem";
				forceSSL = true;
				locations."/" = {
					proxyPass = "http://172.17.0.1:8005";
					proxyWebsockets = true;
				};
			};
			# "pass.brfmidgard.se" = {
			# 	sslCertificateKey = "/etc/letsencrypt/archive/brfmidgard.se/privkey1.pem";
			# 	sslCertificate = "/etc/letsencrypt/archive/brfmidgard.se/fullchain1.pem";
			# 	forceSSL = true;
			# 	locations."/" = {
			# 		proxyPass = "http://172.17.0.1:21456";
			# 		proxyWebsockets = true;
			# 	};
			# };
			# "drive.brfmidgard.se" = {
			# 	sslCertificateKey = "/etc/letsencrypt/archive/brfmidgard.se/privkey1.pem";
			# 	sslCertificate = "/etc/letsencrypt/archive/brfmidgard.se/fullchain1.pem";
			# 	forceSSL = true;
			# 	locations."/" = {
			# 		proxyPass = "http://172.16.57.1:13001";
			# 		proxyWebsockets = true;
			# 	};
			# };
			# "sandbox.brfmidgard.se" = {
			# 	forceSSL = true;
			# 	sslCertificateKey = "/etc/letsencrypt/archive/brfmidgard.se/privkey1.pem";
			# 	sslCertificate = "/etc/letsencrypt/archive/brfmidgard.se/fullchain1.pem";
			# 	locations."/" = {
			# 		proxyPass = "http://172.16.57.1:13001";
			# 		proxyWebsockets = true;
			# 	};
			# };
			# "todo.brfmidgard.se" = {
			# 	forceSSL = true;
			# 	sslCertificateKey = "/etc/letsencrypt/archive/brfmidgard.se/privkey1.pem";
			# 	sslCertificate = "/etc/letsencrypt/archive/brfmidgard.se/fullchain1.pem";
			# 	locations."/" = {
			# 		proxyPass = "http://172.17.0.1:13456";
			# 		proxyWebsockets = true;
			# 	};
			# };
			"wastring.com" = {
				sslCertificateKey = "/certs/.lego/certificates/wastring.com.key";
				sslCertificate = "/certs/.lego/certificates/wastring.com.crt";
				forceSSL = true;
				locations."/" = {
					proxyPass = "http://172.17.0.1:8003";
					proxyWebsockets = true;
				};
			};
			"calibre.wastring.com" = {
				sslCertificateKey = "/certs/.lego/certificates/wastring.com.key";
				sslCertificate = "/certs/.lego/certificates/wastring.com.crt";
				forceSSL = true;
				locations."/" = {
					proxyPass = "http://172.17.0.1:8880";
					proxyWebsockets = true;
				};
			};
			"download.wastring.com" = {
				sslCertificateKey = "/certs/.lego/certificates/wastring.com.key";
				sslCertificate = "/certs/.lego/certificates/wastring.com.crt";
				forceSSL = true;
				locations."/" = {
					proxyPass = "http://172.17.0.1:28000";
					proxyWebsockets = true;
				};
			};
			"books.wastring.com" = {
				sslCertificateKey = "/certs/.lego/certificates/wastring.com.key";
				sslCertificate = "/certs/.lego/certificates/wastring.com.crt";
				forceSSL = true;
				locations."/" = {
					proxyPass = "http://172.17.0.1:8083";
					proxyWebsockets = true;
				};
			};
			"rss.wastring.com" = {
				sslCertificateKey = "/certs/.lego/certificates/wastring.com.key";
				sslCertificate = "/certs/.lego/certificates/wastring.com.crt";
				forceSSL = true;
				locations."/" = {
					proxyPass = "http://172.16.59.1:18080";
					proxyWebsockets = true;
				};
			};
			"shop.wastring.com" = {
				sslCertificateKey = "/certs/.lego/certificates/wastring.com.key";
				sslCertificate = "/certs/.lego/certificates/wastring.com.crt";
				forceSSL = true;
				locations."/" = {
					proxyPass = "http://172.17.0.1:8980";
					proxyWebsockets = true;
				};
			};
			"todo.wastring.com" = {
				sslCertificateKey = "/certs/.lego/certificates/wastring.com.key";
				sslCertificate = "/certs/.lego/certificates/wastring.com.crt";
				forceSSL = true;
				locations."/" = {
					proxyPass = "http://172.16.58.1:3456";
					proxyWebsockets = true;
				};
			};
			"secret.wastring.com" = {
				sslCertificateKey = "/certs/.lego/certificates/wastring.com.key";
				sslCertificate = "/certs/.lego/certificates/wastring.com.crt";
				forceSSL = true;
				locations."/" = {
					proxyPass = "http://172.17.0.1:3004";
					proxyWebsockets = true;
				};
			};
			"budget.wastring.com" = {
				sslCertificateKey = "/certs/.lego/certificates/wastring.com.key";
				sslCertificate = "/certs/.lego/certificates/wastring.com.crt";
				forceSSL = true;
				locations."/" = {
					proxyPass = "http://172.17.0.1:8098";
					proxyWebsockets = true;
				};
			};
			"bilder.wastring.com" = {
				sslCertificateKey = "/certs/.lego/certificates/wastring.com.key";
				sslCertificate = "/certs/.lego/certificates/wastring.com.crt";
				forceSSL = true;
				locations."/" = {
					proxyPass = "http://172.17.0.1:2283";
					proxyWebsockets = true;
					extraConfig = ''
						client_max_body_size 0;
					'';
				};
			};
			"git.wastring.com" = {
				sslCertificateKey = "/certs/.lego/certificates/wastring.com.key";
				sslCertificate = "/certs/.lego/certificates/wastring.com.crt";
				forceSSL = true;
				locations."/" = {
					proxyPass = "http://192.168.16.1:3000";
					proxyWebsockets = true;
				};
			};
			"cal.wastring.com" = {
				sslCertificateKey = "/certs/.lego/certificates/wastring.com.key";
				sslCertificate = "/certs/.lego/certificates/wastring.com.crt";
				forceSSL = true;
				locations."/" = {
					proxyPass = "http://172.17.0.1:5232";
					proxyWebsockets = true;
				};
			};
			"pass.wastring.com" = {
				sslCertificateKey = "/certs/.lego/certificates/wastring.com.key";
				sslCertificate = "/certs/.lego/certificates/wastring.com.crt";
				forceSSL = true;
				locations."/" = {
					proxyPass = "http://172.24.0.1:9445";
					proxyWebsockets = true;
				};
			};
			"home.wastring.com" = {
				sslCertificateKey = "/certs/.lego/certificates/wastring.com.key";
				sslCertificate = "/certs/.lego/certificates/wastring.com.crt";
				forceSSL = true;
				locations."/" = {
					# proxyPass = "http://172.17.0.1:8081";
					proxyPass = "http://172.17.0.1:38080";
					proxyWebsockets = true;
				};
			};
			"drive.wastring.com" = {
				sslCertificateKey = "/certs/.lego/certificates/wastring.com.key";
				sslCertificate = "/certs/.lego/certificates/wastring.com.crt";
				forceSSL = true;
				locations."/" = {
					proxyPass = "http://172.17.0.1:3001";
					proxyWebsockets = true;
				};
			};

			"sandbox.wastring.com" = {
				sslCertificateKey = "/certs/.lego/certificates/wastring.com.key";
				sslCertificate = "/certs/.lego/certificates/wastring.com.crt";
				forceSSL = true;
				locations."/" = {
					proxyPass = "http://172.17.0.1:3001";
					proxyWebsockets = true;
				};
			};
			"files.wastring.com" = {
				sslCertificateKey = "/certs/.lego/certificates/wastring.com.key";
				sslCertificate = "/certs/.lego/certificates/wastring.com.crt";
				forceSSL = true;
				locations."/" = {
					proxyPass = "http://172.17.0.1:8380";
					proxyWebsockets = true;
				};
			};
			"docs.wastring.com" = {
				sslCertificateKey = "/certs/.lego/certificates/wastring.com.key";
				sslCertificate = "/certs/.lego/certificates/wastring.com.crt";
				forceSSL = true;
				locations."/" = {
					proxyPass = "http://172.17.0.1:8000";
					proxyWebsockets = true;
				};
			};
			"search.wastring.com" = {
				sslCertificateKey = "/certs/.lego/certificates/wastring.com.key";
				sslCertificate = "/certs/.lego/certificates/wastring.com.crt";
				forceSSL = true;
				locations."/" = {
					proxyPass = "http://localhost:40080";
					proxyWebsockets = true;
				};
			};
			"latex.wastring.com" = {
				sslCertificateKey = "/certs/.lego/certificates/wastring.com.key";
				sslCertificate = "/certs/.lego/certificates/wastring.com.crt";
				forceSSL = true;
				locations."/" = {
					proxyPass = "http://localhost:3080";
					proxyWebsockets = true;
				};
			};
			"soulseek.wastring.com" = {
				sslCertificateKey = "/certs/.lego/certificates/wastring.com.key";
				sslCertificate = "/certs/.lego/certificates/wastring.com.crt";
				forceSSL = true;
				locations."/" = {
					proxyPass = "http://localhost:5030";
					proxyWebsockets = true;
				};
			};
			"board.wastring.com" = {
				sslCertificateKey = "/certs/.lego/certificates/wastring.com.key";
				sslCertificate = "/certs/.lego/certificates/wastring.com.crt";
				forceSSL = true;
				locations."/" = {
					proxyPass = "http://localhost:8038";
					proxyWebsockets = true;
				};
			};
			"status.wastring.com" = {
				sslCertificateKey = "/certs/.lego/certificates/wastring.com.key";
				sslCertificate = "/certs/.lego/certificates/wastring.com.crt";
				forceSSL = true;
				locations."/" = {
					proxyPass = "http://172.17.0.1:3008";
					proxyWebsockets = true;
				};
			};
			"music.wastring.com" = {
				sslCertificateKey = "/certs/.lego/certificates/wastring.com.key";
				sslCertificate = "/certs/.lego/certificates/wastring.com.crt";
				forceSSL = true;
				locations."/" = {
					proxyPass = "http://172.17.0.1:4747";
					proxyWebsockets = true;
				};
			};
			"wedding.wastring.com" = {
				sslCertificateKey = "/certs/.lego/certificates/wastring.com.key";
				sslCertificate = "/certs/.lego/certificates/wastring.com.crt";
				forceSSL = true;
				locations."/" = {
					proxyPass = "http://172.17.0.1:8002";
					proxyWebsockets = true;
				};
			};
			"message.wastring.com" = {
				sslCertificateKey = "/certs/.lego/certificates/wastring.com.key";
				sslCertificate = "/certs/.lego/certificates/wastring.com.crt";
				forceSSL = true;
				locations."/" = {
					proxyPass = "http://172.17.0.1:2203";
					proxyWebsockets = true;
				};
			};
			"filmer.wastring.com" = {
				sslCertificateKey = "/certs/.lego/certificates/wastring.com.key";
				sslCertificate = "/certs/.lego/certificates/wastring.com.crt";
				forceSSL = true;
				locations."/" = {
					proxyPass = "http://192.168.80.1:8096";
					proxyWebsockets = true;
				};
			};
			"kube.wastring.com" = {
				sslCertificateKey = "/certs/.lego/certificates/wastring.com.key";
				sslCertificate = "/certs/.lego/certificates/wastring.com.crt";
				forceSSL = true;
				locations."/" = {
					proxyPass = "http://192.168.1.100";
					proxyWebsockets = true;
				};
			};
		};
	};
}

