#!/bin/bash

# Atualizar lista de pacotes e atualizar pacotes instalados
sudo apt update
sudo apt upgrade -y

# Instalar PostgreSQL e contribuições
sudo apt install postgresql postgresql-contrib -y

#Verificar se está em execução
systemctl status postgresql

# Configurar senha do usuário postgres
sudo -i -u postgres psql -c "ALTER USER postgres PASSWORD 'postgres';"

# Instalar JDK 17
sudo apt install openjdk-17-jdk -y

# Verificar a instalação do JDK 17
java -version

# Instalar Maven 3.8.6
apt install maven

# Verificar a instalação do Maven
mvn -v

# Gerar o .jar da aplicação
mvn clean install -DskipTests

#Tornar arquivo executável
chmod +x target/produto-api-1.0-SNAPSHOT.jar

echo "Instalação concluída com sucesso!"
