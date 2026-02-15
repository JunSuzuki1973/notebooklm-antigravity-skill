---
name: notebooklm
description: Interact with Google NotebookLM via CLI (nlm). Use this when the user wants to manage notebooks, add sources, generate audio podcasts, research topics, query notebooks, or share content.
---

# NotebookLM Antigravity Skill

This skill provides seamless integration with Google NotebookLM through the `nlm` command-line interface. It enables you to create notebooks, add sources from URLs, text, files, or Google Drive, generate AI-powered audio podcasts, perform web research, and query your notebooks with natural language.

## Goal

To enable Google NotebookLM functionality within Antigravity for research, content generation, and knowledge management tasks.

## Prerequisites

1. **Install the tool:** Run the installation script before first use
2. **Authenticate:** You must authenticate with your Google account before using NotebookLM features

## Instructions

### Step 1: Installation (First Time Only)

Before using NotebookLM, run the installation script to set up the `nlm` CLI:

```bash
bash scripts/install.sh
```

This will install `notebooklm-mcp-cli` using `uv` (recommended) or `pip` as a fallback.

After installation, verify it's available:
```bash
nlm --version
```

### Step 2: Authentication

You must authenticate with your Google account before using NotebookLM:

**Auto Mode (Recommended):**
```bash
nlm login
```
This launches a dedicated Chrome profile. Log in to Google, and cookies will be extracted automatically.

**Check Authentication Status:**
```bash
nlm login --check
```

**Use Multiple Profiles:**
```bash
nlm login --profile work
nlm login --profile personal
```

### Step 3: Common Operations

Once authenticated, you can use any of these commands directly in the terminal:

#### Notebook Management
```bash
# List all notebooks
nlm notebook list

# Create a new notebook
nlm notebook create "Research Project"

# Get notebook details
nlm notebook get <notebook-id>
```

#### Add Sources
```bash
# Add URL source
nlm source add <notebook-id> --url "https://example.com/article"

# Add YouTube video
nlm source add <notebook-id> --url "https://youtube.com/watch?v=xxx"

# Add text directly
nlm source add <notebook-id> --text "Your text content here"

# Add local file
nlm source add <notebook-id> --file /path/to/file.pdf

# Import from Google Drive
nlm source add <notebook-id> --drive "document-id"
```

#### Query Notebooks (AI Chat)
```bash
# Ask questions about your notebook
nlm notebook query <notebook-id> "What are the key findings?"

# Generate summary
nlm notebook query <notebook-id> "Summarize all sources"
```

#### Generate Audio Podcasts
```bash
# Generate audio overview
nlm audio create <notebook-id> --confirm

# Download generated audio
nlm download audio <notebook-id> <artifact-id>

# Download as MP3
nlm download audio <notebook-id> <artifact-id> --format mp3
```

#### Generate Other Studio Content
```bash
# Generate video explainer
nlm studio create <notebook-id> --type video --style classic

# Generate briefing document
nlm studio create <notebook-id> --type briefing

# Generate flashcards
nlm studio create <notebook-id> --type flashcard --difficulty medium

# Generate infographic
nlm studio create <notebook-id> --type infographic --orientation landscape

# Generate mind map
nlm studio create <notebook-id> --type mindmap

# Generate slide deck
nlm studio create <notebook-id> --type slideshow
```

#### Web Research
```bash
# Start web research on a topic
nlm research start "enterprise AI ROI metrics"

# Deep research with auto-import
nlm research start "cloud marketplace trends" --deep --import
```

#### Share Notebooks
```bash
# Make notebook public
nlm share public <notebook-id>

# Disable public access
nlm share disable <notebook-id>

# Invite collaborators
nlm share invite <notebook-id> --email user@example.com --role editor
```

#### Sync Google Drive Sources
```bash
# Sync all Drive sources
nlm source sync drive <notebook-id>

# Check which sources need sync
nlm source list <notebook-id>
```

### Step 4: Check Studio Content Status

After generating studio content (audio, video, etc.), check the status:

```bash
# List all studio artifacts
nlm studio list <notebook-id>

# Get status of specific artifact
nlm studio status <notebook-id> <artifact-id>
```

Poll the status until it shows "completed", then download using the download command.

## Examples

**Example 1: Research and Generate Podcast**
```bash
# Create notebook for research
NOTEBOOK_ID=$(nlm notebook create "AI Research 2026" | grep -oP 'id: \K\S+')

# Add several sources
nlm source add "$NOTEBOOK_ID" --url "https://arxiv.org/abs/2301.07041"
nlm source add "$NOTEBOOK_ID" --url "https://example.com/ai-report"

# Generate audio podcast
nlm audio create "$NOTEBOOK_ID" --confirm

# Wait and download
nlm download audio "$NOTEBOOK_ID" <artifact-id>
```

**Example 2: Quick URL Analysis**
```bash
# Create notebook, add URL, and query in one flow
NOTEBOOK_ID=$(nlm notebook create "Quick Analysis" | grep -oP 'id: \K\S+')
nlm source add "$NOTEBOOK_ID" --url "https://example.com/article"
nlm notebook query "$NOTEBOOK_ID" "Summarize the main arguments in 3 bullet points"
```

**Example 3: File-Based Research**
```bash
# Add local PDF and query
nlm notebook create "Document Review"
nlm source add <notebook-id> --file /path/to/report.pdf
nlm notebook query <notebook-id> "What are the key recommendations?"
```

**Example 4: Web Research with Auto-Import**
```bash
# Research and automatically import top sources
nlm research start "AI agents productivity metrics" --deep --import
# This will create a notebook and import the best sources found
```

## Constraints

**IMPORTANT:**
- Authentication is **required** before any NotebookLM operations
- Use `nlm login --check` to verify authentication status
- Free tier accounts have rate limits (~50 queries/day)
- Cookie-based auth expires every 2-4 weeks; re-run `nlm login` when prompted
- Always check studio content status before downloading (generation takes time)
- Be mindful of context limits when querying large notebooks

**Safety:**
- This tool uses undocumented internal APIs (as documented by notebooklm-mcp-cli)
- Use for personal/experimental purposes only
- Cookie extraction is handled securely by the `nlm login` command

## Troubleshooting

**Installation Issues:**
```bash
# Force reinstall if needed
uv tool install --force notebooklm-mcp-cli
```

**Authentication Failures:**
```bash
# Remove old auth data and re-login
rm -rf ~/.notebooklm-mcp-cli
nlm login
```

**Command Not Found:**
```bash
# Verify installation
which nlm
# If not found, run install.sh again
```

**Token Expiration:**
```bash
# Refresh auth
nlm login
```

## Advanced Usage

**Profile Management:**
```bash
# List all profiles with emails
nlm login profile list

# Switch profiles
nlm login switch work

# Delete a profile
nlm login profile delete work
```

**Using uvx (No Install Required):**
```bash
# Run nlm without installing
uvx --from notebooklm-mcp-cli nlm notebook list
```

## References

For complete command reference and advanced features, see:
- CLI Guide: Available in notebooklm-mcp-cli package or GitHub
- MCP Guide: https://github.com/jacob-bd/notebooklm-mcp-cli
