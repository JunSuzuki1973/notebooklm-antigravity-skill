# NotebookLM CLI Quick Reference

Common commands for Google NotebookLM via `nlm` CLI.

## Authentication

```bash
# Login (recommended - launches Chrome)
nlm login

# Check auth status
nlm login --check

# Use specific profile
nlm login --profile work
nlm login switch work
nlm login profile list
```

## Notebook Operations

```bash
# List all notebooks
nlm notebook list

# Create notebook
nlm notebook create "Project Name"

# Get notebook details
nlm notebook get <notebook-id>
```

## Source Management

```bash
# Add URL
nlm source add <notebook-id> --url "https://example.com"

# Add YouTube
nlm source add <notebook-id> --url "https://youtube.com/watch?v=xxx"

# Add text
nlm source add <notebook-id> --text "Content here"

# Add file
nlm source add <notebook-id> --file /path/to/file.pdf

# Add Google Drive
nlm source add <notebook-id> --drive "doc-id"

# List sources
nlm source list <notebook-id>

# Sync Drive sources
nlm source sync drive <notebook-id>
```

## Query & Analysis

```bash
# Ask questions
nlm notebook query <notebook-id> "Your question here"

# Get summary
nlm notebook query <notebook-id> "Summarize all sources"

# Deep dive analysis
nlm notebook query <notebook-id> "What are the key insights about X?"
```

## Studio Content Generation

### Audio
```bash
# Generate audio podcast
nlm audio create <notebook-id> --confirm

# Download audio
nlm download audio <notebook-id> <artifact-id>

# Download as MP3
nlm download audio <notebook-id> <artifact-id> --format mp3
```

### Video & Visual Content
```bash
# Generate video
nlm studio create <notebook-id> --type video --style classic

# Generate briefing
nlm studio create <notebook-id> --type briefing

# Generate flashcards
nlm studio create <notebook-id> --type flashcard --difficulty medium

# Generate infographic
nlm studio create <notebook-id> --type infographic --orientation landscape

# Generate mind map
nlm studio create <notebook-id> --type mindmap

# Generate slides
nlm studio create <notebook-id> --type slideshow

# Check status
nlm studio status <notebook-id> <artifact-id>

# List all artifacts
nlm studio list <notebook-id>
```

## Research

```bash
# Start web research
nlm research start "topic"

# Deep research with auto-import
nlm research start "topic" --deep --import

# Import top 10 sources
nlm research start "topic" --count 10 --import
```

## Sharing

```bash
# Make public
nlm share public <notebook-id>

# Disable public
nlm share disable <notebook-id>

# Invite collaborator
nlm share invite <notebook-id> --email user@example.com --role editor

# Add viewer
nlm share invite <notebook-id> --email user@example.com --role viewer
```

## Quick Workflows

### Research + Podcast
```bash
NOTEBOOK_ID=$(nlm notebook create "Research" | grep -oP 'id: \K\S+')
nlm source add "$NOTEBOOK_ID" --url "https://example.com"
nlm audio create "$NOTEBOOK_ID" --confirm
```

### Multi-Source Analysis
```bash
nlm notebook create "Multi-Source Research"
nlm source add <id> --url "https://source1.com"
nlm source add <id> --url "https://source2.com"
nlm source add <id> --file /path/to/doc.pdf
nlm notebook query <id> "Synthesize key insights from all sources"
```

### File Review
```bash
nlm notebook create "Document Review"
nlm source add <id> --file report.pdf
nlm notebook query <id> "What are the recommendations?"
```

## Studio Content Types

| Type | Command | Description |
|------|---------|-------------|
| Audio | `nlm audio create` | AI-generated podcast |
| Video | `nlm studio create --type video` | Video explainer |
| Briefing | `nlm studio create --type briefing` | Summary document |
| Flashcards | `nlm studio create --type flashcard` | Study cards |
| Infographic | `nlm studio create --type infographic` | Visual summary |
| Mind Map | `nlm studio create --type mindmap` | Concept map |
| Slideshow | `nlm studio create --type slideshow` | Presentation deck |

## Audio Styles

| Style | Description |
|-------|-------------|
| `deep-dive` | Comprehensive exploration |
| `overview` | High-level summary |
| `tutorial` | Educational format |

## Difficulty Levels (for flashcards)

| Level | Command |
|-------|---------|
| Easy | `--difficulty easy` |
| Medium | `--difficulty medium` |
| Hard | `--difficulty hard` |

## Video Styles

| Style | Command |
|-------|---------|
| Classic | `--style classic` |
| Modern | `--style modern` |
| Minimal | `--style minimal` |

## Tips

1. **Check status first:** Always run `nlm studio status` before downloading - generation takes time
2. **Use quotes:** Always quote search queries and text with spaces
3. **Capture IDs:** Save notebook IDs in variables for multi-step workflows
4. **Rate limits:** Free tier ~50 queries/day
5. **Auth refresh:** Re-run `nlm login` every 2-4 weeks when cookies expire
