FROM maven:3.9.8-eclipse-temurin-21 AS build

WORKDIR /app

COPY . .

RUN mvn clean package -Xe

FROM openjdk:11-jre

COPY --from=build /app/target/my-app-1.0-SNAPSHOT.jar my-app.jar

ENTRYPOINT ["java", "-jar", "/my-app.jar"]