# Customized HAPI FHIR Server

Builds a simple FHIR Server with the komet logo.  It may include other 
customizations as well.

## Prerequisites

For just about anything here, you need to [install docker](installing-docker.md).

## Building the Server

To build this FHIR server, execute the following from the top level:

```bash
docker build . -t ghcr.io/ikmdev/komet-fhir:latest
```

## Running a HAPI FHIR Server

To run this server, run the following (does not require building, 
as this should be published to github artifacts - adjust the version
as is needed):

```bash
docker run -it --rm -p 8080:8080 ghcr.io/ikmdev/komet-fhir:1.0.0
```

## Testing

Execute a test, adjust the payload to upload one or more Resources to FHIR,
The resource types can be found here: http://localhost:8080/fhir/swagger-ui

Using the saved files called `organization.json` and `'patient.json`, you can test the upload with a command similar 
to the following:

```bash
curl -X 'POST' \
'http://localhost:8080/fhir/Organization' \
-H 'accept: application/fhir+json' \
-H 'Content-Type: application/fhir+json' \
--data @organization.json && \
curl -X 'POST' \
'http://localhost:8080/fhir/Patient' \
-H 'accept: application/fhir+json' \
-H 'Content-Type: application/fhir+json' \
--data @patient.json
```

Then, if you want to query, you can similarly hit the REST resource endpoint:

```bash
curl -X 'GET' \
'http://localhost:8080/fhir/Organization' \
-H 'accept: application/fhir+json'
```
