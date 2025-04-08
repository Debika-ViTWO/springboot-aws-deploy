# Use a minimal base image for Java 17 with build tools
FROM eclipse-temurin:17-jdk-alpine AS build

# Set working directory inside the container
WORKDIR /app

# Copy the actual JAR file
COPY target/Docker-Hello-world-0.0.1-SNAPSHOT.jar Docker-Hello-world-0.0.1-SNAPSHOT.jar

# Use a minimal runtime image
FROM eclipse-temurin:17-jre-alpine

# Set working directory inside the runtime container
WORKDIR /app

# Copy JAR file from build stage
COPY --from=build /app/Docker-Hello-world-0.0.1-SNAPSHOT.jar Docker-Hello-world-0.0.1-SNAPSHOT.jar

# Expose port 8080
EXPOSE 8080

# Run the JAR file directly
ENTRYPOINT ["java", "-jar", "Docker-Hello-world-0.0.1-SNAPSHOT.jar"]
