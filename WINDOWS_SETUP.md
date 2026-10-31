# Windows Setup Guide

This guide describes a tested Windows installation of the NotebookLM Antigravity Skill.

## Environment Used

The following configuration was successfully tested:

- Windows 11
- Python 3.14
- pip
- Git
- notebooklm-mcp-cli 0.15.8

---

# Prerequisites

Verify that Python, pip, and Git are installed:

```cmd
python --version
pip --version
git --version
```

---

# Install notebooklm-mcp-cli

Install the NotebookLM CLI:

```cmd
pip install notebooklm-mcp-cli
```

Verify installation:

```cmd
pip show notebooklm-mcp-cli
```

---

# Verify the CLI

Check whether the executable is available:

```cmd
nlm --help
```

If the command works, continue to the authentication step.

If Windows reports:

```text
'nlm' is not recognized as an internal or external command
```

see the Troubleshooting section below.

---

# Authenticate with Google

Start the login process:

```cmd
nlm login
```

When prompted:

```text
Where should your saved login live?

1) Protected - encrypted, key kept in your OS keystore (recommended)
2) Plain file
```

Select:

```text
1
```

Complete the authentication in your browser using the Google account associated with NotebookLM.

---

# Verify NotebookLM Access

List your notebooks:

```cmd
nlm notebook list
```
Expected result: 
A table containing your NotebookLM notebook IDs.

If authentication succeeded, your NotebookLM notebooks should be displayed.

---

# Install the Skill

Copy the skill folder:

```text
notebooklm
```

to:

```text
C:\Users\<USERNAME>\.gemini\config\skills
```

Restart Antigravity after copying the folder.

---

# Verify Skill Loading

Open Antigravity and try:

```text
List my NotebookLM notebooks
```

If the skill is correctly loaded, Antigravity should retrieve notebooks through NotebookLM instead of returning a generic response.

---

# Troubleshooting

## "nlm" is not recognized

Locate the Scripts folder used by your Python installation:

```text
C:\Users\<USERNAME>\AppData\Roaming\Python\Python314\Scripts
```

The folder should contain:

```text
nlm.exe
mcp.exe
```

You can test directly:

```cmd
C:\Users\<USERNAME>\AppData\Roaming\Python\Python314\Scripts\nlm.exe --help
```

If that works, add the Scripts directory to your Windows PATH.

---

## Skill not detected by Antigravity

If the CLI works but Antigravity cannot access NotebookLM, verify that the skill was copied to:

```text
C:\Users\<USERNAME>\.gemini\config\skills
```

Restart Antigravity after moving the folder.

The skill may not be detected when installed in other locations.

---

# Quick Validation Checklist

- [ ] Python installed
- [ ] notebooklm-mcp-cli installed
- [ ] `nlm --help` works
- [ ] `nlm login` completed successfully
- [ ] `nlm notebook list` shows notebooks
- [ ] skill copied to `.gemini/config/skills`
- [ ] Antigravity can access NotebookLM