# biome ci ignores NO_COLOR

`biome ci` writes ANSI colour codes when its output is not a terminal and `NO_COLOR=1` is set.
`biome check` and `biome format` do not.

## Steps

```sh
npm install
npm run repro
```

## Result

```
biome check:              0
biome format:             0
biome ci:                 255
biome ci --colors=off:    0
```

## Expected

`biome ci` writes 0 escape codes, the same as `biome check`.

## Why it matters

lint-staged sets `NO_COLOR` when its output is not a terminal. Example: a commit from the VS Code Source Control panel. The error dialog then shows the raw codes. Biome's formatting diff puts codes around each character, so the message is very hard to read.
