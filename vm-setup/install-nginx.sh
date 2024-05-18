#!/bin/bash

# Atualizar a lista de pacotes
sudo apt update

# Instalar o NGINX
sudo apt install nginx -y

# Criar um arquivo de configuração NGINX para o produto-service
cat <<EOL | sudo tee /etc/nginx/sites-available/produto-service
server {
    listen 80;

    server_name localhost;

    location / {
        proxy_pass http://localhost:8080;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
    }

    error_page 500 502 503 504 /50x.html;
    location = /50x.html {
        root /usr/share/nginx/html;
    }
}
EOL

# Habilitar a configuração do produto-service
sudo ln -s /etc/nginx/sites-available/produto-service /etc/nginx/sites-enabled/

# Testar a configuração do NGINX
sudo nginx -t

# Reiniciar o NGINX para aplicar as mudanças
sudo systemctl restart nginx
