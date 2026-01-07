# Sidecar Service

A gRPC service for managing and loading forum extensions, built with Domain-Driven Design principles.

## Features

- **Extension Management**: Install, uninstall, and list extensions
- **Dynamic Loading**: Load extension resolvers at runtime
- **Clean Architecture**: DDD-based layered architecture
- **Highly Testable**: All components designed for easy testing
- **Type Safe**: Full type hints throughout the codebase

## Quick Start

### Prerequisites

- Python 3.8+
- pip

### Installation

```bash
cd sidecar/src
pip install -r requirements.txt
```

### Running the Service

```bash
python main.py
```

The gRPC server will start on port `55001`.

## Architecture

See [ARCHITECTURE.md](ARCHITECTURE.md) for detailed architecture documentation.

### Layers

1. **Domain**: Core business logic (entities, value objects, repository interfaces)
2. **Application**: Use cases and application services
3. **Infrastructure**: Technical implementations (file system, HTTP, repositories)
4. **Presentation**: gRPC service interface

### Key Principles

- **Dependency Inversion**: High-level modules don't depend on low-level details
- **Single Responsibility**: Each component has one clear purpose
- **Testability**: All components are easily testable with dependency injection

## Development

### Project Structure

```
src/
├── domain/           # Core business logic
├── application/      # Use cases
├── infrastructure/   # Technical implementations
├── presentation/     # gRPC service
├── shared/           # Shared utilities
└── tests/            # Test suite
```

### Running Tests

```bash
# Run all tests
python -m pytest tests/

# Run with coverage
python -m pytest --cov=. --cov-report=html tests/

# Run specific test file
python -m pytest tests/unit/test_extension_entity.py
```

### Adding a New Extension

1. Extension must implement `ResolverImpl` class
2. Must have a `resolver_impl.py` file
3. Can include a `requirements.txt` for dependencies
4. Metadata is stored in `metadata.json`

## API

The service exposes the following gRPC methods:

### Extension Management

- `ListInstalledExtensions`: List all installed extensions
- `GetInstalledExtension`: Get details of a specific extension
- `InstallExtension`: Install a new extension
- `UninstallExtension`: Remove an extension
- `ListRemoteExtensions`: List available extensions from a repository

### Extension Operations (Delegated to Extensions)

- `GetBoards`: Get forum boards
- `GetThreads`: Get thread list
- `GetOriginalPost`: Get OP
- `GetReplies`: Get post replies
- `GetComments`: Get post comments

## Configuration

Edit `shared/config.py` to configure:

- `GRPC_PORT`: gRPC server port (default: 55001)
- `EXTENSIONS_DIR`: Extension installation directory
- `DOWNLOAD_DIR`: Temporary download directory
- `DOWNLOAD_TIMEOUT`: HTTP download timeout

## Contributing

1. Follow the DDD architecture
2. Write unit tests for new features
3. Ensure all tests pass
4. Follow Python type hints
5. Document public APIs
