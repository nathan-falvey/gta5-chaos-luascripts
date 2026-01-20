# Copilot instructions for gta5-chaos-luascripts

These notes help an AI coding agent make productive, targeted edits to this repository.

1. Project purpose
- This repo is a collection of Lua effects for the GTA V Chaos Mod runtime. Each file defines one effect that the Chaos Mod loader expects to find and execute.

2. Key file patterns
- Every effect defines an `EffectInfo` table and three lifecycle functions: `OnStart()`, `OnTick()`, and `OnStop()`.
- Example files: [Player/PlayerTPEverythingAway.lua](Player/PlayerTPEverythingAway.lua), [Player/PlayerAnnoyingRCVehicle.lua](Player/PlayerAnnoyingRCVehicle.lua), [Peds/PedsClowningAround.lua](Peds/PedsClowningAround.lua), [Misc/MiscCleanUp.lua](Misc/MiscCleanUp.lua).

3. Naming & metadata conventions
- `EffectInfo.EffectId`: unique, snake_case id (prefixes used include `player_`, `peds_`, `veh_`, `misc_`). Keep ids stable to avoid breaking saved configs.
- `TimedType`: one of `None`, `Normal`, `Short`, `Permanent`, or `Custom` (set `CustomTime` when using `Custom`). See `PlayerTPEverythingAway.lua` for examples.
- `EffectGroup`/`EffectCategory`: optional grouping used by the mod UI—preserve existing values when editing.

4. API and runtime expectations
- Scripts call Chaos Mod runtime helpers and GTA native functions (e.g. `GET_ENTITY_COORDS`, `SET_ENTITY_COORDS`, `GET_HASH_KEY`). Do not assume standard Lua libraries beyond basic math/table/string.
- Use provided helper functions like `GetAllVehicles()` and `GetAllPeds()` when present. Heavy work should be bracketed with `EnableScriptThreadBlock()` / `DisableScriptThreadBlock()` as shown in `PlayerTPEverythingAway.lua`. This prevents mission breakage.

5. Safe editing practices
- Keep `OnTick()` lightweight. Per-file patterns use `OnStart()` for heavy one-off operations and `OnStop()` for cleanup (see `Misc/MiscCleanUp.lua`).
- When adding model/ped/vehicle creation, call `SET_MODEL_AS_NO_LONGER_NEEDED()` after spawning and set network flags where existing files do.

6. Debugging & testing
- Runtime: these scripts are loaded by the Chaos Mod runtime. The README explains how to install effects into `ChaosMod/Effects` — follow those steps to test in game.
- Use `print()` statements for minimal runtime logs; prefer non-destructive testing (temporary vehicles/peds) and ensure cleanup in `OnStop()`.

7. Code style & idioms to follow
- Minimal globals: existing scripts set a few globals (e.g. `playerPed`) in `OnStart()` — match existing style rather than introducing module systems.
- Prefer small, focused changes: add helpers at the bottom of the same file unless the change is shared across many effects.

8. Integration & external dependencies
- This repo depends on the external Chaos Mod loader and GTA Natives—do not attempt to refactor away from those calls.

9. What not to change
- Do not rename `EffectInfo.EffectId`, remove lifecycle functions, or change `TimedType` semantics without updating any UI grouping logic (not present in this repo).

10. If you need more context
- Read the top-level [README.md](README.md) and review representative scripts in `Player/`, `Peds/`, `Vehs/`, `Misc/` to learn common helpers and patterns.

If anything is unclear or you want additional examples (naming, timing, or network-safe spawning), tell me which area to expand.

11. External References
- Chaos Mod Lua Scripting Wiki: `(https://github.com/gta-chaos-mod/ChaosModV/wiki/Lua-Scripting)`
- GTA V Natives Reference: `(https://nativedb.scheenen.dev/natives)`
- Example Effect Template: `(https://gitea.nathan-falvey.synology.me/Templates/gta5-chaos-luascript-template)`