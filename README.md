![lori-banner](https://github.com/spectrachrome/ollama-chat/assets/94269527/9596ca59-1147-492f-900c-eb647325bba2)

# `lori_frontend`

A work-in-progress cross-platform GUI client which accesses the HTTP server of the `lori_server` crate to interface with [Ollama server](https://ollama.ai/) while providing the ability to inject information into the system programmatically with a plugin system, for example to do a web search and integrating the results to provide up-to-date information if deemed necessary or to implement mechanisms for long-term memory for the chatbot.

<img width="1622" alt="Screenshot 2023-09-02 at 04 22 00" src="https://github.com/spectrachrome/ollama-chat/assets/94269527/b22379a2-3dad-4dba-98d3-1a5b6bd08569">

## Features

### Markdown Rendering

- [x] Blockquotes
- [x] Code blocks with syntax highlighting
- [x] Headings
- [x] Horizontal lines
- [x] Lists (ordered and unordered)
- [ ] Inline code formatting
- [ ] Links
- [ ] Images
- [ ] Tables
- [ ] Emphasis (bold, italic)
- [ ] Strikethrough

The chat interface supports syntax highlighting for fenced code blocks, and soon also for inline code. You can define a language for the code block by putting a string right after the first set of triple backticks, similar to the syntax found in GitHub Flavored Markdown and other common Markdown parsers.

* Markdown Rendering

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
