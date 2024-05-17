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
MAVEN_VERSION=3.8.6
wget https://downloads.apache.org/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz
sudo tar xf apache-maven-${MAVEN_VERSION}-bin.tar.gz -C /opt
sudo ln -s /opt/apache-maven-${MAVEN_VERSION} /opt/maven
sudo ln -s /opt/maven/bin/mvn /usr/bin/mvn

# Verificar a instalação do Maven
mvn -version

# Limpeza de arquivos temporários
rm apache-maven-${MAVEN_VERSION}-bin.tar.gz

echo "Instalação concluída com sucesso!"
