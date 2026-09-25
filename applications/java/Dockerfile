FROM eclipse-temurin:21@sha256:92a2a4d7a928d057e7bd999c418d66c26a34eb9a0442f3ab67721c3f88110b2d
COPY target /app
WORKDIR /app
EXPOSE 8080
CMD ["java", "-jar", "rolldice.jar"]
