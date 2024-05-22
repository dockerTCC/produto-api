#!/bin/bash

# Nome do serviço
SERVICE_NAME="produto-api.service"
# Nome do jar gerado
JAR_NAME="produto-api-1.0-SNAPSHOT.jar"
# Diretório onde o jar é gerado
TARGET_DIR="../target"
# Tempo inicial
START_TIME=$(date +%s%3N)
# Parar o serviço
sudo systemctl stop $SERVICE_NAME
# Fazer pull do repositório
git pull origin main
# Build do projeto
mvn -f ../pom.xml clean package -DskipTests
chmod +x $TARGET_DIR/$JAR_NAME
# Iniciar o serviço
sudo systemctl start $SERVICE_NAME
# Tempo final
END_TIME=$(date +%s%3N)
# Calcular o tempo total de execução em milissegundos
EXECUTION_TIME=$((END_TIME - START_TIME))
echo "Tempo total de execução: ${EXECUTION_TIME} ms"
