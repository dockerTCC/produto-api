#!/bin/bash

# Atualizar lista de pacotes e atualizar pacotes instalados
sudo apt update
sudo apt upgrade -y

# Adicionar repositório PostgreSQL para a versão 9.4
echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" | sudo tee /etc/apt/sources.list.d/pgdg.list

# Importar chave do repositório
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

# Atualizar lista de pacotes novamente
sudo apt update

# Instalar PostgreSQL 9.4 e contribuições
sudo apt install postgresql-9.4 postgresql-contrib-9.4 -y

# Configurar senha do usuário postgres
sudo -i -u postgres psql -c "ALTER USER postgres PASSWORD 'postgres';"

echo "Instalado com sucesso" 