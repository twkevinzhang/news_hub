# Tests

This directory contains tests for the Sidecar service.

## Running Tests

Run all tests:
```bash
python -m pytest tests/
```

Run specific test file:
```bash
python -m pytest tests/unit/test_extension_entity.py
```

Run with coverage:
```bash
python -m pytest --cov=. --cov-report=html tests/
```

## Test Structure

- `unit/` - Unit tests for individual components
  - Test entities, value objects, use cases in isolation
  - Use mocks for dependencies
  - Fast execution

- `integration/` - Integration tests
  - Test interactions between components
  - May use real file system or test databases
  - Slower execution

## Writing Tests

### Unit Tests
- Test one component at a time
- Mock all dependencies
- Focus on business logic
- Should be fast (<1ms per test)

### Integration Tests
- Test component interactions
- May use test doubles or real implementations
- Test edge cases and error scenarios
- Can be slower but should still be quick

## Test Coverage

Aim for:
- 80%+ coverage for domain layer
- 70%+ coverage for application layer
- 60%+ coverage for infrastructure layer
- 50%+ coverage for presentation layer
