#!/bin/bash

# Verifica se o número de instâncias foi passado como argumento
if [ -z "$1" ]; then
  echo "Uso: $0 <numero_de_instancias>"
  exit 1
fi

git pull
# Número de instâncias a escalar
NUM_INSTANCIAS=$1

# Medir o tempo de início
start_time=$(date +%s%3N)

# Comando para escalar as instâncias
docker-compose up --scale produto-service=$NUM_INSTANCIAS -d

# Medir o tempo de fim
end_time=$(date +%s%3N)

# Calcular e exibir a duração
duration=$((end_time - start_time))
echo "Tempo total de executação com Docker: $duration ms"
