FROM eclipse-temurin:21@sha256:c880d7bdbcab3bb1e82159d5781760832e94b72b65dfa1835b4c23b241232b45
COPY target /app
WORKDIR /app
EXPOSE 8080
CMD ["java", "-jar", "rolldice.jar"]
