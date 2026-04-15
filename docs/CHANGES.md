v2.0.2

- Added missing `jq` installation step required for Discord notification parsing
- Fixed workflow runtime error where `jq` was not available on the runner

v2.0.1

- Fixed GitHub Actions workflow `if` conditionals to use canonical expression syntax
- Removed redundant `${{ }}` wrappers from conditional steps

v2.0.0

- Renamed addon files and package metadata from `PkmnLU` to `PokemonLevelUp`
- Reworked the addon to follow the same `SRLU` and `FFLU` structure with `data/core.lua` and `data/locales.lua`
- Added PLU slash commands, saved variables, and Pokemon-themed color branding
- Renamed the bundled sound file set to `pokemon_high.ogg`, `pokemon_med.ogg`, and `pokemon_low.ogg`
