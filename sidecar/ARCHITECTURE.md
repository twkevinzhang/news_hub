# Sidecar Service Architecture

## Architecture Layers

```
┌─────────────────────────────────────────┐
│        Presentation Layer (gRPC)        │
│  - SidecarService                       │
└─────────────────────────────────────────┘
                  ↓
┌─────────────────────────────────────────┐
│        Application Layer                │
│  - Use Cases (Install, Uninstall, etc.) │
│  - Application Services                 │
└─────────────────────────────────────────┘
                  ↓
┌─────────────────────────────────────────┐
│         Domain Layer                    │
│  - Entities (Extension)                 │
│  - Value Objects (ExtensionMetadata)    │
│  - Repository Interfaces                │
└─────────────────────────────────────────┘
                  ↑
┌─────────────────────────────────────────┐
│      Infrastructure Layer               │
│  - Repository Implementations           │
│  - File System Manager                  │
│  - HTTP Downloader                      │
└─────────────────────────────────────────┘
```

## Directory Structure

```
src/
├── domain/                      # Core business logic
│   ├── entities/                # Business entities
│   │   └── extension.py         # Extension entity
│   ├── repositories/            # Repository interfaces
│   │   └── extension_repository.py
│   └── value_objects/           # Immutable value objects
│       └── extension_metadata.py
│
├── application/                 # Use cases and app services
│   ├── use_cases/               # Business use cases
│   │   ├── install_extension.py
│   │   ├── uninstall_extension.py
│   │   ├── list_installed_extensions.py
│   │   ├── list_remote_extensions.py
│   │   └── get_installed_extension.py
│   └── services/                # Application services
│       ├── extension_installer.py
│       └── extension_loader.py
│
├── infrastructure/              # External dependencies
│   ├── repositories/            # Repository implementations
│   │   ├── extension_repository_impl.py
│   │   └── remote_extension_repository_impl.py
│   ├── downloaders/             # Download mechanisms
│   │   └── http_downloader.py
│   └── file_system/             # File operations
│       └── extension_file_manager.py
│
├── presentation/                # External interfaces
│   └── grpc/                    # gRPC service
│       └── sidecar_service.py
│
├── shared/                      # Shared utilities
│   ├── config.py                # Configuration
│   ├── dependency_container.py  # DI container
│   └── logger.py                # Logging setup
│
├── tests/                       # Test suite
│   ├── unit/                    # Unit tests
│   └── integration/             # Integration tests
│
└── main_new.py                  # Application entry point
```

## Design Principles

### 1. Domain-Driven Design (DDD)

- **Domain Layer**: Contains core business logic, independent of external concerns
- **Application Layer**: Orchestrates use cases and application flow
- **Infrastructure Layer**: Implements technical details (database, HTTP, file system)
- **Presentation Layer**: Handles external communication (gRPC API)

### 2. Dependency Inversion

- High-level modules don't depend on low-level modules
- Both depend on abstractions (interfaces)
- Example: Use cases depend on `ExtensionRepository` interface, not the file-system implementation

### 3. Single Responsibility

- Each class has one reason to change
- `ExtensionFileManager`: Only handles file operations
- `HttpDownloader`: Only handles HTTP downloads
- Use cases: Each handles one specific business operation

### 4. Testability

All components are designed for easy testing:

- **Domain entities**: Pure Python objects, no external dependencies
- **Use cases**: Depend on interfaces, easily mocked
- **Services**: Injectable dependencies
- **Repositories**: Interface-based, swappable implementations

Example test:

```python
def test_install_extension():
    # Mock dependencies
    repository = Mock()
    installer = Mock()

    # Create use case with mocks
    use_case = InstallExtensionUseCase(repository, installer)

    # Test behavior
    result = use_case.execute(metadata)

    # Verify interactions
    repository.save.assert_called_once()
```

## Key Components

### Domain Layer

**Extension (Entity)**

- Represents an installed extension
- Contains business logic for installation lifecycle
- Mutable state (installed/uninstalled)

**ExtensionMetadata (Value Object)**

- Immutable extension information
- Validates data integrity
- Contains no behavior, only data

**Repository Interfaces**

- Define contracts for data access
- No implementation details
- Enable dependency inversion

### Application Layer

**Use Cases**

- One class per business operation
- Pure business logic
- No technical details

**Services**

- Support use cases with technical operations
- `ExtensionInstaller`: Download and install
- `ExtensionLoader`: Dynamic module loading

### Infrastructure Layer

**Repository Implementations**

- Implement domain repository interfaces
- Handle technical details (JSON, file I/O)
- Swappable with other implementations

**File System Manager**

- Encapsulates all file operations
- Makes file operations testable
- Centralized error handling

**HTTP Downloader**

- Handles HTTP requests
- Async/sync support
- Timeout management

### Presentation Layer

**SidecarService (gRPC)**

- Thin adapter layer
- Delegates to use cases
- Handles protocol-specific concerns
- Error translation

## Dependency Injection

Using manual DI with `DependencyContainer`:

```python
class DependencyContainer:
    def __init__(self):
        # Create infrastructure
        self.http_downloader = HttpDownloader()
        self.file_manager = ExtensionFileManager(...)

        # Create repositories
        self.repository = RepositoryImpl(
            file_manager=self.file_manager
        )

        # Create use cases
        self.install_uc = InstallExtensionUseCase(
            repository=self.repository,
            installer=self.extension_installer
        )

        # Create service
        self.sidecar_service = SidecarService(
            install_extension_uc=self.install_uc,
            ...
        )
```

Benefits:

- Clear dependency graph
- Easy to test (swap implementations)
- No magic, explicit wiring
- Simple to understand

## Testing Strategy

### Unit Tests

- Test individual components in isolation
- Mock all dependencies
- Focus on business logic
- Fast execution

### Integration Tests

- Test component interactions
- May use real file system (in temp directory)
- Test error scenarios
- Validate end-to-end flows

### Test Coverage Goals

- Domain: 80%+
- Application: 70%+
- Infrastructure: 60%+
- Presentation: 50%+

## Migration Guide

### Old → New Mapping

| Old                    | New                                                    |
| ---------------------- | ------------------------------------------------------ |
| `api_server_impl.py`   | `presentation/grpc/sidecar_service.py`                 |
| Direct file operations | `infrastructure/file_system/extension_file_manager.py` |
| HTTP in API server     | `infrastructure/downloaders/http_downloader.py`        |
| Mixed concerns         | Separated into layers                                  |

### Running the New Service

```bash
python main_new.py
```

### Running Tests

```bash
# Run all tests
python -m pytest tests/

# Run specific tests
python -m pytest tests/unit/test_use_cases.py

# With coverage
python -m pytest --cov=. tests/
```

## Benefits of This Architecture

1. **Testability**: All components are easily testable with mocks
2. **Maintainability**: Clear separation of concerns
3. **Flexibility**: Easy to swap implementations
4. **Scalability**: Add new features without changing existing code
5. **Clarity**: Clear dependencies and data flow
6. **Robustness**: Better error handling and validation

## Future Improvements

- Add caching layer for loaded extensions
- Implement event-driven architecture for install progress
- Add database for extension metadata
- Implement retry logic for downloads
- Add metrics and monitoring
- Support for extension updates
