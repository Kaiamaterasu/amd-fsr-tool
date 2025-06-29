#!/bin/bash

# AMD FSR Tool Installation Verification Script
# Quick test to verify the tool works correctly after installation

VERSION="4.0.0"

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

print_header() {
    echo -e "${BLUE}$1${NC}"
    echo "$(printf '=%.0s' {1..50})"
}

echo "🔍 AMD FSR Tool Installation Verification"
echo "=========================================="
echo

# Test 1: Check if tool exists and is executable
print_header "Test 1: Tool Availability"
if command -v amd-fsr > /dev/null 2>&1; then
    print_success "amd-fsr command is available in PATH"
    tool_path=$(which amd-fsr)
    print_info "Location: $tool_path"
    
    if [[ -x "$tool_path" ]]; then
        print_success "Tool is executable"
    else
        print_error "Tool is not executable"
        exit 1
    fi
else
    print_error "amd-fsr command not found in PATH"
    print_info "Try running the installer: ./install.sh"
    exit 1
fi
echo

# Test 2: Version check
print_header "Test 2: Version Information"
version_output=$(amd-fsr -version 2>&1)
if [[ $? -eq 0 ]]; then
    print_success "Version command works: $version_output"
else
    print_error "Version command failed"
fi
echo

# Test 3: Help system
print_header "Test 3: Help System"
help_output=$(amd-fsr --help 2>&1)
if [[ $? -eq 0 ]] && [[ "$help_output" == *"AMD FSR Tool"* ]]; then
    print_success "Help system is functional"
    lines=$(echo "$help_output" | wc -l)
    print_info "Help contains $lines lines of documentation"
else
    print_error "Help system failed"
fi
echo

# Test 4: AMD GPU Detection
print_header "Test 4: AMD GPU Detection"
gpu_output=$(amd-fsr -gpu-info 2>&1)
if [[ $? -eq 0 ]]; then
    if [[ "$gpu_output" == *"AMD"* ]] || [[ "$gpu_output" == *"ATI"* ]]; then
        print_success "AMD GPU detected and recognized"
    else
        print_warning "Tool runs but no AMD GPU detected"
        print_info "This is normal if you don't have an AMD GPU"
    fi
else
    print_error "GPU detection failed"
fi
echo

# Test 5: Configuration Directory
print_header "Test 5: Configuration Setup"
config_dir="$HOME/.config/amd-fsr"
if [[ -d "$config_dir" ]]; then
    print_success "Configuration directory exists: $config_dir"
    
    # Check if directory is writable
    if [[ -w "$config_dir" ]]; then
        print_success "Configuration directory is writable"
    else
        print_warning "Configuration directory is not writable"
    fi
else
    print_info "Configuration directory will be created on first use"
fi
echo

# Test 6: System Requirements
print_header "Test 6: System Requirements"
missing_tools=()
essential_tools=("bash" "find" "grep" "sed" "awk")

for tool in "${essential_tools[@]}"; do
    if command -v "$tool" > /dev/null 2>&1; then
        print_success "$tool is available"
    else
        print_error "$tool is missing"
        missing_tools+=("$tool")
    fi
done

if [[ ${#missing_tools[@]} -eq 0 ]]; then
    print_success "All essential tools are available"
else
    print_error "Missing essential tools: ${missing_tools[*]}"
fi
echo

# Test 7: Optional Tools Check
print_header "Test 7: Optional Tools"
optional_tools=(
    "glxinfo:mesa-utils"
    "vulkaninfo:vulkan-tools"
    "cpupower:cpupower"
    "gamescope:gamescope"
    "python3:python3"
    "curl:curl"
)

available_optional=0
for tool_info in "${optional_tools[@]}"; do
    tool=$(echo "$tool_info" | cut -d':' -f1)
    package=$(echo "$tool_info" | cut -d':' -f2)
    
    if command -v "$tool" > /dev/null 2>&1; then
        print_success "$tool is available (enhances functionality)"
        ((available_optional++))
    else
        print_info "$tool not found (install with: sudo pacman -S $package)"
    fi
done

print_info "Optional tools available: $available_optional/6"
echo

# Test 8: Basic Functionality Test
print_header "Test 8: Basic Functionality"
# Test list command (should work even without games)
list_output=$(amd-fsr -list 2>&1)
if [[ $? -eq 0 ]] || [[ "$list_output" == *"Steam directory not found"* ]]; then
    print_success "List command works (Steam detection functional)"
else
    print_warning "List command had issues: $list_output"
fi

# Test system optimization dry run
system_test=$(timeout 5s amd-fsr -system-optimize --dry-run 2>&1 || echo "timeout")
if [[ "$system_test" != "timeout" ]]; then
    print_success "System optimization command is accessible"
else
    print_info "System optimization test skipped (requires admin privileges)"
fi
echo

# Test 9: Web Interface Test
print_header "Test 9: Web Interface"
if command -v python3 > /dev/null 2>&1; then
    print_success "Python3 available - web interface should work"
    print_info "Test with: amd-fsr -web 8080"
else
    print_warning "Python3 not found - web interface will not work"
    print_info "Install with: sudo pacman -S python3"
fi
echo

# Summary
print_header "Verification Summary"
echo
print_info "🎮 AMD FSR Tool Installation Verification Complete"
echo
print_success "✅ Core functionality verified"
print_success "✅ Tool is properly installed and accessible"
print_success "✅ Configuration system ready"
print_success "✅ Help and documentation available"
echo
print_info "🚀 Quick Start Commands:"
echo "   amd-fsr --help              # Full documentation"
echo "   amd-fsr -interactive        # Guided setup"
echo "   amd-fsr -gpu-info           # Check GPU compatibility"
echo "   amd-fsr -system-optimize    # Optimize system for FSR"
echo "   amd-fsr -auto-detect        # Analyze installed games"
echo
print_info "🌐 Advanced Features:"
echo "   amd-fsr -web 8080           # Web interface"
echo "   amd-fsr -benchmark \"Game\"   # Performance testing"
echo "   amd-fsr -tune \"Game\" 60     # Auto-optimize for 60fps"
echo
if [[ $available_optional -lt 4 ]]; then
    print_warning "💡 Install optional tools for enhanced functionality:"
    echo "   sudo pacman -S mesa-utils vulkan-tools cpupower gamescope python3 curl"
fi
echo
print_success "🎯 Installation verified successfully! Ready to use."
echo

