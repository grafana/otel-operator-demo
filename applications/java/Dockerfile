FROM eclipse-temurin:21@sha256:23cc5734ff46e776f51ce66eb9ee08444fd47caabec0a95b7eb6e94be2d3696d
COPY target /app
WORKDIR /app
EXPOSE 8080
CMD ["java", "-jar", "rolldice.jar"]
