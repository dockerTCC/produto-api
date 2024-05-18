#!/bin/bash

# Retorna o tempo de início em milissegundos
start_time=$(date +%s%3N)

# Atualizar lista de pacotes
sudo apt update

# Executar arquivo .sh de instalação do PostgreSQL 9.4 e contribuições
chmod +x install-postgres-94.sh && ./install-postgres-94.sh

# Instalar JDK 17
sudo apt install openjdk-17-jdk -y

# Instalar Maven 3.8.6
apt install maven

#Istalar nginx
chmod +x install-nginx.sh && ./install-nginx.sh

# Gerar o produto-api.jar da aplicação, pulando os testes, apontando para perfil vm e Tornar arquivo .jar executável
mvn -f ../pom.xml clean package -DskipTests -Pvm && chmod +x target/produto-api-1.0-SNAPSHOT.jar

# Tornar arquivo excutável e executar o comando de criação do service
chmod +x setup-service.sh && ./setup-service.sh

# Retorna o tempo final em milissegundos
end_time=$(date +%s%3N)

# Calcular e exibir a duração
duration=$((end_time - start_time))
echo "Tempo total para subir o setup sem docker: $duration ms"