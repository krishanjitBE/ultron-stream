# Use official JDK image
FROM eclipse-temurin:17-jdk

# Create app directory
WORKDIR /app

# Copy Maven wrapper and pom.xml
COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .

# Download dependencies
RUN ./mvnw dependency:go-offline

# Copy the rest of the source code
COPY src src

# Package the application
RUN ./mvnw clean package -DskipTests

# Ensure the JAR file exists in the target folder
RUN ls -l target

# Run the application
CMD ["java", "-jar", "target/fabric-streaming-1.0-SNAPSHOT.jar"]
