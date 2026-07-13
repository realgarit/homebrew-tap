# realgarit/homebrew-tap

Personal [Homebrew tap](https://docs.brew.sh/Taps) for distributing my macOS casks.

## Usage

```sh
brew tap realgarit/tap
brew install --cask <formula>
```

Formulas are unsigned — to skip Gatekeeper quarantine:

```sh
export HOMEBREW_CASK_OPTS="--no-quarantine"
```
