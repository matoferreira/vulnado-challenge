FROM eclipse-temurin:8-jdk

RUN apt-get update && \
    apt-get install -y --no-install-recommends cowsay netcat-openbsd bash ca-certificates && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .
RUN chmod +x mvnw && ./mvnw -B -DskipTests package

EXPOSE 8080
CMD ["java", "-jar", "target/vulnado-0.0.1-SNAPSHOT.jar"]
