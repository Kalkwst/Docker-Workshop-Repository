FROM openjdk:11-jdk-slim

# Set working directory inside the builder image
WORKDIR /app

# Copy the Java source file
COPY HelloWorld.jar /app/HelloWorld.jar

CMD ["java", "-jar", "HelloWorld.jar"]