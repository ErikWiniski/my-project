# Build stage
FROM gradle:7.6.2-jdk8 AS build
COPY --chown=gradle:gradle . /home/gradle/project
WORKDIR /home/gradle/project
RUN gradle build --no-daemon

# Run stage
FROM openjdk:8-jdk-alpine
COPY --from=build /home/gradle/project/build/libs/*.jar app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]








//FROM openjdk:8-jre-alpine

//EXPOSE 8080

//COPY ./build/libs/my-app-1.0-SNAPSHOT.jar /usr/app/
//WORKDIR /usr/app

//ENTRYPOINT ["java", "-jar", "my-app-1.0-SNAPSHOT.jar"]
