# estágio 1: Build
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests && chmod +x /app/target/produto-api-1.0-SNAPSHOT.jar

# estágio 2: deploy
FROM openjdk:17.0.2-slim AS deploy
WORKDIR /app
EXPOSE 80
COPY --from=build /app/target/produto-api-1.0-SNAPSHOT.jar produto-api.jar
#COPY run_produto_api.sh run_produto_api.sh
RUN chmod +x run_produto_api.sh
ENTRYPOINT ["java", "-jar", "produto-api.jar"]
