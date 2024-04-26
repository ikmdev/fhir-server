FROM hapiproject/hapi:v7.0.3 as hapi

FROM docker.io/library/maven:3.9.4-eclipse-temurin-17 AS build-hapi
COPY --from=hapi /app /app
WORKDIR /app
RUN mkdir /app/img/
# swap out the default logo to be a komet logo
COPY komet_logo.jpg /app/img/sample-logo.jpg
RUN jar -uf /app/main.war img/sample-logo.jpg
RUN rm -rf /app/img

COPY overrides.yaml /app

FROM gcr.io/distroless/java17-debian11:nonroot AS default
COPY --chown=nonroot:nonroot --from=build-hapi /app /app
# 65532 is the nonroot user's uid
# used here instead of the name to allow Kubernetes to easily detect that the container
# is running as a non-root (uid != 0) user.
USER 65532:65532
WORKDIR /app

ENTRYPOINT [ \
    "java", \
    "--class-path", \
    "/app/main.war", \
    "-Dloader.path=main.war!/WEB-INF/classes/,main.war!/WEB-INF/,/app/extra-classes", \
    "org.springframework.boot.loader.PropertiesLauncher" \
]
