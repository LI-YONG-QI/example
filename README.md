# Fuse Example

This is Fuse example.

## How to started

### Prerequisites

- Install Fuse globally via npm:

```bash
npm i -g @fuse-kit/fuse
```

### Steps

1. Build

```bash
forge build

```

2. Generate `Deployer.sol`

```bash
fuse core && fuse periphery
```

Check `Deployer.sol` whether under the script folder.

3. Run script

```bash
forge script CoreScript && forge script PeripheryScript
```
