FROM eclipse-temurin:21@sha256:cd772abe6bc42ddc2f5927756ea33fb26470726438fe0631472cccd4c5ecc304
COPY target /app
WORKDIR /app
EXPOSE 8080
CMD ["java", "-jar", "rolldice.jar"]
