FROM eclipse-temurin:21@sha256:ec2005c536f3661c6ef1253292c9c623e582186749a3ef2ed90903d1aaf74640
COPY target /app
WORKDIR /app
EXPOSE 8080
CMD ["java", "-jar", "rolldice.jar"]
