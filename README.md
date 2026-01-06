# dotfiles

## Creating Links
```sh
git clone https://github.com/wataru0/dotfiles.git
cd dotfiles/scripts
./link.sh
```

## Manual File Updates

After editing individual files in this repository, manually copy them to apply changes:

```sh
# Example: Copy updated .zshrc (with confirmation prompt)
cp -i dotfiles/.zshrc ~/.zshrc

# Example: Copy Claude Code commands
cp -i dotfiles/.claude/commands/commit-msg.md ~/.claude/commands/

# Or copy all files from a directory
cp -i dotfiles/.claude/commands/*.md ~/.claude/commands/
```
