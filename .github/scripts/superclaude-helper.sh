#!/bin/bash

# SuperClaude Helper Script for GitHub Actions
# This script provides utilities for enhanced Claude interactions

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_color() {
    color=$1
    message=$2
    echo -e "${color}${message}${NC}"
}

# Function to generate enhanced prompt for Claude based on issue type
generate_prompt() {
    local issue_number=$1
    local issue_title=$2
    local issue_body=$3
    local issue_type=${4:-"feature"}
    
    case "$issue_type" in
        feature)
            cat << EOF
## SuperClaude Framework - Feature Implementation
**Command**: /sc:implement
**Persona**: Developer (Implementation Focus)

## Context
You are implementing Issue #${issue_number}: ${issue_title}

## Requirements
${issue_body}

## Execution Instructions

### Phase 1: Analysis
- Understand the complete requirements
- Identify technical components needed
- Detect existing patterns in codebase

### Phase 2: Planning
- Design the architecture
- Plan file structure
- Consider error handling and edge cases

### Phase 3: Implementation
- Write production-ready code
- No placeholders or TODOs
- Complete all functionality
- Add appropriate error handling

### Phase 4: Validation
- Verify all requirements are met
- Ensure code quality
- Check for potential issues

## Quality Standards
- Clean, readable code
- Proper naming conventions
- Minimal but meaningful comments
- Follow existing project patterns
- Complete implementation (no partial features)

Remember: Build exactly what's requested, with high quality and completeness.
EOF
            ;;
            
        bug)
            cat << EOF
## SuperClaude Framework - Bug Fix
**Commands**: /sc:debug, /sc:fix, /sc:test
**Persona**: Debugger/QA Engineer

## Bug Report
Issue #${issue_number}: ${issue_title}

## Bug Description
${issue_body}

## Debugging Process

### Phase 1: Investigation (/sc:debug)
- Reproduce the issue if possible
- Analyze error patterns
- Identify root cause
- Check for related issues

### Phase 2: Fix Implementation (/sc:fix)
- Fix the root cause, not symptoms
- Ensure no regression
- Minimal, focused changes
- Add preventive measures

### Phase 3: Testing (/sc:test)
- Verify bug is resolved
- Test edge cases
- Check for side effects
- Add regression tests

## Quality Standards
- Clean, minimal fix
- No new issues introduced
- Tests to prevent recurrence
- Clear documentation of fix

Focus: Solve the problem effectively with minimal changes.
EOF
            ;;
            
        analysis)
            cat << EOF
## SuperClaude Framework - Feature Analysis & Decomposition
**Commands**: /sc:analyze, /sc:design, /sc:decompose
**Persona**: Architect

## Feature Request
Issue #${issue_number}: ${issue_title}

## Description
${issue_body}

## Analysis Process

### Phase 1: Deep Analysis (/sc:analyze)
- Understand all requirements
- Identify technical implications
- Analyze system impact
- Consider scalability

### Phase 2: Architecture Design (/sc:design)
- Design system components
- Define interfaces and APIs
- Plan data flow
- Consider integration points

### Phase 3: Task Decomposition (/sc:decompose)
- Break into small, implementable units
- Define clear acceptance criteria
- Identify dependencies
- Estimate complexity

## Deliverables
1. Architecture overview
2. Component breakdown
3. Sub-issue templates (markdown)
4. Implementation roadmap

Focus: Create actionable, well-defined sub-tasks that can be auto-implemented.
EOF
            ;;
            
        *)
            print_color "$YELLOW" "Unknown issue type: $issue_type, using default"
            generate_prompt "$issue_number" "$issue_title" "$issue_body" "feature"
            ;;
    esac
}

# Function to validate implementation
validate_implementation() {
    local branch=$1
    
    print_color "$BLUE" "🔍 Validating implementation..."
    
    # Check for common issues
    if grep -r "TODO\|FIXME\|XXX" --include="*.js" --include="*.ts" --include="*.py" --include="*.java" .; then
        print_color "$YELLOW" "⚠️ Warning: Found TODO/FIXME comments"
    fi
    
    if grep -r "throw new Error('Not implemented')" --include="*.js" --include="*.ts" .; then
        print_color "$RED" "❌ Error: Found unimplemented functions"
        return 1
    fi
    
    if grep -r "console.log\|print\(" --include="*.js" --include="*.ts" --include="*.py" . | grep -v "test\|spec"; then
        print_color "$YELLOW" "⚠️ Warning: Found debug statements"
    fi
    
    print_color "$GREEN" "✅ Basic validation passed"
    return 0
}

# Function to create PR body with SuperClaude context
create_pr_body() {
    local issue_number=$1
    local issue_title=$2
    
    cat << EOF
## 🤖 Automated Implementation via SuperClaude

### 📋 Issue Reference
- **Issue**: #${issue_number}
- **Title**: ${issue_title}

### 🛠️ Implementation Details

This PR was automatically generated using the SuperClaude framework with the \`/sc:implement\` command.

#### Development Approach
1. **Analysis**: Comprehensive requirement understanding
2. **Architecture**: Systematic design and planning
3. **Implementation**: Complete feature development
4. **Validation**: Quality and requirement verification

### ✅ Quality Checklist
- [ ] All issue requirements implemented
- [ ] Code follows project conventions
- [ ] No placeholder code or TODOs
- [ ] Error handling implemented
- [ ] Ready for review

### 🔍 Review Focus Areas
Please pay special attention to:
1. Requirement completeness
2. Code quality and maintainability
3. Integration with existing code
4. Performance implications
5. Security considerations

### 🏷️ Metadata
- **Framework**: SuperClaude
- **Command**: /sc:implement
- **Persona**: Developer
- **Model**: Claude Sonnet 4
- **Automation**: GitHub Actions

---
*This PR was automatically generated. Human review is required before merging.*
EOF
}

# Function to check if issue should be auto-developed
should_auto_develop() {
    local labels=$1
    
    # Check for auto-develop label
    if echo "$labels" | grep -q "auto-develop\|automated\|bot-friendly"; then
        return 0
    fi
    
    return 1
}

# Function to extract issue context
extract_issue_context() {
    local issue_body=$1
    
    # Extract code blocks if present
    echo "$issue_body" | sed -n '/```/,/```/p'
    
    # Extract requirements sections
    echo "$issue_body" | grep -i "requirement\|feature\|implement\|create\|build"
}

# Main execution
main() {
    local action=$1
    shift
    
    case "$action" in
        generate-prompt)
            generate_prompt "$@"
            ;;
        validate)
            validate_implementation "$@"
            ;;
        create-pr-body)
            create_pr_body "$@"
            ;;
        should-develop)
            should_auto_develop "$@"
            ;;
        extract-context)
            extract_issue_context "$@"
            ;;
        *)
            print_color "$RED" "Unknown action: $action"
            echo "Usage: $0 {generate-prompt|validate|create-pr-body|should-develop|extract-context} [args...]"
            exit 1
            ;;
    esac
}

# Execute main function if script is run directly
if [ "${BASH_SOURCE[0]}" = "${0}" ]; then
    main "$@"
fi