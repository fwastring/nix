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
			"wastring.com" = {
					sslCertificateKey = "/certs/.lego/certificates/wastring.com.key";
					sslCertificate = "/certs/.lego/certificates/wastring.com.crt";
			forceSSL = true;
			locations."/" = {
			  proxyPass = "http://172.17.0.1:8081";
			  proxyWebsockets = true;
			};
		  };
			"pico.wastring.com" = {
					sslCertificateKey = "/certs/.lego/certificates/wastring.com.key";
					sslCertificate = "/certs/.lego/certificates/wastring.com.crt";
			forceSSL = true;
			locations."/" = {
			  proxyPass = "http://172.17.0.1:6976";
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
			  proxyPass = "http://172.17.0.1:8081";
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
			"text.wastring.com" = {
					sslCertificateKey = "/certs/.lego/certificates/wastring.com.key";
					sslCertificate = "/certs/.lego/certificates/wastring.com.crt";
			forceSSL = true;
			locations."/" = {
			  proxyPass = "http://172.17.0.1:7000";
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
			"carpool.wastring.com" = {
					sslCertificateKey = "/certs/.lego/certificates/wastring.com.key";
					sslCertificate = "/certs/.lego/certificates/wastring.com.crt";
			forceSSL = true;
			locations."/" = {
			  proxyPass = "http://172.17.0.1:8080";
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
			"yt.wastring.com" = {
				sslCertificateKey = "/certs/.lego/certificates/wastring.com.key";
				sslCertificate = "/certs/.lego/certificates/wastring.com.crt";
				forceSSL = true;
				locations."/" = {
				  proxyPass = "http://localhost:40000";
				  proxyWebsockets = true;
				};
			};
			"talk.wastring.com" = {
				sslCertificateKey = "/certs/.lego/certificates/wastring.com.key";
				sslCertificate = "/certs/.lego/certificates/wastring.com.crt";
				forceSSL = true;
				locations."/" = {
				  proxyPass = "http://localhost:9000";
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
			"ha.wastring.com" = {
				sslCertificateKey = "/certs/.lego/certificates/wastring.com.key";
				sslCertificate = "/certs/.lego/certificates/wastring.com.crt";
				forceSSL = true;
				locations."/" = {
				  proxyPass = "http://172.17.0.1:8123";
				  proxyWebsockets = true;
				};
			};
		};
	};
}

