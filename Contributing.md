# Contributing

## Building the Server

If you want to modify or build this code, to build this FHIR server, execute the following from the top level:

```bash
docker build . -t ghcr.io/ikmdev/fhir-server:latest
```

## Testing the REST APIs

Execute a test, adjust the payload to upload one or more Resources to FHIR,
The resource types can be found here: http://localhost:8080/fhir/swagger-ui/

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