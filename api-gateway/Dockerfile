# ========== STAGE 1: BUILD ==========
# Usamos Maven con Java 17 para compilar el proyecto
FROM maven:3.9-eclipse-temurin-17 AS build

# Establecemos el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiamos el archivo pom.xml primero (para aprovechar el cache de Docker)
COPY pom.xml .

# Copiamos el código fuente
COPY src ./src

# Compilamos el proyecto y creamos el JAR
# -DskipTests y -Dmaven.test.skip=true: saltamos COMPLETAMENTE los tests
RUN mvn clean package -DskipTests -Dmaven.test.skip=true

# ========== STAGE 2: RUN ==========
# Usamos una imagen más ligera solo con Java para ejecutar
FROM eclipse-temurin:17-jre-alpine

# Establecemos el directorio de trabajo
WORKDIR /app

# Copiamos el JAR compilado desde el stage anterior
# --from=build: tomamos el archivo del stage "build"
COPY --from=build /app/target/*.jar app.jar

# Exponemos el puerto 8080 (debe coincidir con application.yml)
EXPOSE 8080

# Comando para ejecutar la aplicación cuando el contenedor inicie
ENTRYPOINT ["java", "-jar", "app.jar"]