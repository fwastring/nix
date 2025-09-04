# Update Neovim

1. Update the version controlled code
2. Run:

```bash
nix flake lock --update-input nvim-config
```

3. Run:

```bash
home-manager switch --flake "/home/fw/nix#fw@jobb"
```
