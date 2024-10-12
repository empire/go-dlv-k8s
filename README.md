# Debugging Go Microservices in Docker with Delve

This repository demonstrates how to set up a debugger for Go microservices running in Docker using [Delve](https://github.com/go-delve/delve). This setup allows for remote debugging of Go applications running in a Docker container, eliminating the need to constantly add logging statements and redeploy.

This repository serves as a demonstration of the concepts discussed in my article on [dev.to](https://dev.to/empire/remote-debugging-go-app-1nml).

## Getting Started

### Prerequisites

Ensure you have the following installed:
- Go (version 1.23.0 or later)
- Docker
- Delve Debugger (`dlv`)
- `make` (for running the commands)

### 1. Build the Application

To install Delve and build the Go application with the necessary flags, simply run:

```bash
make build
```

This will install Delve and compile your Go application with the correct debugging settings.

### 2. Start the Service in Docker

To deploy the application in Docker and expose the necessary ports for debugging, run:

```bash
make start
```

This will handle the Docker container deployment and ensure the service is ready for debugging.

### 3. Debugging with Delve

Once the service is up and running, use the following command to start the debugger, set breakpoints, and step through the code:

```bash
make debug
```

This command will:
- Connect to the running service using Delve.
- Allow you to set breakpoints and map paths for debugging.
- Let you start and control the execution of the application with Delve's commands (e.g., `continue`).

### 4. Send a Request to the Service

Once the service is running and you're ready to test it, use the following command to send a request to the application:

```bash
make send-request
```

This will trigger the service and allow you to observe its behavior in the debugger.
