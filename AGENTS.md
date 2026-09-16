# homebrew-tap — Agent instructions

> Canonical instructions for all coding agents (Claude Code, Codex, GitHub Copilot). Codex reads this directly; Claude and GitHub Copilot use pointer files when present.

This repository is the `realgarit/homebrew-tap` Homebrew tap for macOS casks.

- Keep cask definitions under `Casks/` and preserve the tap's public install commands in `README.md`.
- Casks are unsigned; retain the documented Gatekeeper/quarantine guidance unless the distribution model changes.
- Validate syntax and cask metadata with the appropriate Homebrew checks before opening a pull request.
- Do not add credentials, signing material, or generated local Homebrew state to the repository.

## Cross-agent conventions

- This file (`AGENTS.md`) is the single source of truth for agent instructions. `CLAUDE.md` and `.github/copilot-instructions.md` are compatibility pointers when present; never duplicate guidance into them.
- Shared repository skills live in `.agents/skills/` (one folder per skill with a `SKILL.md`); Codex scans this location natively. Keep any `.claude/skills/` compatibility bridge pointer-only or generated from this directory.
- Before ending substantial work, record durable decisions, gotchas, and resumable state in the `Working notes` section below.

## Working notes

<!-- Any agent: append short dated notes here (YYYY-MM-DD — note). -->

- 2026-09-16 — Codex-first layout sweep: repository-local shared skills use `.agents/skills/` as the canonical source. Any `.claude/skills/` path is only a compatibility bridge or generated mirror.
