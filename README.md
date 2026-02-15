# NotebookLM Antigravity Skill

An Agent Skill for Google Antigravity that provides seamless integration with Google NotebookLM through the `nlm` command-line interface.

## Overview

This skill enables you to use Google NotebookLM directly within Antigravity for:
- Creating and managing notebooks
- Adding sources from URLs, files, text, and Google Drive
- Generating AI-powered audio podcasts and video content
- Performing web research
- Querying notebooks with natural language
- Sharing and collaborating on notebooks

## Installation in Antigravity

### Option 1: Global Installation (Available Across All Projects)

Clone or copy this skill to:
```
~/.gemini/antigravity/skills/notebooklm/
```

### Option 2: Workspace Installation (Project-Specific)

Clone or copy this skill to your project's skill directory:
```
<your-project>/.agent/skills/notebooklm/
```

## First-Time Setup

### Step 1: Run the Installation Script

The skill includes an installation script that sets up the `nlm` CLI:

```bash
cd <skill-directory>
bash scripts/install.sh
```

This will:
1. Check for `uv` (recommended), `pipx`, or `pip`
2. Install `notebooklm-mcp-cli` package
3. Make the `nlm` command available in your PATH

### Step 2: Authenticate with Google

Before using NotebookLM, authenticate with your Google account:

```bash
nlm login
```

This will:
1. Launch a dedicated Chrome profile
2. Let you log in to Google
3. Automatically extract authentication cookies

**Verify authentication:**
```bash
nlm login --check
```

## Usage in Antigravity

Once installed and authenticated, Antigravity will automatically detect when you want to use NotebookLM based on your request. You can mention tasks like:

- "Create a notebook for my research"
- "Add this URL to my notebook"
- "Generate an audio podcast from these sources"
- "Research [topic] and import sources"
- "What are the key findings in this notebook?"
- "Share this notebook publicly"

## Common Workflows

### Research + Generate Podcast

1. Antigravity will create a notebook
2. Add sources (URLs, files, Drive docs)
3. Generate an AI audio podcast
4. Download the generated audio

### Document Analysis

1. Create a notebook
2. Upload PDF or document
3. Query with natural language
4. Get insights and summaries

### Web Research

1. Start research on a topic
2. Automatically find and import top sources
3. Query the gathered sources
4. Generate summary or presentation

## Features

### Notebook Management
- Create, list, and view notebooks
- Add multiple source types
- Organize research projects

### Source Types
- **URLs**: Web pages, articles
- **YouTube**: Video transcripts
- **Text**: Direct text input
- **Files**: PDF, DOCX, TXT, etc.
- **Google Drive**: Import Drive documents

### AI Content Generation
- **Audio Podcasts**: AI-generated audio overviews
- **Videos**: Explainer videos with various styles
- **Briefings**: Summary documents
- **Flashcards**: Study cards (easy/medium/hard)
- **Infographics**: Visual summaries
- **Mind Maps**: Concept visualization
- **Slides**: Presentation decks

### Research & Analysis
- Web research with auto-discovery
- Natural language queries
- Multi-source synthesis
- Drive source sync

### Sharing & Collaboration
- Public links
- Invite collaborators (editor/viewer)
- Share management

## Requirements

- **Antigravity**: Google Antigravity installed
- **Python Package Manager**: `uv` (recommended), `pipx`, or `pip`
- **Google Account**: For NotebookLM authentication
- **Chrome**: For authentication (uses headless Chrome)

## Limitations

- **Rate Limits**: Free tier ~50 queries/day
- **Auth Expiration**: Cookies expire every 2-4 weeks; re-run `nlm login`
- **Internal APIs**: Uses undocumented internal APIs (as documented by notebooklm-mcp-cli)
- **Use Case**: Intended for personal/experimental purposes

## Troubleshooting

### Installation Issues

```bash
# Force reinstall
uv tool install --force notebooklm-mcp-cli

# Or manually
rm -rf ~/.notebooklm-mcp-cli
bash scripts/install.sh
```

### Authentication Failures

```bash
# Remove old auth and re-login
rm -rf ~/.notebooklm-mcp-cli
nlm login
```

### Command Not Found

```bash
# Check installation
which nlm

# If not found, PATH issue - add to shell config
# For bash/zsh:
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

### Studio Content Generation Time

Audio and video generation takes time. Always check status before downloading:

```bash
nlm studio status <notebook-id> <artifact-id>

# Wait until status shows "completed", then:
nlm download audio <notebook-id> <artifact-id>
```

## Advanced Usage

### Multiple Profiles

Use multiple Google accounts:

```bash
nlm login --profile work
nlm login --profile personal
nlm login switch work
```

### uvx (No Install Required)

Run `nlm` without installing:

```bash
uvx --from notebooklm-mcp-cli nlm notebook list
```

## Reference Documentation

- **CLI Guide**: Available in the notebooklm-mcp-cli package
- **MCP Guide**: https://github.com/jacob-bd/notebooklm-mcp-cli
- **Antigravity Skills**: https://codelabs.developers.google.com/getting-started-with-antigravity-skills

## Credits

- Based on [notebooklm-mcp-cli](https://github.com/jacob-bd/notebooklm-mcp-cli) by Jacob Bedorf
- Follows Antigravity Skills specification from Google
- Compatible with Antigravity Agent Skills architecture

## License

This skill is provided as-is for use with Google Antigravity and notebooklm-mcp-cli.

---

**Note**: This skill requires `notebooklm-mcp-cli` to be installed and authenticated. Run `bash scripts/install.sh` and `nlm login` before first use.
