#!/bin/bash

# AMD FSR Tool Installer
# Installs the FSR tool to system PATH for easy access

VERSION="4.0.0"
TOOL_NAME="amd-fsr"
INSTALL_DIR="/usr/local/bin"
CONFIG_DIR="$HOME/.config/amd-fsr"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
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

# Function to check if running as root
check_root() {
    if [[ $EUID -eq 0 ]]; then
        print_error "Do not run this installer as root!"
        print_info "The tool will ask for sudo permissions when needed"
        exit 1
    fi
}

# Function to check system requirements
check_requirements() {
    print_info "🔍 Checking system requirements..."
    
    # Check for AMD GPU
    if ! lspci | grep -i "amd\|radeon" > /dev/null 2>&1; then
        print_warning "No AMD GPU detected. Tool will still install but may not function optimally."
    else
        print_success "AMD GPU detected"
    fi
    
    # Check for required tools
    local missing_tools=()
    
    # Essential tools
    for tool in bash find grep sed awk; do
        if ! command -v "$tool" > /dev/null 2>&1; then
            missing_tools+=("$tool")
        fi
    done
    
    # Optional but recommended tools
    local optional_tools=(
        "glxinfo:mesa-utils"
        "vulkaninfo:vulkan-tools" 
        "cpupower:cpupower"
        "gamescope:gamescope"
        "python3:python3"
        "curl:curl"
    )
    
    for tool_info in "${optional_tools[@]}"; do
        local tool=$(echo "$tool_info" | cut -d':' -f1)
        local package=$(echo "$tool_info" | cut -d':' -f2)
        
        if ! command -v "$tool" > /dev/null 2>&1; then
            print_warning "Optional tool '$tool' not found (install with: sudo pacman -S $package)"
        else
            print_success "$tool available"
        fi
    done
    
    if [[ ${#missing_tools[@]} -gt 0 ]]; then
        print_error "Missing essential tools: ${missing_tools[*]}"
        print_info "Install with: sudo pacman -S ${missing_tools[*]}"
        exit 1
    fi
    
    print_success "System requirements check passed"
}

# Function to install the tool
install_tool() {
    print_info "🚀 Installing AMD FSR Tool v$VERSION..."
    
    # Create config directory
    if [[ ! -d "$CONFIG_DIR" ]]; then
        mkdir -p "$CONFIG_DIR"
        print_success "Created config directory: $CONFIG_DIR"
    fi
    
    # Copy tool to system PATH
    if sudo cp "$TOOL_NAME" "$INSTALL_DIR/$TOOL_NAME"; then
        print_success "Tool installed to $INSTALL_DIR/$TOOL_NAME"
    else
        print_error "Failed to install tool to system PATH"
        print_info "Trying local installation..."
        
        # Fallback to local installation
        local local_bin="$HOME/.local/bin"
        mkdir -p "$local_bin"
        
        if cp "$TOOL_NAME" "$local_bin/$TOOL_NAME"; then
            print_success "Tool installed to $local_bin/$TOOL_NAME"
            
            # Add to PATH if not already there
            if [[ ":$PATH:" != *":$local_bin:"* ]]; then
                echo "export PATH=\"\$PATH:$local_bin\"" >> "$HOME/.bashrc"
                print_info "Added $local_bin to PATH in ~/.bashrc"
                print_warning "Please restart your shell or run: source ~/.bashrc"
            fi
        else
            print_error "Failed to install tool"
            exit 1
        fi
    fi
    
    # Make executable
    if sudo chmod +x "$INSTALL_DIR/$TOOL_NAME" 2>/dev/null || chmod +x "$HOME/.local/bin/$TOOL_NAME" 2>/dev/null; then
        print_success "Tool made executable"
    fi
    
    # Create desktop entry (optional)
    create_desktop_entry
    
    print_success "✅ Installation completed successfully!"
    echo
    print_info "🎮 You can now use the tool with: $TOOL_NAME"
    print_info "📖 Run '$TOOL_NAME --help' for usage information"
    print_info "🚀 Quick start: '$TOOL_NAME -interactive'"
}

# Function to create desktop entry
create_desktop_entry() {
    local desktop_dir="$HOME/.local/share/applications"
    local desktop_file="$desktop_dir/amd-fsr-tool.desktop"
    
    mkdir -p "$desktop_dir"
    
    cat > "$desktop_file" << EOF
[Desktop Entry]
Name=AMD FSR Tool
Comment=Advanced FSR management for AMD GPUs
Exec=x-terminal-emulator -e 'amd-fsr -interactive; read -p "Press Enter to exit..."'
Icon=applications-games
Terminal=false
Type=Application
Categories=Game;System;
Keywords=AMD;FSR;Gaming;Graphics;
StartupNotify=true
EOF
    
    if [[ -f "$desktop_file" ]]; then
        chmod +x "$desktop_file"
        print_success "Desktop entry created"
    fi
}

# Function to show post-install information
show_post_install_info() {
    echo
    print_info "🎯 Getting Started:"
    echo "   1. Run system optimization: $TOOL_NAME -system-optimize"
    echo "   2. Auto-detect your games: $TOOL_NAME -auto-detect"
    echo "   3. Enable FSR for a game: $TOOL_NAME -g \"Game Name\" -enable"
    echo "   4. Use interactive mode: $TOOL_NAME -interactive"
    echo
    print_info "📚 Advanced Features:"
    echo "   • Web interface: $TOOL_NAME -web 8080"
    echo "   • Performance monitoring: $TOOL_NAME -monitor \"Game\" 120"
    echo "   • Benchmarking: $TOOL_NAME -benchmark \"Game\""
    echo "   • Auto-tuning: $TOOL_NAME -tune \"Game\" 60"
    echo
    print_info "🔧 Configuration files are stored in: $CONFIG_DIR"
    print_info "📖 Full documentation: https://github.com/yourusername/amd-fsr-tool"
}

# Main installation function
main() {
    echo "🚀 AMD FSR Tool Installer v$VERSION"
    echo "======================================"
    echo
    
    # Check if tool file exists
    if [[ ! -f "$TOOL_NAME" ]]; then
        print_error "Tool file '$TOOL_NAME' not found in current directory"
        print_info "Please run this installer from the amd-fsr-tool directory"
        exit 1
    fi
    
    check_root
    check_requirements
    
    echo
    read -p "📥 Proceed with installation? (y/N): " -n 1 -r
    echo
    
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        install_tool
        show_post_install_info
    else
        print_info "Installation cancelled"
        exit 0
    fi
}

# Run main function
main "$@"

