# To install & configure nginx on a server using Puppet

$config = "server {
	listen 80 default_server;
        listen [::]:80 default_server;
        root /var/www/html;
        index index.html;
        location /redirect_me {
                return 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;
        }
}"

package { 'nginx':  # Installs an Nginx server
ensure	=> 'installed',
}

file { 'index.html':
ensure	=> 'present',
path	=> '/var/www/html/index.html',
content	=> 'Hello World!',
mode	=> '0644'
}

file { 'server_config':
ensure	=> 'present',
path 	=> '/etc/nginx/sites-available/default',
content => $config
}

exec { 'service nginx restart':
path	=> ['/usr/sbin', '/usr/bin']
}

# OR
# exec {'install':
#   provider => shell,
#   command  => 'sudo apt-get -y update ; sudo apt-get -y install nginx ; echo "Hello World!" | sudo tee /var/www/html/index.nginx-debian.html ; sudo sed -i "s/server_name _;/server_name _;\n\trewrite ^\/redirect_me https:\/\/github.com\/Dikachis permanent;/" /etc/nginx/sites-available/default ; sudo service nginx start',
# }
