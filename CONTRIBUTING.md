# Contributing to News Hub

Thank you for considering contributing to News Hub! This document outlines the development workflow, coding standards, and best practices for the project.

## Table of Contents

- [Getting Started](#getting-started)
- [Development Workflow](#development-workflow)
- [Coding Standards](#coding-standards)
- [Commit Message Guidelines](#commit-message-guidelines)
- [Pull Request Process](#pull-request-process)
- [Code Review Guidelines](#code-review-guidelines)

---

## Getting Started

### Prerequisites

- Flutter 3.38+ with Dart 3.10+
- Python 3.8+ with pip
- Git
- Android SDK (for Android development)

### Setup

```bash
# 1. Fork the repository on GitHub
# 2. Clone your fork
git clone https://github.com/YOUR_USERNAME/news_hub.git
cd news_hub

# 3. Add upstream remote
git remote add upstream https://github.com/twkevinzhang/news_hub.git

# 4. Install dependencies
make install
cd sidecar && pip install -r requirements.txt && cd ..

# 5. Install development tools
pip install black flake8 pre-commit
```

### Pre-commit Hooks (Recommended)

We recommend setting up pre-commit hooks to catch issues before committing:

```bash
# Install pre-commit
pip install pre-commit

# Install hooks
pre-commit install
```

Our pre-commit hooks check for:
- ✅ Flutter analyzer errors
- ✅ Python code style (Black + flake8)
- ✅ Sensitive information (IPs, API keys, passwords)
- ✅ Trailing whitespace and file formatting

---

## Development Workflow

### Branch Naming Convention

Follow this pattern for branch names:

```
<type>/<short-description>
```

**Types:**
- `feat/` - New features
- `fix/` - Bug fixes
- `docs/` - Documentation changes
- `refactor/` - Code refactoring
- `test/` - Adding or updating tests
- `chore/` - Maintenance tasks

**Examples:**
```bash
feat/thread-tree-visualization
fix/search-crash-on-empty-query
docs/update-api-documentation
refactor/simplify-bloc-logic
```

### Workflow Steps

1. **Create a feature branch**
   ```bash
   git checkout -b feat/your-feature-name
   ```

2. **Make changes following our coding standards**

3. **Test your changes**
   ```bash
   # Flutter
   flutter test --coverage
   flutter analyze

   # Python
   cd sidecar
   python -m pytest tests/ --cov=.
   black src/
   flake8 src/
   ```

4. **Commit with proper message format** (see below)

5. **Keep your branch updated**
   ```bash
   git fetch upstream
   git rebase upstream/master
   ```

6. **Push and create Pull Request**
   ```bash
   git push origin feat/your-feature-name
   ```

---

## Coding Standards

### Flutter/Dart Standards

#### General Principles

- Follow **Clean Architecture** principles
- Adhere to **Domain-Driven Design (DDD)** in domain layer
- Use **BLoC/Cubit** for state management
- Follow `flutter_lints` rules

#### Code Style

```dart
// ✅ GOOD: Use const constructors
const SizedBox(height: 16);

// ❌ BAD: Missing const
SizedBox(height: 16);

// ✅ GOOD: Use final for local variables
final user = await repository.getUser();

// ❌ BAD: Using var unnecessarily
var user = await repository.getUser();

// ✅ GOOD: Always declare return types
Future<User> getUser() async { ... }

// ❌ BAD: Implicit return type
getUser() async { ... }
```

#### Architecture Rules

**Domain Layer** (`lib/domain/`):
- ✅ **Allowed**: `get_it`, `injectable`, `dartx`, `freezed`, `json_annotation`, `flutter/foundation.dart`
- ❌ **Forbidden**: Flutter widgets, infrastructure dependencies

**App Layer** (`lib/app/`):
- Implements domain repository interfaces
- Contains infrastructure code (gRPC, database, HTTP)

**Presentation Layer** (`lib/presentation/`):
- Use BLoC/Cubit for state management
- **BLoC State must use `freezed`**
- Domain models can be plain classes
- Optimize rebuilds (target 80%+ reduction)

#### Dependency Injection

```dart
// ✅ GOOD: Use @injectable for auto-registration
@injectable
class GetCollections {
  final CollectionRepository _repository;
  GetCollections(this._repository);
}

// ✅ GOOD: Private fields with underscore
final CollectionRepository _repository;

// ❌ BAD: Public fields
final CollectionRepository repository;
```

#### State Management with BLoC

```dart
// ✅ GOOD: Use freezed for state
@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default([]) List<Collection> collections,
    String? expandedCollectionId,
  }) = _HomeState;
}

// ✅ GOOD: Cancel subscriptions in close()
@override
Future<void> close() {
  _collectionSubscription?.cancel();
  return super.close();
}

// ✅ GOOD: Optimize rebuilds with BlocSelector
BlocSelector<HomeCubit, HomeState, List<Collection>>(
  selector: (state) => state.collections,
  builder: (context, collections) => ListView(...),
)
```

#### Code Generation

Run code generation after modifying annotated classes:

```bash
# After changing @freezed, @injectable, @AutoRoute, Drift tables
dart run build_runner build --delete-conflicting-outputs

# Watch mode
dart run build_runner watch --delete-conflicting-outputs
```

### Python Standards

#### General Principles

- Follow **Domain-Driven Design (DDD)**
- Use **type hints** everywhere
- Write **docstrings** for all public APIs
- Use **dataclasses** for entities and value objects

#### Code Style

We use **Black** for automatic code formatting:

```bash
# Format code
black src/

# Check formatting
black --check src/

# Lint with flake8
flake8 src/ --select=E9,F63,F7,F82
```

**Black Configuration** (defaults):
- Line length: 88 characters
- String quotes: Double quotes
- Indentation: 4 spaces

#### Naming Conventions

```python
# ✅ GOOD: Classes use PascalCase
class ExtensionRepository:
    pass

# ✅ GOOD: Functions/methods use snake_case
def install_extension(pkg_name: str) -> Extension:
    pass

# ✅ GOOD: Private members use leading underscore
def _internal_helper():
    pass

# ✅ GOOD: Constants use UPPER_SNAKE_CASE
DEFAULT_TIMEOUT = 10
```

#### Type Hints

```python
# ✅ GOOD: Always use type hints
def execute(self, metadata: ExtensionMetadata, repo_url: str = "") -> Extension:
    pass

# ❌ BAD: Missing type hints
def execute(self, metadata, repo_url=""):
    pass

# ✅ GOOD: Use Optional for nullable types
from typing import Optional

def find_by_id(self, pkg_name: str) -> Optional[Extension]:
    pass
```

#### Docstrings

Use Google-style docstrings:

```python
# ✅ GOOD: Google-style docstring
def install_extension(self, metadata: ExtensionMetadata) -> Extension:
    """Install an extension from metadata.

    Args:
        metadata: Extension metadata containing installation info

    Returns:
        The installed Extension entity

    Raises:
        ExtensionAlreadyExistsError: If extension is already installed
        InstallationError: If installation fails
    """
    pass
```

#### Logging

```python
# ✅ GOOD: Use logger with __name__
import logging

logger = logging.getLogger(__name__)

class MyService:
    def do_something(self):
        logger.info("Doing something")
        logger.error("Failed to do something", exc_info=True)
```

#### Architecture Rules

**Domain Layer** (`sidecar/src/domain/`):
- ❌ No external dependencies
- ✅ Pure Python entities and value objects
- ✅ Repository interfaces only (no implementations)

**Application Layer** (`sidecar/src/application/`):
- ✅ Use cases orchestrate domain logic
- ✅ Application services coordinate operations

**Infrastructure Layer** (`sidecar/src/infrastructure/`):
- ✅ Repository implementations
- ✅ External service integrations

#### Testing

```python
# ✅ GOOD: Use unittest framework
import unittest

class TestExtensionEntity(unittest.TestCase):
    """Test Extension Entity"""

    def setUp(self):
        """Set up test fixtures"""
        self.metadata = ExtensionMetadata(...)

    def test_create_extension(self):
        """Test creating an extension"""
        extension = Extension(...)
        self.assertEqual(extension.pkg_name, "test")
```

### Protobuf Standards

When modifying `.proto` files:

```bash
# Regenerate code for both Dart and Python
make proto
```

Ensure backward compatibility:
- Use field numbers carefully (never reuse)
- Mark deprecated fields instead of removing
- Add new fields with default values

---

## Commit Message Guidelines

We follow the **Angular Commit Message Convention** with strict scope enforcement.

### Format

```
<type>(<scope>): <subject>

<body>

<footer>
```

### Type

Must be one of:

- **feat**: New feature
- **fix**: Bug fix
- **docs**: Documentation changes
- **refactor**: Code refactoring (no functional changes)
- **test**: Adding or updating tests
- **chore**: Maintenance tasks (dependencies, build config)
- **perf**: Performance improvements
- **ci**: CI/CD configuration changes

### Scope

Scope is **required** and must be one of the following:

**Flutter/App Scopes:**
- `domain` - Domain layer (entities, use cases, repositories)
- `app` - App layer (repository implementations, services)
- `presentation` - Presentation layer (BLoCs, screens, components)
- `ui` - UI components only
- `router` - Routing and navigation
- `database` - Drift database schemas and queries
- `api` - gRPC client implementations

**Python/Sidecar Scopes:**
- `sidecar` - General sidecar changes
- `extension` - Extension system
- `sidecar-domain` - Sidecar domain layer
- `sidecar-infra` - Sidecar infrastructure
- `grpc` - gRPC service implementations

**Cross-cutting Scopes:**
- `proto` - Protocol buffer definitions
- `docs` - Documentation
- `deps` - Dependencies (pubspec.yaml, requirements.txt)
- `config` - Configuration files
- `ci` - CI/CD pipelines
- `build` - Build system (Makefile, gradle)

### Subject

- Use imperative, present tense: "change" not "changed" nor "changes"
- Don't capitalize first letter
- No period (.) at the end
- Maximum 72 characters

### Body

- Use imperative, present tense
- Include motivation for the change
- Contrast with previous behavior
- Wrap at 72 characters

### Footer

- Reference issues: `Closes #123` or `Fixes #456`
- Note breaking changes: `BREAKING CHANGE: <description>`

### Examples

#### Good Commits

```
feat(extension): add repository management UI

- Implement ReposTab with add/remove functionality
- Add RepoCubit for state management
- Update ExtensionManageScreen with new tab layout

Closes #45
```

```
fix(search): prevent crash when query is empty

The search feature would crash if user submitted an empty query
due to null pointer exception in SearchCubit.

This fix adds validation before processing the query.

Fixes #78
```

```
docs(readme): update installation instructions

- Add prerequisites section
- Clarify sidecar setup steps
- Fix broken links to documentation
```

```
refactor(domain): simplify collection repository interface

Remove unused methods and consolidate query operations into
a single flexible method. This reduces code duplication and
makes the interface easier to understand.

BREAKING CHANGE: getById() method renamed to find()
```

```
chore(deps): upgrade flutter to 3.38.0

Update Flutter SDK and all compatible dependencies.
Run `flutter pub upgrade` after pulling this change.
```

#### Bad Commits

```
❌ BAD: No scope
feat: add new feature

❌ BAD: Invalid scope
feat(ui-changes): update button styles

❌ BAD: No type
(ui): change button color

❌ BAD: Vague subject
fix: bug fix

❌ BAD: Wrong tense
feat(search): added search feature

❌ BAD: Too long subject (>72 chars)
feat(presentation): implement comprehensive thread detail view with media gallery support

✅ GOOD: Split into multiple commits
feat(presentation): add thread detail screen
feat(ui): add media gallery component
```

---

## Pull Request Process

### Before Submitting PR

1. **Update your branch with latest upstream**
   ```bash
   git fetch upstream
   git rebase upstream/master
   ```

2. **Run all tests and checks**
   ```bash
   # Flutter
   flutter test --coverage
   flutter analyze

   # Python
   cd sidecar
   python -m pytest tests/ --cov=.
   black src/ --check
   flake8 src/
   ```

3. **Ensure coverage requirements**
   - Domain layer: 80%+ coverage (strictly enforced)
   - BLoC/Cubit: 80%+ coverage (strictly enforced)
   - Infrastructure/UI: Best effort (not strictly required)

4. **Update documentation**
   - Update README.md if user-facing changes
   - Update docs/DEVELOPMENT.md if developer workflow changes
   - Add/update code comments for complex logic

### PR Title and Description

**Title Format:**
```
<type>(<scope>): <short description>
```

**Description Template:**
```markdown
## Summary
Brief description of what this PR does

## Changes
- Change 1
- Change 2
- Change 3

## Testing
- [ ] Unit tests added/updated
- [ ] Manual testing completed
- [ ] Coverage requirements met (80%+ for domain/BLoC)

## Screenshots (if applicable)
[Add screenshots for UI changes]

## Breaking Changes
[List any breaking changes or write "None"]

## Related Issues
Closes #123
Relates to #456
```

### PR Checklist

Before requesting review, ensure:

- [ ] Code follows Clean Architecture principles
- [ ] Domain layer has no Flutter/infrastructure dependencies
- [ ] BLoC states use `freezed`
- [ ] Python code formatted with Black
- [ ] All tests pass (`flutter test`, `pytest`)
- [ ] Coverage meets requirements (80%+ for domain/BLoC)
- [ ] `flutter analyze` shows 0 errors
- [ ] `flake8` shows no critical errors
- [ ] Commit messages follow Angular convention
- [ ] All commits use proper scopes
- [ ] No secrets, IPs, or credentials committed
- [ ] Documentation updated if needed
- [ ] PR description is complete

---

## Code Review Guidelines

### For Reviewers

**Review Focus Areas:**

1. **Architecture Compliance**
   - Verify Clean Architecture principles
   - Check layer dependencies (domain → app ← presentation)
   - Ensure DDD patterns in domain layer

2. **Code Quality**
   - Readability and maintainability
   - Proper error handling
   - No code duplication
   - Clear naming conventions

3. **Testing**
   - Adequate test coverage (80%+ for domain/BLoC)
   - Tests actually test business logic
   - Edge cases covered

4. **Performance**
   - No unnecessary rebuilds in BLoC
   - Efficient database queries
   - Proper use of const constructors

5. **Security**
   - No hardcoded secrets or IPs
   - Proper input validation
   - Secure data handling

**Review Etiquette:**

- Be respectful and constructive
- Ask questions rather than making demands
- Explain the "why" behind suggestions
- Acknowledge good code and improvements
- Approve when changes meet standards

**Feedback Examples:**

```markdown
✅ GOOD
"This method could be simplified by using `firstWhere` instead of
manual iteration. It would make the code more readable. What do you think?"

❌ BAD
"This code is wrong. Use firstWhere."

✅ GOOD
"Great use of BlocSelector here! This should significantly reduce
unnecessary rebuilds."

❌ BAD
"Looks good."
```

### For Authors

**Responding to Feedback:**

- Address all comments (even if just acknowledging)
- Ask for clarification if unclear
- Push back politely if you disagree (with reasoning)
- Mark conversations as resolved after addressing
- Request re-review after making changes

**Handling Requests for Changes:**

```bash
# Make requested changes
git add .
git commit -m "refactor(ui): address review feedback

- Simplify button logic as suggested
- Add null check for edge case
- Extract magic numbers to constants"

git push origin feat/your-feature
```

---

## Additional Resources

### Internal Documentation
- [docs/DEVELOPMENT.md](./docs/DEVELOPMENT.md) - Development guide
- [docs/AGENTS.md](./docs/AGENTS.md) - AI development guidelines
- [sidecar/ARCHITECTURE.md](./sidecar/ARCHITECTURE.md) - Backend architecture

### Style Guides
- [Angular Commit Convention](https://github.com/angular/angular/blob/main/CONTRIBUTING.md#commit)
- [Effective Dart](https://dart.dev/guides/language/effective-dart)
- [PEP 8 – Style Guide for Python](https://peps.python.org/pep-0008/)
- [Google Python Style Guide](https://google.github.io/styleguide/pyguide.html)

### Tools
- [Black - Python Formatter](https://black.readthedocs.io/)
- [flutter_lints](https://pub.dev/packages/flutter_lints)
- [pre-commit](https://pre-commit.com/)

---

## Questions or Issues?

- **General Questions**: Open a [GitHub Discussion](https://github.com/twkevinzhang/news_hub/discussions)
- **Bug Reports**: Open a [GitHub Issue](https://github.com/twkevinzhang/news_hub/issues)
- **Security Issues**: Email twkevinzhang@gmail.com (do not open public issues)

---

**Thank you for contributing to News Hub! 🚀**
