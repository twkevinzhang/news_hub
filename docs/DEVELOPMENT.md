# Development Guide

Complete guide for building, running, and contributing to News Hub.

## 📋 Table of Contents

- [Quick Start (5 Minutes)](#quick-start)
- [Architecture Overview](#architecture)
- [Project Structure](#structure)
- [Development Workflow](#workflow)
- [Common Commands](#commands)
- [Flutter Flavors](#flavors)
- [Testing](#testing)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)

---

## 🚀 Quick Start (5 Minutes) {#quick-start}

### Prerequisites

Ensure you have the following installed:

- **Flutter** 3.38+ with Dart 3.10+
- **Python** 3.8+ with pip
- **Android SDK** (for Android development)
- **Git**

### Installation

```bash
# 1. Clone the repository
git clone https://github.com/twkevinzhang/news_hub.git
cd news_hub

# 2. Install Flutter dependencies
make install

# 3. Install Python dependencies (for sidecar)
cd sidecar
pip install -r requirements.txt
cd ..

# 4. Run the app with local sidecar
make run-sidecar
```

That's it! The app should launch on your connected device or emulator.

---

## 🏗️ Architecture Overview {#architecture}

### System Architecture

```
┌─────────────────────────────────────────────────────┐
│                  Flutter App (UI)                   │
│  - Material Design 3 Components                     │
│  - BLoC/Cubit State Management                      │
│  - Drift Database (SQLite)                          │
└────────────────────┬────────────────────────────────┘
                     │
                     │ gRPC (Protocol Buffers)
                     │
┌────────────────────▼────────────────────────────────┐
│            Python Sidecar Service                   │
│  - Async gRPC Server (grpc.aio)                     │
│  - Extension Management                             │
│  - Dynamic Extension Loading                        │
└────────────────────┬────────────────────────────────┘
                     │
            ┌────────┴────────┐
            │                 │
    ┌───────▼─────┐   ┌──────▼──────┐
    │ Extension A │   │ Extension B │
    │ (Forum 1)   │   │ (Forum 2)   │
    └─────────────┘   └─────────────┘
```

### Tech Stack

**Frontend (Flutter)**
- **Framework**: Flutter 3.38+
- **Architecture**: Clean Architecture + Domain-Driven Design
- **State Management**: BLoC/Cubit (flutter_bloc)
- **Routing**: AutoRoute (type-safe navigation)
- **Database**: Drift (SQLite ORM)
- **DI**: GetIt + Injectable
- **Code Generation**: freezed, json_serializable, auto_route_generator

**Backend (Python Sidecar)**
- **Framework**: Python 3.8+
- **Architecture**: Domain-Driven Design (DDD)
- **RPC**: gRPC with async support (grpc.aio)
- **Scraping**: lxml, BeautifulSoup
- **Testing**: pytest with coverage

**Communication**
- **Protocol**: gRPC
- **Serialization**: Protocol Buffers (protobuf)
- **Shared Definitions**: `news_hub_protos/`

### Design Principles

Both frontend and backend follow **Clean Architecture**:

1. **Dependency Inversion**: High-level modules don't depend on low-level details
2. **Single Responsibility**: Each component has one clear purpose
3. **Testability**: All components designed for easy unit testing
4. **Separation of Concerns**: Clear layer boundaries (domain, application, infrastructure, presentation)

---

## 📁 Project Structure {#structure}

```
news_hub/
├── lib/                      # Flutter application
│   ├── domain/               # Business logic layer (Pure Dart)
│   │   ├── models/           # Domain entities (freezed)
│   │   ├── */repository.dart # Repository interfaces
│   │   └── */interactor/     # Use cases
│   ├── app/                  # Implementation layer
│   │   ├── service/          # Infrastructure services
│   │   │   ├── api/          # gRPC client
│   │   │   ├── database/     # Drift database
│   │   │   └── connection/   # Connection manager
│   │   └── */                # Repository implementations
│   ├── presentation/         # UI layer
│   │   ├── pages/            # Screen implementations
│   │   ├── components/       # Reusable widgets
│   │   └── router/           # AutoRoute configuration
│   ├── locator.dart          # Dependency injection setup
│   ├── main_sidecar.dart     # Entry point (sidecar flavor)
│   └── main_remote.dart      # Entry point (remote flavor)
│
├── sidecar/                  # Python gRPC service
│   ├── src/
│   │   ├── domain/           # Core business logic
│   │   ├── application/      # Use cases
│   │   ├── infrastructure/   # Technical implementations
│   │   ├── presentation/     # gRPC service
│   │   ├── shared/           # Config & DI container
│   │   └── tests/            # Test suite
│   ├── requirements.txt      # Python dependencies
│   └── README.md             # Sidecar documentation
│
├── news_hub_protos/          # Shared protobuf definitions
│   └── *.proto               # gRPC service definitions
│
├── Makefile                  # Development commands
├── pubspec.yaml              # Flutter dependencies
├── DEVELOPMENT.md            # This file
└── CLAUDE.md                 # AI development guidelines
```

### Key Dependency Rules

**Domain Layer** (lib/domain/):
- ✅ Allowed: `get_it`, `injectable`, `dartx`, `freezed`, `json_annotation`, `flutter/foundation.dart`
- ❌ Forbidden: Flutter widgets, infrastructure dependencies

**App Layer** (lib/app/):
- Implements domain repository interfaces
- Contains all external dependencies (gRPC, database, HTTP)

**Presentation Layer** (lib/presentation/):
- Depends on domain layer only (not app layer directly)
- Uses dependency injection to get implementations

---

## 🔄 Development Workflow {#workflow}

### Daily Development Scenarios

#### Scenario 1: UI/UX Development (Fast Iteration)

When working on Flutter UI without changing Python backend:

```bash
# Option A: Use remote sidecar (fastest)
# Terminal 1: Run sidecar standalone
cd sidecar/src && python main.py

# Terminal 2: Run Flutter app connecting to localhost
make run-remote SIDECAR_HOST=127.0.0.1
```

**Why?** Skips the ~1 minute sidecar rebuild process. Hot reload works instantly.

#### Scenario 2: Full-Stack Development

When working on both Flutter and Python:

```bash
# Run with embedded sidecar (rebuilds Python on changes)
make run-sidecar
```

#### Scenario 3: Backend-Only Development

When working exclusively on Python sidecar:

```bash
cd sidecar/src

# Run sidecar
python main.py

# Run tests
python -m pytest tests/ -v

# Run with coverage
python -m pytest --cov=. --cov-report=html tests/
```

#### Scenario 4: Team Collaboration

Developer A (Backend):
```bash
# Find your IP
make sidecar-info

# Run sidecar
make -C sidecar run
# Sidecar runs on 0.0.0.0:55001
```

Developer B (Frontend):
```bash
# Connect to Developer A's machine
make run-remote SIDECAR_HOST=192.168.1.100
```

### Code Generation Workflow

News Hub heavily uses code generation. Run these after modifying annotated code:

```bash
# After modifying @freezed, @injectable, @AutoRoute, or Drift tables
make build

# Equivalent to:
dart run build_runner build --delete-conflicting-outputs

# Watch mode (auto-generates on file changes)
dart run build_runner watch --delete-conflicting-outputs
```

```bash
# After modifying .proto files
make proto

# This regenerates:
# - lib/app/service/api/models/sidecar_api.pb*.dart
# - sidecar/src/sidecar_api_pb2*.py
```

---

## 📦 Common Commands {#commands}

### Essential Commands

| Command | Description | When to Use |
|---------|-------------|-------------|
| `make install` | Install Flutter dependencies | First setup, after pulling changes |
| `make run-sidecar` | Run app with local Python | Default development |
| `make run-remote SIDECAR_HOST=<IP>` | Run app with remote sidecar | Fast UI iteration |
| `make build` | Run dart build_runner | After code generation changes |
| `make proto` | Generate protobuf code | After .proto changes |
| `make sidecar` | Build sidecar distribution | Before building APK |

### Build Commands

```bash
# Build APK with embedded sidecar (~50MB)
make build-sidecar

# Build APK for remote connection only (~10MB)
make build-remote

# Build for specific remote host
make build-remote SIDECAR_HOST=api.example.com
```

### Sidecar Commands

```bash
# Run sidecar standalone
make -C sidecar run
# Or: cd sidecar/src && python main.py

# Run tests
cd sidecar && python -m pytest tests/

# Run specific test
python -m pytest tests/unit/test_extension_entity.py -v

# Coverage report
python -m pytest --cov=. --cov-report=html tests/
```

### Code Quality

```bash
# Analyze Dart code
flutter analyze

# Format Dart code
flutter format lib/

# Run Flutter tests
flutter test

# Run with coverage
flutter test --coverage

# Lint Python code
cd sidecar
python3 -m flake8 src --select=E9,F63,F7,F82 --count
```

### Utility Commands

```bash
# View network info (IP, hostname for remote connections)
make sidecar-info

# View Android device logs
make log

# Clean build artifacts
flutter clean
cd sidecar && make clean
```

---

## 🎭 Flutter Flavors {#flavors}

News Hub uses two build flavors for different deployment scenarios.

### Flavor Comparison

| Feature | Sidecar Flavor | Remote Flavor |
|---------|----------------|---------------|
| **Python Included** | ✅ Yes (embedded) | ❌ No |
| **APK Size** | ~50MB | ~10MB |
| **Build Time** | Slow (~1-2 min) | Fast (~10 sec) |
| **Hot Reload** | Standard | Instant |
| **Use Case** | Production, standalone | Development, remote server |
| **Entry Point** | `lib/main_sidecar.dart` | `lib/main_remote.dart` |

### When to Use Which?

**Use Sidecar Flavor:**
- Building release APK for distribution
- Testing Python sidecar changes
- Standalone app without network dependency
- Production deployment

**Use Remote Flavor:**
- Rapid UI prototyping
- Working with a team (shared sidecar server)
- Testing without rebuilding Python
- Low-end development devices

### Configuration

Flavors are configured in `pubspec.yaml`:

```yaml
flavorizr:
  flavors:
    sidecar:
      app:
        name: "News Hub Sidecar"
      android:
        applicationId: "tw.kevinzhang.news_hub.sidecar"
    remote:
      app:
        name: "News Hub Remote"
      android:
        applicationId: "tw.kevinzhang.news_hub.remote"
```

### Sidecar Host Configuration

Priority order (highest to lowest):

1. **Makefile parameter**: `SIDECAR_HOST=10.0.0.1 make run-remote`
2. **Compile-time flag**: `flutter run --dart-define=SIDECAR_HOST=example.com`
3. **Default**: `127.0.0.1:55001`

---

## 🧪 Testing {#testing}

### Testing Strategy

**Flutter (lib/)**
- **Unit Tests**: Domain layer (use cases, entities) - Target 80%+ coverage
- **Widget Tests**: Presentation layer (stateless widgets, simple BLoCs)
- **Integration Tests**: Repository implementations with mocked gRPC

**Python (sidecar/)**
- **Unit Tests**: Domain layer (entities, value objects) - Target 80%+ coverage
- **Integration Tests**: Use cases with real file system
- **E2E Tests**: gRPC service with test client

### Running Tests

**Flutter:**
```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage

# View coverage (requires lcov)
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html

# Run specific test file
flutter test test/domain/thread/get_thread_test.dart
```

**Python:**
```bash
cd sidecar

# Run all tests
python -m pytest tests/

# Run with verbose output
python -m pytest tests/ -v

# Run specific test
python -m pytest tests/unit/test_extension_entity.py

# Generate coverage report
python -m pytest --cov=. --cov-report=html tests/
open htmlcov/index.html
```

### Coverage Requirements

As defined in CLAUDE.md:

- **Domain Layer**: 80%+ coverage (strictly enforced)
- **BLoC/Cubit**: 80%+ coverage (strictly enforced)
- **Infrastructure/App Layer**: Best effort (not strictly required)
- **UI Widgets**: Best effort (not strictly required)

---

## 🐛 Troubleshooting {#troubleshooting}

### Common Issues

#### Problem: "Connection refused" when running app

**Symptoms:**
- App shows "Sidecar Disconnected" status
- Logs show connection errors to `127.0.0.1:55001`

**Solutions:**
```bash
# Check if sidecar is running
lsof -i :55001

# If not running, start it
cd sidecar/src && python main.py

# Check firewall settings (macOS)
# System Preferences → Security & Privacy → Firewall

# For remote connections, verify host is reachable
ping <SIDECAR_HOST>
telnet <SIDECAR_HOST> 55001
```

---

#### Problem: Build fails with "proto not found"

**Symptoms:**
```
Error: The argument type 'GeneratedMessageGenericExtensions<dynamic>' can't be assigned...
```

**Solutions:**
```bash
# Regenerate protobuf files
make proto

# If that doesn't work, clean and rebuild
flutter clean
make proto
make build
```

---

#### Problem: Sidecar build takes forever

**Symptoms:**
- `make build-sidecar` hangs on "Building sidecar..."
- Takes >5 minutes to build

**Solutions:**
```bash
# Use remote flavor during development
make run-remote SIDECAR_HOST=127.0.0.1

# Or use pre-built sidecar
make build-remote
```

---

#### Problem: "Cannot find package" after adding dependency

**Symptoms:**
- Import errors after modifying `pubspec.yaml` or `requirements.txt`

**Solutions:**
```bash
# Flutter dependencies
flutter pub get

# Python dependencies
cd sidecar
pip install -r requirements.txt

# If using virtual environment
pip install -r requirements.txt --force-reinstall
```

---

#### Problem: Code generation produces errors

**Symptoms:**
- Build runner fails
- Missing `.g.dart` or `.freezed.dart` files

**Solutions:**
```bash
# Clean previous generation
flutter clean

# Delete conflicting outputs and regenerate
dart run build_runner build --delete-conflicting-outputs

# If errors persist, check for:
# 1. Syntax errors in annotated classes
# 2. Missing part directives (part 'file.freezed.dart';)
# 3. Conflicting annotations
```

---

#### Problem: gRPC timeout errors

**Symptoms:**
- Operations timeout after 10 seconds
- Logs show deadline exceeded

**Solutions:**
```python
# In Python sidecar, use executor for blocking operations
import asyncio
from concurrent.futures import ThreadPoolExecutor

executor = ThreadPoolExecutor()

async def some_grpc_method(self, request, context):
    # Run blocking scraper in thread pool
    result = await asyncio.get_event_loop().run_in_executor(
        executor,
        scraper.fetch_data,  # Blocking function
        request.url
    )
    return result
```

**Note:** Default timeout is 10 seconds (configured in CLAUDE.md).

---

#### Problem: Extension installation fails

**Symptoms:**
- Extension shows as "failed" in UI
- Logs show import errors

**Solutions:**
```bash
# Check extension has correct structure:
extension_name/
├── resolver_impl.py  # Must exist
├── metadata.json     # Must exist
└── requirements.txt  # Optional

# Verify Python dependencies are installed
cd sidecar/extensions/<extension_name>
pip install -r requirements.txt

# Check logs for specific errors
# Settings → Sidecar Logs
```

---

### Debug Mode

Enable verbose logging:

**Flutter:**
```dart
// In lib/locator.dart or main.dart
Logger.level = Level.debug;
```

**Python:**
```python
# In sidecar/src/shared/config.py
LOG_LEVEL = "DEBUG"
```

---

## 🔐 Security Notes

### ⚠️ Critical Rules

**NEVER commit:**
- ❌ Real IP addresses in source code
- ❌ API keys or credentials
- ❌ `.env` files with secrets
- ❌ Firebase config files (if added)

**ALWAYS use:**
- ✅ `--dart-define` for local development
- ✅ Environment variables
- ✅ `.gitignore` for sensitive files
- ✅ In-app settings UI for user configuration

### Example: Safe Configuration

```bash
# ❌ BAD: Hard-coded in code
const sidecarHost = "192.168.1.100";

# ✅ GOOD: Use dart-define
flutter run --dart-define=SIDECAR_HOST=192.168.1.100

# ✅ GOOD: In Makefile (not committed)
make run-remote SIDECAR_HOST=my-dev-server.local
```

---

## 🤝 Contributing {#contributing}

### Before You Start

1. Read [CLAUDE.md](./CLAUDE.md) - AI development guidelines and code quality standards
2. Check existing issues and PRs to avoid duplication
3. For major changes, open an issue first to discuss

### Development Process

1. **Fork & Clone**
   ```bash
   git clone https://github.com/YOUR_USERNAME/news_hub.git
   cd news_hub
   git checkout -b feat/my-feature
   ```

2. **Make Changes**
   - Follow Clean Architecture principles
   - Write tests for new features (80%+ coverage for domain/BLoC)
   - Run `flutter analyze` and `pytest` before committing

3. **Commit**
   ```bash
   # Follow Conventional Commits
   git commit -m "feat(thread): add reply tree visualization

   - Implement recursive tree builder
   - Add collapse/expand animation
   - Update ThreadDetailCubit with tree state

   Closes #123"
   ```

4. **Test**
   ```bash
   # Flutter
   flutter test --coverage
   flutter analyze

   # Python
   cd sidecar
   python -m pytest tests/ --cov=.
   python3 -m flake8 src
   ```

5. **Push & PR**
   ```bash
   git push origin feat/my-feature
   # Open PR on GitHub targeting 'master' branch
   ```

### Commit Message Format

Follow [Conventional Commits](https://www.conventionalcommits.org/):

```
<type>(<scope>): <subject>

<body>

<footer>
```

**Types:**
- `feat`: New feature
- `fix`: Bug fix
- `refactor`: Code refactoring
- `docs`: Documentation changes
- `test`: Adding tests
- `chore`: Tooling changes

**Example:**
```
feat(extension): add repository management UI

- Implement ReposTab with add/remove functionality
- Add RepoCubit for state management
- Update ExtensionManageScreen with new tab

Closes #45
```

### Code Review Checklist

Before submitting PR, ensure:

- [ ] Code follows Clean Architecture principles
- [ ] Domain layer has no Flutter/infrastructure dependencies
- [ ] Tests written for new features (80%+ coverage)
- [ ] `flutter analyze` shows 0 errors
- [ ] `pytest` passes all tests
- [ ] Commit messages follow Conventional Commits
- [ ] No secrets or IP addresses committed
- [ ] CHANGELOG.md updated (if applicable)

---

## 📚 Additional Resources

### Internal Documentation
- **[CLAUDE.md](./CLAUDE.md)** - AI development guidelines, code quality standards, BLoC optimization rules
- **[sidecar/ARCHITECTURE.md](./sidecar/ARCHITECTURE.md)** - Detailed Python backend architecture
- **[lib/domain/README.md](./lib/domain/README.md)** - Domain layer guidelines

### External Resources
- [Flutter Documentation](https://docs.flutter.dev/)
- [BLoC Library](https://bloclibrary.dev/)
- [Drift Documentation](https://drift.simonbinder.eu/)
- [gRPC Python](https://grpc.io/docs/languages/python/)
- [AutoRoute](https://pub.dev/packages/auto_route)

### Community
- **GitHub Issues**: Report bugs or request features
- **GitHub Discussions**: Ask questions or share ideas
- **Extension Registry**: [news_hub_extensions](https://github.com/twkevinzhang/news_hub_extensions)

---

**Happy coding! 🚀**
