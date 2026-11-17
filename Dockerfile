# Build stage: compile the source with the JDK
FROM cgr.dev/fakecorp.meme/jdk:latest AS build
USER root
WORKDIR /build
COPY src/HelloWorld.java .
RUN javac -d /build/classes HelloWorld.java

# Runtime stage: run the compiled class as the image's default non-root user
FROM cgr.dev/fakecorp.meme/jre:latest
WORKDIR /app
COPY --from=build /build/classes /app
ENTRYPOINT ["java", "-cp", "/app", "HelloWorld"]
