FROM eclipse-temurin:21@sha256:ebfbb18d11ff163ee83b21258acf12248af48d22a0fdfdc68fa1a1516c05976a
COPY target /app
WORKDIR /app
EXPOSE 8080
CMD ["java", "-jar", "rolldice.jar"]
