# jdk-example

Example application showing the Chainguard JDK variant: a minimal Hello World
Java app built with a multi-stage Dockerfile.

## How it works

| Stage   | Image                                | Purpose                                      |
|---------|--------------------------------------|----------------------------------------------|
| build   | `cgr.dev/fakecorp.meme/jdk:latest`   | Compiles `src/HelloWorld.java` with `javac`  |
| runtime | `cgr.dev/fakecorp.meme/jre:latest`   | Runs the compiled class with `java`          |

The JDK is used only to compile. The final image is based on the smaller JRE
image and contains just the compiled class. It runs as the image's default
non-root user.

## Project layout

```
.
├── Dockerfile
└── src/
    └── HelloWorld.java
```

## Build and run

```sh
docker build -t jdk-hello .
docker run --rm jdk-hello
```

Expected output:

```
Hello, World!
```

You need pull access to the `cgr.dev/fakecorp.meme` registry. Authenticate with
`chainctl auth configure-docker` first if needed.
