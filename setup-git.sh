#!/bin/bash

# Git Repository Setup Script for AMD FSR Tool
# Run this script to initialize the repository for GitHub upload

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

print_info() {
    echo -e "${BLUE}ℹ${NC} $1"
}

# Check if we're in the right directory
if [[ ! -f "amd-fsr" ]]; then
    print_error "amd-fsr file not found. Please run this script from the amd-fsr-tool directory."
    exit 1
fi

print_info "🚀 Setting up AMD FSR Tool repository for GitHub..."
echo

# Initialize git repository if not already done
if [[ ! -d ".git" ]]; then
    print_info "Initializing Git repository..."
    git init
    print_success "Git repository initialized"
else
    print_info "Git repository already exists"
fi

# Create .gitignore file
print_info "Creating .gitignore file..."
cat > .gitignore << 'EOF'
# User-specific files
*.swp
*.swo
*~

# OS-specific files
.DS_Store
Thumbs.db

# IDE files
.vscode/
.idea/
*.sublime-*

# Build artifacts
*.o
*.so
*.a

# Log files
*.log

# Temporary files
/tmp/
*.tmp

# Configuration files (user-specific)
.config/
*.conf.local

# Backup files
*.backup
*.bak

# Test files
test_*
*_test.sh

# Documentation build
docs/_build/
*.pdf

# Python cache (for web interface)
__pycache__/
*.pyc
*.pyo

# Node.js (if web interface uses Node)
node_modules/
npm-debug.log*

# Package files
*.deb
*.rpm
*.tar.gz
*.zip

# Development files
.dev/
debug/
EOF
print_success ".gitignore created"

# Make scripts executable
print_info "Setting executable permissions..."
chmod +x amd-fsr
chmod +x install.sh
chmod +x setup-git.sh
print_success "Executable permissions set"

# Add all files to git
print_info "Adding files to Git..."
git add .
print_success "Files added to Git staging area"

# Create initial commit
print_info "Creating initial commit..."
git commit -m "🎉 Initial release of AMD FSR Tool v4.0.0

✨ Features:
- Complete FSR management for AMD GPUs
- Multi-launcher support (Steam, Lutris, Heroic)
- Advanced performance monitoring and benchmarking
- Web interface for browser-based management
- Automated optimization and tuning
- System-wide FSR optimizations
- Comprehensive backup and restore functionality

🎮 Supports:
- All major game launchers
- 26+ advanced features
- Professional-grade configuration management
- Cross-distribution Linux compatibility

📊 Thoroughly tested and production-ready!"

print_success "Initial commit created"

echo
print_info "📋 Next steps to upload to GitHub:"
echo
echo "1. Create a new repository on GitHub:"
echo "   - Go to https://github.com/new"
echo "   - Repository name: amd-fsr-tool"
echo "   - Description: Advanced FSR management tool for AMD GPUs on Linux"
echo "   - Make it public"
echo "   - DO NOT initialize with README (we already have one)"
echo
echo "2. Add your GitHub repository as origin:"
echo "   git remote add origin https://github.com/YOURUSERNAME/amd-fsr-tool.git"
echo
echo "3. Push to GitHub:"
echo "   git branch -M main"
echo "   git push -u origin main"
echo
echo "4. After uploading, consider:"
echo "   - Add topics/tags: amd, fsr, gaming, linux, performance"
echo "   - Enable GitHub Pages for documentation"
echo "   - Set up GitHub Actions for automated testing"
echo "   - Create GitHub release for v4.0.0"
echo
print_success "Repository is ready for GitHub! 🚀"
echo
print_warning "Don't forget to update the GitHub URLs in README.md and other files"
print_info "Replace 'yourusername' with your actual GitHub username"

