#!/bin/bash

# Início da inicialização do serviço
START_TIME=$(date +%s%3N)

# Execute a aplicação Java
java -jar produto-api.jar

# serviço iniciado
END_TIME=$(date +%s%3N)

# Calcular o tempo total de execução em milissegundos
EXECUTION_TIME=$((END_TIME - START_TIME))

echo "Tempo total de execução: ${EXECUTION_TIME} ms"
