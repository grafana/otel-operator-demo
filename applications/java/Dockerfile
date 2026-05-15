FROM eclipse-temurin:21@sha256:b9142586f9712700c6c9e07adcedfb18608b1a3a056e4001423a3354adfa9d80
COPY target /app
WORKDIR /app
EXPOSE 8080
CMD ["java", "-jar", "rolldice.jar"]
