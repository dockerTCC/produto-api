#!/bin/bash

# Parar o serviço PostgreSQL
sudo systemctl stop postgresql

# Desinstalar pacotes PostgreSQL
sudo apt remove --purge postgresql postgresql-contrib -y

# Remover pacotes residuais e realizar limpeza
sudo apt autoremove -y
sudo apt autoclean

# Remover diretórios de dados e configuração do PostgreSQL
sudo rm -rf /var/lib/postgresql/
sudo rm -rf /etc/postgresql/
sudo rm -rf /etc/postgresql-common/
sudo rm -rf /var/log/postgresql/
sudo rm -rf /var/run/postgresql/

# Remover usuário e grupo postgres
sudo deluser postgres
sudo delgroup postgres

echo "PostgreSQL desinstalado com sucesso!"
