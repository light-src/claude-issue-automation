# Claude Code Configuration

This file configures Claude's behavior when working on this repository through GitHub Actions and direct interactions.

## Development Philosophy

### Core Principles
- **Implementation First**: Focus on building working solutions, not planning documents
- **Complete Features**: No placeholders, TODOs, or mock implementations
- **Clean Code**: Follow existing patterns, use clear naming, minimal comments
- **Systematic Approach**: Use `/sc:implement` methodology for structured development

## SuperClaude Framework Integration

### Commands Available
- `/sc:implement`: Systematic feature implementation with proper architecture
- `/sc:analyze`: Deep code analysis and understanding
- `/sc:test`: Comprehensive testing approach
- `/sc:refactor`: Code improvement and optimization

### Implementation Workflow

When implementing features (especially from GitHub issues):

1. **Understand Requirements**
   - Read the issue completely
   - Identify core functionality needed
   - Clarify any ambiguities

2. **Plan Architecture**
   - Choose appropriate design patterns
   - Structure components logically
   - Consider scalability and maintainability

3. **Implement Systematically**
   - Start with core functionality
   - Add error handling
   - Implement edge cases
   - Ensure complete feature delivery

4. **Validate Solution**
   - Test functionality
   - Verify requirements are met
   - Check code quality

## Coding Standards

### General Rules
- Follow existing code style and conventions
- Use meaningful variable and function names
- Keep functions focused and small
- Handle errors appropriately
- Write self-documenting code

### JavaScript/TypeScript
```javascript
// Preferred naming conventions
const getUserData = async (userId) => { /* ... */ }  // Functions: camelCase
const MAX_RETRIES = 3;                               // Constants: UPPER_SNAKE_CASE
class UserService { /* ... */ }                      // Classes: PascalCase
```

### Python
```python
# Preferred naming conventions
def get_user_data(user_id):  # Functions: snake_case
    MAX_RETRIES = 3          # Constants: UPPER_SNAKE_CASE
    
class UserService:           # Classes: PascalCase
    pass
```

## Git Commit Messages

Use conventional commits format:
- `feat:` New feature
- `fix:` Bug fix
- `docs:` Documentation changes
- `style:` Code style changes
- `refactor:` Code refactoring
- `test:` Test additions or changes
- `chore:` Maintenance tasks

## Issue Development Guidelines

When developing from GitHub issues:

1. **Scope Management**
   - Build exactly what's requested
   - Don't add extra features
   - Focus on the specific problem

2. **Quality Requirements**
   - Production-ready code
   - Proper error handling
   - Clean, maintainable implementation
   - No technical debt

3. **Communication**
   - Clear PR descriptions
   - Link to original issue
   - Explain implementation decisions

## Testing Approach

- Write tests for critical functionality
- Focus on behavior, not implementation
- Test edge cases and error conditions
- Maintain test clarity and readability

## Security Considerations

- Never hardcode credentials
- Validate all inputs
- Use secure defaults
- Follow OWASP guidelines
- Implement proper authentication/authorization

## Performance Guidelines

- Optimize for readability first
- Profile before optimizing
- Use efficient algorithms
- Consider memory usage
- Implement caching where appropriate

## Documentation

- Document complex algorithms
- Explain non-obvious decisions
- Keep README up to date
- Use JSDoc/docstrings for public APIs
- Provide usage examples

## Review Checklist

Before completing any implementation:
- [ ] All requirements met
- [ ] Code follows standards
- [ ] Error handling in place
- [ ] Tests written (if applicable)
- [ ] No security vulnerabilities
- [ ] Performance acceptable
- [ ] Documentation updated

---

*This configuration guides Claude's behavior for consistent, high-quality development.*