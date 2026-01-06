# Sidecar Service Architecture

## Architecture Layers

```
┌─────────────────────────────────────────┐
│        Presentation Layer (gRPC)        │
│  - SidecarService (Async gRPC)          │
└─────────────────────────────────────────┘
                  ↓
┌─────────────────────────────────────────┐
│        Application Layer                │
│  - Use Cases (Install, Add Repo, etc.)  │
│  - Application Services                 │
└─────────────────────────────────────────┘
                  ↓
┌─────────────────────────────────────────┐
│         Domain Layer                    │
│  - Entities (Extension, Repo)           │
│  - Value Objects (ExtensionMetadata)    │
│  - Repository Interfaces                │
└─────────────────────────────────────────┘
                  ↑
┌─────────────────────────────────────────┐
│      Infrastructure Layer               │
│  - Repository Implementations           │
│  - File System Manager                  │
│  - HTTP Downloader                      │
│  - Health Check & Logging Services      │
└─────────────────────────────────────────┘
```

## Directory Structure

```
src/
├── domain/                      # Core business logic
│   ├── entities/                # Business entities
│   │   ├── extension.py         # Extension entity
│   │   └── repo.py              # Repository entity
│   ├── repositories/            # Repository interfaces
│   │   ├── extension_repository.py
│   │   └── repo_repository.py   # Repo repository interface
│   └── value_objects/           # Immutable value objects
│       └── extension_metadata.py
│
├── application/                 # Use cases and app services
│   ├── use_cases/               # Business use cases
│   │   ├── install_extension.py
│   │   ├── uninstall_extension.py
│   │   ├── list_installed_extensions.py
│   │   ├── list_remote_extensions.py
│   │   ├── get_installed_extension.py
│   │   ├── add_repo.py          # Add new extension repo
│   │   └── remove_repo.py       # Remove extension repo
│   └── services/                # Application services
│       ├── extension_installer.py
│       └── extension_loader.py
│
├── infrastructure/              # External dependencies
│   ├── repositories/            # Repository implementations
│   │   ├── extension_repository_impl.py
│   │   ├── remote_extension_repository_impl.py
│   │   └── repo_repository_impl.py # Repo repository impl
│   ├── downloaders/             # Download mechanisms
│   │   └── http_downloader.py
│   ├── file_system/             # File operations
│   │   └── extension_file_manager.py
│   ├── health_check_service.py  # Health monitoring
│   └── logging_service.py       # Centralized logging & streaming
│
├── presentation/                # External interfaces
│   └── grpc/                    # gRPC service
│       └── sidecar_service.py   # Sidecar implementation
│
├── shared/                      # Shared utilities
│   ├── config.py                # Configuration
│   └── dependency_container.py  # DI container
│
├── tests/                       # Test suite
│   ├── unit/                    # Unit tests
│   └── integration/             # Integration tests
│
├── download/                    # [Data] Temporary download storage
├── extensions/                  # [Data] Installed extensions storage
└── main.py                      # Application entry point (Async)
```

## Design Principles

### 1. Domain-Driven Design (DDD)

- **Domain Layer**: Contains core business logic, independent of external concerns.
- **Application Layer**: Orchestrates use cases and application flow.
- **Infrastructure Layer**: Implements technical details (Persistence, HTTP, File system, Logging).
- **Presentation Layer**: Handles external communication (Async gRPC API).

### 2. Dependency Inversion

- High-level modules don't depend on low-level modules.
- Both depend on abstractions (interfaces).
- Example: Use cases depend on `ExtensionRepository` interface, not the file-system implementation.

### 3. Single Responsibility

- Each class has one reason to change.
- `ExtensionFileManager`: Only handles file operations.
- `HttpDownloader`: Only handles HTTP downloads.
- Use cases: Each handles one specific business operation.

### 4. Testability

All components are designed for easy testing:

- **Domain entities**: Pure Python objects, no external dependencies.
- **Use cases**: Depend on interfaces, easily mocked.
- **Services**: Injectable dependencies.
- **Repositories**: Interface-based, swappable implementations.

## Key Components

### Domain Layer

**Extension (Entity)**

- Represents an installed extension.
- Contains business logic for installation lifecycle.

**Repo (Entity)**

- Represents a registered extension repository.
- Validates repository source (e.g., GitHub).

**ExtensionMetadata (Value Object)**

- Immutable extension information.
- Validates data integrity.

**Repository Interfaces**

- Define contracts for data access.
- Enable dependency inversion.

### Application Layer

**Use Cases**

- One class per business operation (e.g., `InstallExtensionUseCase`, `AddRepoUseCase`).
- Pure business logic orchestrating domain and infrastructure.

**Services**

- `ExtensionInstaller`: Handles the technical process of downloading and extracting.
- `ExtensionLoader`: Dynamic module loading for extensions.

### Infrastructure Layer

**Repository Implementations**

- `ExtensionRepositoryImpl`: File-based storage for installed extensions.
- `RepoRepositoryImpl`: Persistent storage for registered repositories.

**Logging Service**

- Provides centralized logging.
- Supports real-time log streaming via gRPC.

**Health Check Service**

- Monitors system health.
- Supports real-status streaming.

### Presentation Layer

**SidecarService (Async gRPC)**

- Implementation of `SidecarApiServicer`.
- Asynchronous request handling using `grpc.aio`.
- Delegates all business logic to use cases.
- Supports streaming for logs and health status.

## Dependency Injection

Using manual DI with `DependencyContainer`:

- Explicit wiring in `shared/dependency_container.py`.
- Singleton instances managed by the container.
- Clean separation of infrastructure and application logic.

## Testing Strategy

### Unit Tests

- Test individual components in isolation.
- Mock all dependencies.
- Focus on business logic.

### Integration Tests

- Test component interactions.
- Validate end-to-end flows (e.g., install to load).

## Migration Notes

- The service has been migrated to an asynchronous architecture using `grpc.aio`.
- All file operations are encapsulated in `ExtensionFileManager`.
- Logging is now a first-class service supporting streaming.

## Running the Service

```bash
cd sidecar/src
python main.py
```

## Benefits of This Architecture

1. **Testability**: Highly decoupled components.
2. **Maintainability**: Clear architectural boundaries.
3. **Flexibility**: Simple to swap infrastructure (e.g., from file-based to DB-based storage).
4. **Resilience**: Centralized logging and health monitoring.
5. **Performance**: Asynchronous gRPC handling for better throughput.
