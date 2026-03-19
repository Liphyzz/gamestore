## Estágio de compilação
# Usamos uma imagem do Linux para compilar o projeto
FROM ubuntu:latest AS build

## Instalar o JAVA 21
RUN apt-get update
RUN apt-get install -y openjdk-21-jdk

## Instalar o MAVEN
RUN apt-get install -y maven

## Copiar os arquivos do projeto para dentro do container
COPY . .

## Compilar o projeto usando o MAVEN
RUN mvn clean install -DskipTests

## Execução do Projeto
FROM openjdk:21-jdk-slim

## Expor a porta 8080 para acessar a aplicação
EXPOSE 8080

## Copiar o arquivo JAR gerado no estágio de compilação para o estágio de execução
COPY --from=build /target/gamestore-0.0.1-SNAPSHOT.jar app.jar

## Comando para rodar a aplicação
ENTRYPOINT ["java", "-jar", "app.jar"]