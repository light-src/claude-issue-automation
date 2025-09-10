# 🤖 Claude Code GitHub Issue Automation Setup

This repository is configured to automatically develop solutions for GitHub issues using Claude Code Action with the SuperClaude framework.

## 📋 Overview

This automation system handles three types of issues:

### 1. 🚀 Feature Implementation (`type:feature`)
- **Persona**: Developer
- **Command**: `/sc:implement`
- **Action**: Implements complete features and creates PR

### 2. 🐛 Bug Fix (`type:bug`)
- **Persona**: Debugger/QA Engineer
- **Commands**: `/sc:debug`, `/sc:fix`, `/sc:test`
- **Action**: Analyzes root cause, fixes bug, adds tests, creates PR

### 3. 🏗️ Feature Analysis (`type:needs-analysis`)
- **Persona**: Architect
- **Commands**: `/sc:analyze`, `/sc:design`, `/sc:decompose`
- **Action**: Analyzes complex features and creates sub-issues

## 🚀 Quick Setup

### Prerequisites
- GitHub repository with admin access
- Anthropic API key from [console.anthropic.com](https://console.anthropic.com)
- Claude Code CLI (optional, for easier setup)

### Method 1: Using Claude Code CLI (Recommended)

1. Install Claude Code CLI:
```bash
npm install -g @anthropic/claude-code
```

2. Run the setup command:
```bash
claude /install-github-app
```

3. Follow the prompts to configure your repository

### Method 2: Manual Setup

1. **Add Anthropic API Key**
   - Go to your repository Settings
   - Navigate to `Secrets and variables` → `Actions`
   - Add a new secret named `ANTHROPIC_API_KEY`
   - Paste your Anthropic API key

2. **Workflow is Ready**
   - The workflow file is already in `.github/workflows/claude-issue-automation.yml`
   - No additional setup needed!

## 🎯 Usage

### Automatic Development by Type

Issues are automatically processed based on their type label:

1. **Feature Implementation** (`type:feature`)
   - Triggered when issue is created or labeled with `type:feature`
   - Uses Developer persona with `/sc:implement`
   - Creates feature branch and PR

2. **Bug Fix** (`type:bug`)
   - Triggered when issue is created or labeled with `type:bug`
   - Uses Debugger/QA persona with `/sc:debug` and `/sc:fix`
   - Creates fix branch and PR

3. **Feature Analysis** (`type:needs-analysis`)
   - Triggered when issue is created or labeled with `type:needs-analysis`
   - Uses Architect persona with `/sc:analyze` and `/sc:design`
   - Creates analysis report and sub-issues

### Manual Triggers

Comment on any issue to trigger specific actions:
- `@claude implement` - Trigger feature implementation
- `@claude fix` - Trigger bug fix
- `@claude analyze` - Trigger feature analysis

### Issue Format

For best results, structure your issues like this:

```markdown
## Description
Clear description of what needs to be built

## Requirements
- Requirement 1
- Requirement 2
- Requirement 3

## Technical Details (Optional)
Any specific technical requirements or constraints

## Acceptance Criteria
- [ ] Criteria 1
- [ ] Criteria 2
```

### Example Issues

#### 1. Feature Implementation (`type:feature`)
```markdown
Title: Add user authentication
Labels: type:feature

## Description
Implement a basic user authentication system

## Requirements
- User registration with email and password
- Login functionality
- Password hashing
- Session management
- Logout functionality

## Technical Stack
- Node.js/Express
- JWT for sessions
```

#### 2. Bug Fix (`type:bug`)
```markdown
Title: Fix navigation menu on mobile
Labels: type:bug

## Bug Description
The navigation menu doesn't work properly on mobile devices

## Steps to Reproduce
1. Open site on mobile
2. Click hamburger menu
3. Menu doesn't expand

## Expected Behavior
Menu should expand and show navigation items

## Actual Behavior
Menu remains closed
```

#### 3. Feature Analysis (`type:needs-analysis`)
```markdown
Title: E-commerce checkout system
Labels: type:needs-analysis

## Feature Overview
Build a complete e-commerce checkout system

## High-Level Requirements
- Shopping cart management
- Multiple payment methods
- Order processing
- Inventory management
- Email notifications

## Technical Considerations
- Must integrate with existing user system
- Support for international payments
- Real-time inventory updates
```

## 🛠️ Configuration

### Customize Claude's Behavior

Edit `CLAUDE.md` to customize:
- Coding standards
- Development philosophy
- Framework preferences
- Testing requirements

### Workflow Configuration

Edit `.github/workflows/claude-issue-automation.yml` to:
- Change trigger conditions
- Modify Claude's prompt
- Adjust model settings
- Add additional steps

### SuperClaude Commands

The workflow uses `/sc:implement` by default. Available commands:
- `/sc:implement` - Systematic feature implementation
- `/sc:analyze` - Deep code analysis
- `/sc:test` - Testing implementation
- `/sc:refactor` - Code improvement

## 📊 Workflow Process

```mermaid
graph TD
    A[Issue Created] --> B{Check Label}
    B -->|type:feature| C[Developer Persona]
    B -->|type:bug| D[Debugger Persona]
    B -->|type:needs-analysis| E[Architect Persona]
    
    C --> F[/sc:implement]
    D --> G[/sc:debug + /sc:fix]
    E --> H[/sc:analyze + /sc:design]
    
    F --> I[Create Feature Branch]
    G --> J[Create Fix Branch]
    H --> K[Generate Sub-Issues]
    
    I --> L[Implement Feature]
    J --> M[Fix Bug + Add Tests]
    K --> N[Comment Analysis]
    
    L --> O[Create PR]
    M --> O[Create PR]
    N --> P[Sub-Issues Created]
```

## 🔒 Security

- API keys are stored as GitHub secrets
- Claude only has access to repository content
- All changes go through PR review process
- No direct commits to main branch

## 🧪 Testing the Setup

1. Create a test issue:
```markdown
Title: Test - Add hello world endpoint

Create a simple API endpoint that returns "Hello, World!"
```

2. Wait for the workflow to run (check Actions tab)

3. Review the created pull request

## 📝 Best Practices

### Writing Good Issues
- Be specific about requirements
- Include acceptance criteria
- Provide context and examples
- Specify technical constraints

### Review Process
- Always review generated code
- Test the implementation
- Check for security issues
- Verify requirements are met

### Labels
Required labels for automation:
- `type:feature` - Triggers feature implementation
- `type:bug` - Triggers bug fix workflow
- `type:needs-analysis` - Triggers analysis and decomposition

Additional labels:
- `automated-pr` - Added to generated PRs
- `needs-review` - PRs requiring human review
- `bug-fix` - Added to bug fix PRs
- `priority:high` - High priority issues

## 🚨 Troubleshooting

### Workflow Not Running
- Check if `ANTHROPIC_API_KEY` secret is set
- Verify workflow file is in correct location
- Check Actions tab for error messages

### Poor Implementation Quality
- Improve issue description clarity
- Add more specific requirements
- Update `CLAUDE.md` configuration

### API Limits
- Monitor API usage in Anthropic console
- Consider using more efficient models
- Reduce `max-turns` in workflow

## 📚 Additional Resources

- [Claude Code Action Documentation](https://github.com/anthropics/claude-code-action)
- [SuperClaude Framework](https://github.com/SuperClaude-Org/SuperClaude_Framework)
- [Anthropic API Documentation](https://docs.anthropic.com)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)

## 🤝 Support

- Create an issue in this repository
- Join [Claude Developers Discord](https://discord.com/invite/anthropic)
- Check [Claude Code Action Issues](https://github.com/anthropics/claude-code-action/issues)

## 📄 License

This automation setup is provided as-is. Make sure to review all generated code before merging.

---

*Powered by Claude Code Action and the SuperClaude Framework* 🚀