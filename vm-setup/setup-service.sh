#!/bin/bash

# Variáveis
SERVICE_NAME="produto-api"
JAR_PATH="/home/produto-api/target/produto-api-1.0-SNAPSHOT.jar"
USER="root"

# Criar arquivo de serviço systemd
SERVICE_FILE="/etc/systemd/system/${SERVICE_NAME}.service"

echo "[Unit]
Description=Api de cadastro produto
After=network.target

[Service]
User=${USER}
ExecStart=/usr/bin/java -jar ${JAR_PATH}
SuccessExitStatus=143
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target" | sudo tee ${SERVICE_FILE}

# Recarregar o daemon do systemd
sudo systemctl daemon-reload

# Iniciar o serviço
sudo systemctl start ${SERVICE_NAME}.service

# Habilitar o serviço para iniciar automaticamente na inicialização
sudo systemctl enable ${SERVICE_NAME}.service

echo "Serviço ${SERVICE_NAME} configurado e iniciado com sucesso!"
