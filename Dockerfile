# Use a minimal base image for Java 17
FROM eclipse-temurin:17-jdk-alpine AS build

# Set working directory inside container
WORKDIR /app

# Copy the built JAR file into the container
COPY target/helloworld-0.0.1-SNAPSHOT.jar app.jar

# Use a minimal runtime image
FROM eclipse-temurin:17-jre-alpine

# Set working directory inside container
WORKDIR /app

# Copy only the necessary JAR file from the build stage
COPY --from=build /app/app.jar app.jar

# Expose the application's port
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
