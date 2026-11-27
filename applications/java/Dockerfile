FROM eclipse-temurin:21@sha256:8ad118b146aa92da815b576441acd6b42b38236797ad0b6edc8c200b85bb0734
COPY target /app
WORKDIR /app
EXPOSE 8080
CMD ["java", "-jar", "rolldice.jar"]
