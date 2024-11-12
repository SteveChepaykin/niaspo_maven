FROM maven:latest AS build

WORKDIR /app

COPY . .

RUN mvn clean package

FROM openjdk:11-jre

COPY --from=build /app/target/my-app-1.0-SNAPSHOT.jar my-app.jar

ENTRYPOINT ["java", "-jar", "/my-app.jar"]