# Customized HAPI FHIR Server

Builds a simple FHIR Server with the komet logo.  It may include other 
customizations as well.

### Team Ownership - Product Owner

Architecture Team

## Prerequisites

For just about anything here, you need to [install docker](installing-docker.md).

## Running a HAPI FHIR Server

To run this server, run the following (does not require building, 
as this should be published to github artifacts - adjust the version
as is needed):

```bash
docker-compose up
```

## Viewing Resources

Once your container is up and running,
* to view FHIR Resources, go to http://localhost:8080/
* to access the REST Resources, go to http://localhost:8080/fhir/swagger-ui/

Also, we love it when you [Contribute](Contributing.md)!

## Issues and Contributions
Technical and non-technical issues can be reported to the [Issue Tracker](https://github.com/ikmdev/fhir-server/issues).

Contributions can be submitted via pull requests. Please check the [contribution guide](doc/how-to-contribute.md) for more details.

