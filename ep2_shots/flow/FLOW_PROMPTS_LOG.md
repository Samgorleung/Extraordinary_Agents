# Episode 2 — Google Flow (Omni 1.2) Assets & Director's Cut Integration Log

This log documents all Google Flow / Omni 1.2 video clips integrated into the Episode 2 Director's Cut via `ep2_shots/assemble_ep2.sh`, including frame-accurate splits, duplication-removal trims, and archived raw backups.

> **Note**: All `.mp4` binaries and `ep2_shots/flow/archive/` are excluded from Git tracking via `.gitignore`.

---

## 1. Active Director's Cut Flow Inventory (`ep2_shots/flow/`)

| Active Filename | Original Source | Resolution / FPS | Active Duration | Audio | Timeline Placement & Role |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **`Flow_Bridge_05_06.mp4`** | `Flow_Bridge_05_06.mp4` | `1280×720` @ `24 fps` | `4.032s` | Stereo AAC (1 stream) | **Act I → II Bridge** (between `Ep2_Shot_05` and `Ep2_Shot_06`): Golden gala sparkle transition introducing Dorian, Saffron, Chloe, and Finn on the red carpet. |
| **`Flow_Bridge_09_10.mp4`** | `Flow_Bridge_09_10.mp4` | `1920×1080` @ `30 fps` | `10.101s` | Stereo AAC (1 stream) | **Act II Bridge** (between `Ep2_Shot_09` and `Ep2_Shot_10`): Start-to-End transition from the mezzanine air-vent chaos down to the laser vault corridor. |
| **`Flow_Shot_11.mp4`** | `Flow_Bridge_11_12.mp4` (replaced legacy `Flow_Shot_11.mp4`) | `1280×720` @ `24 fps` | `8.043s` | Replaced by H3 `Ep2_Shot_11` SFX | **Shot 11 Flow Override** (derived from `11A.png` + `Flow_Bridge_11_12`): Normal-scale 210 cm Colossus vault breach + Naomi charging blue EMP orb from pink bag while Evelyn & Isabella open fire. Frame check through `t=7.8s` and clip end showed active motion with no frozen tail, so full `8.043s` is preserved and leads straight into `Ep2_Shot_12`. |
| **`Flow_Bridge_13_14.mp4`** | `Flow_Bridge_13_14.mp4` | `1280×720` @ `24 fps` | `5.035s` | Stereo AAC (1 stream) | **Act III Action Bridge** (between `Ep2_Shot_13` [`4.2s` cut] and `Ep2_Shot_14`): Chloe Han's mid-air Taekwondo combo driving Colossus beneath the crystal chandelier (supersedes H3 `Ep2_Shot_13B`). |
| **`Flow_Bridge_14_15.mp4`** | `Flow_Bridge_14_15.mp4` | `1280×720` @ `24 fps` | `5.035s` | Stereo AAC (1 stream) | **Act III Terrace Bridge** (between `Ep2_Shot_14` and `Ep2_Shot_15`): Colossus smashing through the tall arched terrace windows under the full moon. |
| **`Flow_Shot_15.mp4`** | `Flow_Shot_15.mp4` (`6.037s` raw, trimmed `3.80s–5.80s`) | `1280×720` @ `24 fps` | `2.000s` | Replaced by H3 `Ep2_Shot_15` SFX | **Shot 15 Flow Override**: Trimmed to the `2.000s` moonlit slow-motion close-up hero pause (wings symmetrically spread before the full moon with floating feathers and glass shards) to eliminate duplicate wide entry framing already shown in `Flow_Bridge_14_15.mp4`. |
| **`Flow_Bridge_15_16.mp4`** | `Flow_Bridge_15_16.mp4` (`13.035s` raw, split `0.00s–5.15s`) | `1280×720` @ `24 fps` | `5.167s` | Stereo AAC (1 stream) | **Act III Split Part 1** (between `Ep2_Shot_15` and `Ep2_Shot_16`): Victoria's moonlit dive and silver cybernetic palm catching the Colossus's battleaxe, cutting cleanly at `T_PUNCH=5.15s` right before the energy blast so `Ep2_Shot_16` delivers her warning line seamlessly. |
| **`Flow_Bridge_16_17.mp4`** | `Flow_Bridge_15_16.mp4` (`13.035s` raw, split `5.15s–end`) | `1280×720` @ `24 fps` | `7.884s` | Stereo AAC (1 stream) | **Act III Split Part 2** (between `Ep2_Shot_16` and `Ep2_Shot_17`): Victoria's 7.88s transformation finisher—cyan shockwave iron fist knocking the axe aside (`t=5.2s`), cyan laser sword slash (`t=6.5s`), and rotary gatling gun blasting Colossus off the terrace. |
| **`Flow_Shot_19B.mp4`** | `Flow_Shot_19B.mp4` | `1280×720` @ `24 fps` | `5.035s` | Stereo AAC (1 stream) | **Shot 19B Shared Flow Beat** (between `Ep2_Shot_19` and `Ep2_Shot_20`): Non-dialogue emotional beat showing Emily Parker alone by the moonlit HQ corridor window holding her locket pendant (shared across HK & EN). |
| **`Flow_Shot_20.mp4`** | `Flow_Shot_20.mp4` | `1920×1080` @ `30 fps` | `8.085s` | Replaced by H3 `Ep2_Shot_20` dialogue | **Shot 20 Flow Override**: Gideon Ward at his amber-lit command desk reviewing Raven and Chloe telemetry, muxed with H3 bilingual dialogue. |

---

## 2. Frame-Accurate Split & Trim Verification Notes

1. **`Flow_Bridge_15_16.mp4` Split Point (`T_PUNCH = 5.15s`)**:
   - Inspected extracted frames from `ep2_shots/flow/archive/Flow_Bridge_15_16_full13s.mp4` at `0.5s` (`4.5s–7.0s`) and `0.1–0.2s` (`5.1s–5.8s`) intervals:
     - `t=5.0s–5.1s`: Victoria braces the golden axe blade with golden sparks (deadlock matching `Ep2_Shot_16` pose).
     - `t=5.2s`: Cyan shockwave blast erupts off her silver cybernetic fist, knocking the battleaxe upward (`t=5.8s–6.0s`).
     - `t=6.5s–7.0s`: Cyan laser sword ignition & slash combo, followed by rotary gatling gun finisher (`t=10.65s` / `+5.5s` in split part 2).
   - Re-encoded both halves with `libx264 -crf 16 -pix_fmt yuv420p` and `aac 192k 48kHz` for frame-exact cuts (`5.167s` + `7.884s`).
2. **`Flow_Shot_15.mp4` Duplication Trim (`3.80s → 5.80s`, `2.000s`)**:
   - The raw `0.0s–1.5s` opening repeated the exact wide hovering silhouette seen at the end of `Flow_Bridge_14_15.mp4` and the start of `Flow_Bridge_15_16.mp4`. Trimming to `3.80s–5.80s` isolates the centered full-moon close-up with symmetrical wings and floating glass shards.
3. **`Shot 16 (HK)` Visual Defect Swap**:
   - Frame comparison at `t=0.5, 2.0, 4.0, 6.0` confirmed `Ep2_Shot_16_HK.mp4` drifts/morphs away from the axe clash after `t=2.0s` into an unrelated solo city-skyline close-up, whereas `Ep2_Shot_16_EN.mp4` maintains full visual fidelity (Victoria vs. Colossus with Maya & Finn behind). `assemble_ep2.sh` swaps `Ep2_Shot_16_EN.mp4` video with `Ep2_Shot_16_HK.mp4` Cantonese audio for the HK build.

---

## 3. Archived Raw Backups (`ep2_shots/flow/archive/` — Git-Ignored)

- `ep2_shots/flow/archive/Flow_Bridge_15_16_full13s.mp4` — Unsplit `13.035s` raw Flow Extend clip.
- `ep2_shots/flow/archive/Flow_Shot_11_old_giant.mp4` — Legacy `10.027s` oversized 15m Colossus clip.
- `ep2_shots/flow/archive/Flow_Bridge_11_12_raw.mp4` — Raw `8.043s` normal-scale Colossus + Trio clip prior to replacing `Flow_Shot_11.mp4`.
- `ep2_shots/flow/archive/Flow_Shot_15_raw.mp4` — Untrimmed `6.037s` Victoria moonlit descent clip.
