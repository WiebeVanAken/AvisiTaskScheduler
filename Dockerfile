# BUILD
FROM maven:3.6.0-jdk-11-slim AS build
COPY --chown=gradle:gradle . /container
WORKDIR /container
RUN mvn clean package

# RUN
FROM openjdk:11
COPY --from=build . /bin
WORKDIR /bin/container/target

ENTRYPOINT ["java","-jar","TaskSchedulerAvisi.jar"]