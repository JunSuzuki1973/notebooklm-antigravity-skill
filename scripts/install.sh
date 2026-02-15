#!/bin/bash

# NotebookLM MCP CLI Installation Script for Antigravity
# This script installs notebooklm-mcp-cli using uv (recommended) or pip

set -e

echo "========================================="
echo "NotebookLM MCP CLI Installation Script"
echo "========================================="
echo ""

# Check for uv first (recommended)
if command -v uv &> /dev/null; then
    echo "✓ Found uv (recommended installer)"
    echo "Installing notebooklm-mcp-cli using uv..."
    uv tool install notebooklm-mcp-cli
    echo "✓ Installation complete using uv"
    echo ""
    echo "To verify installation:"
    echo "  uv tool list | grep notebooklm"
    echo ""
    echo "Usage:"
    echo "  nlm --help"
    echo "  nlm login"
    exit 0
fi

# Fallback to pipx
if command -v pipx &> /dev/null; then
    echo "✓ Found pipx (fallback installer)"
    echo "Installing notebooklm-mcp-cli using pipx..."
    pipx install notebooklm-mcp-cli
    echo "✓ Installation complete using pipx"
    echo ""
    echo "Usage:"
    echo "  nlm --help"
    echo "  nlm login"
    exit 0
fi

# Fallback to pip
if command -v pip &> /dev/null; then
    echo "✓ Found pip (fallback installer)"
    echo "Installing notebooklm-mcp-cli using pip..."
    pip install notebooklm-mcp-cli
    echo "✓ Installation complete using pip"
    echo ""
    echo "Usage:"
    echo "  nlm --help"
    echo "  nlm login"
    exit 0
fi

# No Python package manager found
echo "❌ Error: No suitable package manager found."
echo ""
echo "Please install one of the following:"
echo "  - uv (recommended): https://github.com/astral-sh/uv"
echo "  - pipx: https://pipx.pypa.io/"
echo "  - pip: Usually comes with Python"
echo ""
echo "For uv installation:"
echo "  curl -LsSf https://astral.sh/uv/install.sh | sh"
echo ""
exit 1
