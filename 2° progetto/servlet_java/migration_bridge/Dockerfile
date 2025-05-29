FROM maven:3.9.6-eclipse-temurin-21 AS build
WORKDIR /app
COPY . .
RUN mvn clean package

FROM tomcat:11-jdk21
COPY --from=build /app/target/migration-servlet-app.war /usr/local/tomcat/webapps/
