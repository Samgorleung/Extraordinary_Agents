# Project Planning Roadmap & Changelog

## 1. Active Production Roadmap (目前計劃與待辦事項)

### Episode 1 Remaster: Operation Barefoot Banana (In Progress — Step 2 Updated: 16-Shot Horror-Twist Structure Ready)
- [DONE] **Legacy Archive & Audit (`ep1_shots/Archive/LEGACY_EP1_AUDIT.md`)**: Probed all 24 legacy `.mp4` clips (`1280x720` + 2 H3 `1344x768` epilogues) and consolidated all 25 legacy `.txt` prompt scripts (commit `2a24670`).
- [DONE] **Step 2 (16-Shot Remaster Storyboard, Video Prompts & Hybrid Assembler)**: Expanded `ep1_shots/storyboard.md` to 16 shots (`Ep1_Shot_01`–`16` + `Flow_Bridge_09_10`) featuring the glowing-amber-eyes thriller cliffhanger (`Ep1_Shot_05`), HQ Saffron red-alert dispatch (`Ep1_Shot_06`), and Barnaby reveal (`Ep1_Shot_07`), Frame-0 aligned Flow keyframe prompts (`03`, `09`, `11`, `13`), clean 20 bilingual MiniMax H3 prompts (`01, 02, 04, 06, 07, 10, 12, 14, 15, 16` EN & HK), `ep1_shots/flow/FLOW_PROMPTS_PLAN.md` (6 Flow shots + `Flow_Bridge_09_10`), and updated 16-shot `ep1_shots/assemble_ep1.sh`.
- [TODO] **Step 3 (16:9 Single-Frame Keyframes)**: Generate and standardize `ep1_shots/01.png`–`16.png` via ChatGPT / Hybrid Image Pipeline.
- [TODO] **Step 4 (Dual-Engine Render & Assembly)**: Render the 6 Flow clips + `Flow_Bridge_09_10` in `ep1_shots/flow/` and run Colab A100 H3 batch (`COLAB_EXEC_TIMEOUT=1200 COLAB_HIGH_MEM=1`) for all 10 bilingual dialogue shots (`01, 02, 04, 06, 07, 10, 12, 14, 15, 16`), then assemble `Episode_1_Hybrid_Master_HK.mp4` & `EN.mp4` via `./ep1_shots/assemble_ep1.sh ALL`.

### Episode 2 Planning (Completed — Director's Cut: 10 Flow Omni 1.2 Clips + Bilingual Hybrid Masters)
- [DONE] **Step 1 (Character Roster & Turnaround Sheets)**: All 20 canonical characters locked in `bible/character_roster.md` and `bible/character_sheets/` (including Episode 2 debuts: `Oliver Kade.png`, `Finn Calder.png`, `Gideon Ward.png`, `Nia Vale.png`, and `Dorian Marlowe.png`).
- [DONE] **Step 2 (Full 20-Shot Storyboard & Script + Shot 13B Bridge)**: Expanded `ep2_shots/storyboard.md` into the complete 20-shot script (`Ep2_Shot_01` – `Ep2_Shot_20`) plus `Ep2_Shot_13B` Taekwondo combo bridge with full visual anchors, bilingual dialogue (English & HK Cantonese), and Hybrid Flow/MiniMax H3 routing table.
- [DONE] **Step 3 (Single-Frame 16:9 Keyframe Generation — 20/20 Completed)**:
  - [DONE] Act I Keyframes (`ep2_shots/1.png` to `ep2_shots/5.png` for `Ep2_Shot_01` – `Ep2_Shot_05`) generated, standardized, and committed.
  - [DONE] Act II Keyframes (`ep2_shots/6.png` to `ep2_shots/10.png` for `Ep2_Shot_06` – `Ep2_Shot_10`) fully generated, standardized, and committed:
    - `6.png`: Red Carpet Rivals (Dorian & Saffron, Chloe, Finn).
    - `7.png`: Service Corridor Infiltration (Maya & Barnaby rolling router barrel, guards bowing, Finn peeking).
    - `8.png`: VIP Champagne Balcony (Helena Voss & Gideon Ward toast, Isabella & Airi, Nia in background).
    - `9.png`: Mezzanine Air Vent Standoff (Saffron & Dorian wedged in golden duct, Finn flattened by grille).
    - `10.png`: Laser Corridor Vault Approach (Chloe Han poised stance, Maya & Barnaby behind barrel, Dorian & Saffron crashed on Finn).
  - [DONE] Act III Keyframes (`ep2_shots/11.png` to `ep2_shots/16.png` for `Ep2_Shot_11` – `Ep2_Shot_16`) generated via Hybrid Image Pipeline, standardized, and committed:
    - `11.png`: The Colossus Storms the Golden Vault.
    - `12.png`: Cathedral Showdown — Dorian's gadget pen bouncing off Colossus + Naomi deploying micro-EMP disc from pink bag alongside Evelyn & Isabella.
    - `13.png`: Ballroom Clash — Agent Chloe Han's flying Taekwondo floral high kick deflecting Colossus's warhammer.
    - `14.png`: Chandelier Chaos — Saffron's tactical pistol wire, Maya's warm smile + banana sight & silent Barnaby pulling chandelier down onto Colossus, Finn bonked.
    - `15.png`: Moonlit Winged Assault — Victoria Parker (Raven) descending with dark wings & 10D light brown pantyhose before full moon.
    - `16.png`: Cybernetic Winged Heroine Deflects Colossal Axe — Raven's cybernetic right arm clashing with Colossus's axe as Maya & Finn rush in.
  - [DONE] Act IV Keyframes (`ep2_shots/17.png` to `ep2_shots/20.png` for `Ep2_Shot_17` – `Ep2_Shot_20`) generated via Hybrid Image Pipeline, standardized, and committed:
    - `17.png`: Post-Mission Repair Bill Blues — Griz holding floor-length invoice, Oliver cradling wire-tangled tactical pistol, bandaged Finn.
    - `18.png`: Command Centre Celebration — Maya smiling & high-fiving silent Barnaby with bananas, Isabella collecting cash from Evelyn & Naomi, Dorian in awe.
    - `19.png`: Military Intel Comms Hub — Elise pointing at monitor freeze-frame of Raven while Aoi clenches her fists.
    - `20.png`: Syndicate Mastermind Gideon Ward at amber-lit desk with Colossus's scuffed golden mask and Chloe/Raven telemetry.
- [DONE] **Step 4 (Dual-Engine Video Generation — 40/40 Completed)**:
  - [DONE] Created English and HK Cantonese video prompt files for Act I (`ep2_shots/prompt_1.txt` – `prompt_5.txt` and `ep2_shots/prompt_1_hk.txt` – `prompt_5_hk.txt`).
  - [DONE] Created English and HK Cantonese video prompt files for Act II (`ep2_shots/prompt_6.txt` – `prompt_10.txt` and `ep2_shots/prompt_6_hk.txt` – `prompt_10_hk.txt`).
  - [DONE] Created English and HK Cantonese video prompt files for Act III (`ep2_shots/prompt_11.txt` – `prompt_16.txt` and `ep2_shots/prompt_11_hk.txt` – `prompt_16_hk.txt`).
  - [DONE] Created English and HK Cantonese video prompt files for Act IV (`ep2_shots/prompt_17.txt` – `prompt_20.txt` and `ep2_shots/prompt_17_hk.txt` – `prompt_20_hk.txt`).
  - [DONE] Generated and saved all 10 Cantonese videos (`Ep2_Shot_01_HK.mp4` – `Ep2_Shot_10_HK.mp4`) and all 10 English videos (`Ep2_Shot_01_EN.mp4` – `Ep2_Shot_10_EN.mp4`) for Act I & Act II on Colab A100 (20/20 videos completed).
  - [DONE] Generated and saved all 6 Cantonese videos (`Ep2_Shot_11_HK.mp4` – `Ep2_Shot_16_HK.mp4`) and all 6 English videos (`Ep2_Shot_11_EN.mp4` – `Ep2_Shot_16_EN.mp4`) for Act III on Colab A100 (12/12 videos completed; 32/32 cumulative for Acts I–III).
  - [DONE] Generated and saved all 4 Cantonese videos (`Ep2_Shot_17_HK.mp4` – `Ep2_Shot_20_HK.mp4`) and all 4 English videos (`Ep2_Shot_17_EN.mp4` – `Ep2_Shot_20_EN.mp4`) for Act IV on Colab A100 (8/8 videos completed; **40/40 Episode 2 videos 100% completed**).
  - [DONE] Integrated 5 Google Flow videos (`Flow_Shot_11.mp4`, `Flow_Shot_15.mp4`, `Flow_Shot_20.mp4`, `Flow_Bridge_09_10.mp4`, `Flow_Bridge_15_16.mp4`) into `ep2_shots/flow/` and added `ep2_shots/assemble_ep2.sh` for 138% Punch-In + Flow Hybrid Master assembly.
  - [DONE] Regenerated MiniMax H3 clips for Shots 10, 14, and 18 (`Ep2_Shot_10_HK/EN.mp4`, `Ep2_Shot_14_HK/EN.mp4`, `Ep2_Shot_18_HK/EN.mp4`) with non-speaking Barnaby prompt refinements + generated `Ep2_Shot_13B` Taekwondo combo bridge (`Ep2_Shot_13B_HK.mp4` & `Ep2_Shot_13B_EN.mp4`), and built initial Hybrid Masters (`194.13s` HK / `197.86s` EN).
  - [DONE] **Episode 2 Director's Cut Assembly**: Integrated all 10 Google Flow Omni 1.2 bridges & overrides (`Flow_Bridge_05_06.mp4`, `Flow_Bridge_09_10.mp4`, `Flow_Bridge_13_14.mp4`, `Flow_Bridge_14_15.mp4`, split `Flow_Bridge_15_16.mp4` + `Flow_Bridge_16_17.mp4`, replaced `Flow_Shot_11.mp4`, trimmed `Flow_Shot_15.mp4`, shared `Flow_Shot_19B.mp4`, `Flow_Shot_20.mp4`), applied `08 -> 07` causal Act II reorder, `Shot 16 (HK)` clean video swap (`Ep2_Shot_16_EN.mp4` video + `Ep2_Shot_16_HK.mp4` audio), trailing-silence-only `get_smart_duration` (`-42dB/d=0.60/+0.75s`) with `MAX_DUR=12.25` and `Shot 20` slow-mo stretch (`8.09s -> 12.25s`), and assembled final 27-segment Director's Cut Masters via `ep2_shots/assemble_ep2.sh ALL`: `Episode_2_Hybrid_Master_HK.mp4` (`221M`, `272.849s`) and `Episode_2_Hybrid_Master_EN.mp4` (`230M`, `272.849s`).

## 2. Changelog (更新日誌)

### [2026-11-22] - Episode 1 Remaster 16-Shot Horror-Twist Restructure, HQ Saffron Red Alert & Frame-0 Alignment
- **16-Shot Suspense-to-Comedy Restructure (`ep1_shots/storyboard.md`, `ep1_shots/prompt_*.txt`)**:
  - Updated `Ep1_Shot_04` so Maya slips barefoot beside the `Project Simian` crate and knocks herself out cold on the concrete floor with a dead comms feed.
  - Inserted **`Ep1_Shot_05`** (`Flow_Shot_05.mp4`, 4s non-dialogue): cold glowing amber eyes opening inside the pitch-black crate shadows behind unconscious Maya without spoiling Barnaby's cute face.
  - Moved HQ red-alert panic forward to **`Ep1_Shot_06`** (`Griz + Saffron + Chloe + Aoi` in frame; Saffron boasting with matte-black prototype pistol to catch the "monster").
  - Created **`Ep1_Shot_07`** (horror-to-comedy reveal): Maya jolts awake yelling monster, then melts into ticklish laughter realizing it is chip-collared Barnaby (`a quiet orange ape` @ end).
  - Shifted subsequent beats cleanly +1 through **`Ep1_Shot_16`** and updated transition bridge to **`Flow_Bridge_09_10.mp4`**.
- **Cleanup, Flow Frame-0 Lock & Script Sync (`ep1_shots/flow/FLOW_PROMPTS_PLAN.md`, `ep1_shots/assemble_ep1.sh`)**:
  - Deleted obsolete `prompt_{05,09,11,13}[_hk].txt` files and regenerated exact 20 H3 prompts matching the 10 dialogue shots (`01, 02, 04, 06, 07, 10, 12, 14, 15, 16` EN & HK), keeping Chloe's blue-ribbon white rabbit beside Chloe in Shot 01.
  - Locked Frame-0 starting keyframe poses for Flow shots `03.png` (pre-jump with heels on), `09.png` (crate overhead over 3 guards, no lasers yet), `11.png` (Saffron catwalk hero pose, no wire yet), and `13.png` (Chloe Taekwondo opening stance).
  - Updated `FLOW_PROMPTS_PLAN.md` (6 Flow shots + `Flow_Bridge_09_10`), `assemble_ep1.sh` (16-shot `SHOT_CONFIGS`), and `storyboard.md` Colab CLI loop (`COLAB_EXEC_TIMEOUT=1200 COLAB_HIGH_MEM=1`).

### [2026-11-21] - Episode 1 Remaster (Operation: Barefoot Banana) 15-Shot Production Package
- **Remaster Storyboard & Canon Alignment (`ep1_shots/storyboard.md`)**:
  - Locked full 15-shot + 1 Flow bridge (*Operation: Barefoot Banana*) script to 2020s high-budget modern anime lighting (Ufotable/Makoto Shinkai; strictly zero 1990s flat cel-shading) and verified `bible/character_roster.md` visual descriptors.
  - Added Episode 2 continuity hooks: Golden Eagle Crest smuggled crates & Charity Gala invitation (`Ep1_Shot_01`, `14`), Oliver Kade's grapple-switch warning + Emily asking about Victoria (`Ep1_Shot_02`), `Project Simian` origin crate & Custody Order naming **Barnaby** (`Ep1_Shot_04`, `05`, `14`), Barnaby crate-throwing defensive showcase (`Ep1_Shot_08`), Chloe Taekwondo finisher (`Ep1_Shot_12`), upgraded classic epilogue (`Ep1_Shot_13`), and Gideon Ward's TV interview mask-slip reveal (`Ep1_Shot_15`).
  - Documented Colab A100 CLI batch command (`COLAB_EXEC_TIMEOUT=1200 COLAB_HIGH_MEM=1`, `--mode first_frame`) and all 15 single-frame 16:9 keyframe prompts (`01.png`–`15.png`).
- **MiniMax H3 Bilingual Prompts (`ep1_shots/prompt_*.txt`) & Google Flow Plan (`ep1_shots/flow/FLOW_PROMPTS_PLAN.md`)**:
  - Generated all 20 bilingual H3 video prompts (`01, 02, 04, 05, 06, 09, 11, 13, 14, 15` EN + HK Cantonese) with English scene framing, spoken lines inside quotation marks, and `a quiet orange ape` placed at the end of Barnaby shots (`05, 09, 11, 13, 14`) to prevent voice-stealing.
  - Created `ep1_shots/flow/FLOW_PROMPTS_PLAN.md` containing ready-to-copy non-dialogue Omni 1.2 prompts for `Flow_Shot_03` (`5s`), `07` (`4s`), `08` (`5s`), `Flow_Bridge_08_09` (`4s`), `10` (`6s`), and `12` (`6s`).
- **Hybrid Assembler & Git Hygiene (`ep1_shots/assemble_ep1.sh`, `.gitignore`)**:
  - Built `ep1_shots/assemble_ep1.sh` from the repaired `assemble_ep2.sh` template (`SCRIPT_DIR`/`REPO_ROOT` paths, trailing-silence-only `-42dB/d=0.60/+0.75s` trim, `MAX_DUR=12.25`, 138% zoom punch-in, and automatic `ep1_shots/flow/` override & bridge detection).
  - Updated `.gitignore` with `ep1_edited_clips/` and `ep1_shots/flow/archive/`.

### [2026-11-21] - Legacy Episode 1 Archive Audit (`ep1_shots/Archive/LEGACY_EP1_AUDIT.md`)
- Audited all 24 legacy `.mp4` clips (`1280x720` + 2 H3 `1344x768` epilogues) and 25 archived `.txt` prompt scripts; pushed text records with `.gitignore` video exclusions verified (`commit 2a24670`).

### [2026-11-20] - Fix Dialogue Over-Cutting & Rebuild Bilingual Director's Cut Masters
- **Root Cause & Audio Scan**: Voice-band (`300–3400 Hz`) envelope scans across all 36 H3 dialogue clips confirmed active speech up to `10.5s–12.0s` (including Shots 05, 13, 16, and 20) while ambient SFX kept tracks above `-42dB`, so previous `MAX_DUR` caps (`4.2s–9.5s`) and mid-clip silence detection clipped final words.
- **Assembler Fix (`ep2_shots/assemble_ep2.sh`)**:
  - Updated `get_smart_duration` to use `silencedetect=noise=-42dB:d=0.60` and cut (`silence_start + 0.75s`) **only** when silence persists to clip end (`in_sil == 1` or `tot - e <= 0.25`), never on mid-sentence pauses.
  - Raised `MAX_DUR` to `12.25s` across all dialogue shots (`01`–`10`, `12`–`14`, `16`–`20`) while keeping non-dialogue Flow entries (`11`, `15`, `19B`) unchanged.
  - Added smooth `setpts` video stretch in CASE 1 when H3 dialogue exceeds Flow video length (`Flow_Shot_20.mp4`: `8.085s -> 12.25s`) so Gideon Ward's full monologue plays cleanly.
- **Rebuilt Final Director's Cut Masters (27 segments each, `1344×768` @ `24fps`, `aac 48kHz stereo`)**:
  - `Episode_2_Hybrid_Master_HK.mp4` (`221M`, `231,702,973` bytes, `272.849s`)
  - `Episode_2_Hybrid_Master_EN.mp4` (`230M`, `240,929,364` bytes, `272.849s`)
- **Docs Sync**: Updated `ep2_shots/storyboard.md` (`Ep2_Shot_13` `12.25s` full dialogue and `Ep2_Shot_20` slow-mo stretch).

### [2026-11-20] - Episode 2 Director's Cut: 10 Flow Omni 1.2 Clips, Split Victoria 7s Finisher, Shot 19B & Causal Act II Reorder
- **Flow Material Processing & De-Duplication (`ep2_shots/flow/`, `ep2_shots/flow/archive/`)**:
  - Split `Flow_Bridge_15_16.mp4` (`13.035s` archived as `Flow_Bridge_15_16_full13s.mp4`) frame-accurately at `T_PUNCH = 5.15s`: `Flow_Bridge_15_16.mp4` (`5.167s`, moonlit dive & axe catch) before `Ep2_Shot_16`, and `Flow_Bridge_16_17.mp4` (`7.884s`, cyan shockwave iron fist -> laser sword slash -> rotary gatling gun finisher) after `Ep2_Shot_16`.
  - Replaced legacy oversized 15m `Flow_Shot_11.mp4` (archived as `Flow_Shot_11_old_giant.mp4`) with normal-scale `Flow_Bridge_11_12.mp4` (`11A.png` + Naomi EMP, Evelyn & Isabella; full `8.043s` verified active through end) to prevent duplicate vault-breach cuts.
  - Trimmed `Flow_Shot_15.mp4` to `3.80s–5.80s` (`2.000s` moonlit slow-mo hero close-up) to eliminate repeating the wide entry shown in `Flow_Bridge_14_15.mp4`.
- **Assembler Upgrades (`ep2_shots/assemble_ep2.sh`) & Master Output**:
  - Fixed path resolution via `SCRIPT_DIR` / `REPO_ROOT`, added SAR/audio-pad/timescale normalization (`setsar=1`, `apad`, `-video_track_timescale 12288`), and printed a 27-segment manifest per build.
  - Applied Act II causal reorder (`06 -> 08 -> 07 -> 09 -> 10`), shortened `Shot 13` to `4.2s` before `Flow_Bridge_13_14.mp4` (superseding H3 `13B`), inserted `Ep2_Shot_19B` (`Flow_Shot_19B.mp4`, Emily moonlit reflection), and fixed `Shot 16 (HK)` visual drift by muxing `Ep2_Shot_16_EN.mp4` video with `Ep2_Shot_16_HK.mp4` Cantonese audio.
  - Built both 27-segment Director's Cut Masters: `Episode_2_Hybrid_Master_HK.mp4` (`173M`, `206.463s`) and `Episode_2_Hybrid_Master_EN.mp4` (`183M`, `210.193s`).
- **Canon & Git Hygiene (`ep2_shots/flow/FLOW_PROMPTS_LOG.md`, `ep2_shots/storyboard.md`, `.gitignore`)**:
  - Created `FLOW_PROMPTS_LOG.md`, synced `storyboard.md` (preserving Shot 16 Victoria/Colossus/Maya/Finn canon), added `ep2_shots/flow/archive/` to `.gitignore`, and tracked `ep2_shots/11A.png`.

### [2026-11-15] - Episode 2 Retakes, Shot 13B Bridge & Bilingual Hybrid Masters Completed
- **MiniMax H3 Retakes & Bridge Generation (Colab A100)**:
  - Regenerated and saved `Ep2_Shot_10_HK/EN.mp4`, `Ep2_Shot_14_HK/EN.mp4`, and `Ep2_Shot_18_HK/EN.mp4` using the Barnaby non-speaking prompt refinements in `first_frame` mode (`1344x768`).
  - Generated `Ep2_Shot_13B_HK.mp4` (`ep2_shots/13.png` + `prompt_13b.txt`) and duplicated to `Ep2_Shot_13B_EN.mp4` as the shared non-dialogue Taekwondo 3-hit combo bridge.
  - Colab A100 runtime stopped cleanly upon completion (`0 active assignments`, `425.73 CU` remaining).
- **Bilingual Hybrid Master Assembly (`ep2_shots/assemble_ep2.sh`)**:
  - Installed `ffmpeg` & `ffprobe` in WSL and assembled both full-episode masters combining 138% H3 punch-ins, silence trimming, 3 Google Flow overrides (`Flow_Shot_11/15/20.mp4`), and 2 Google Flow transitions (`Flow_Bridge_09_10.mp4`, `Flow_Bridge_15_16.mp4`):
    - `Episode_2_Hybrid_Master_HK.mp4` (`161M`, `194.127667s`)
    - `Episode_2_Hybrid_Master_EN.mp4` (`174M`, `197.857667s`)

### [2026-11-15] - Barnaby Non-Speaking Retake Prompts, Shot 13B Action Bridge & Flow Hybrid Assembler Setup
- **Prompt Refinements (`ep2_shots/prompt_10*.txt`, `prompt_14*.txt`, `prompt_18*.txt`)**:
  - Restructured spatial and subject phrasing to prevent MiniMax H3 from assigning spoken lip-sync to Barnaby (keeping `a quiet orange ape` / `an orange ape` brief and separated from dialogue speakers).
- **New Action Bridge (`Ep2_Shot_13B` / `ep2_shots/prompt_13b.txt`)**:
  - Added a non-dialogue Taekwondo 3-hit combo bridge starting from `ep2_shots/13.png` where Chloe Han drives The Colossus backward directly beneath the giant crystal chandelier to connect seamlessly into `Ep2_Shot_14`.
- **Google Flow & Hybrid Assembly (`ep2_shots/flow/`, `ep2_shots/assemble_ep2.sh`, `.gitignore`)**:
  - Moved the 5 Google Flow overrides/bridges (`Flow_Shot_11.mp4`, `Flow_Shot_15.mp4`, `Flow_Shot_20.mp4`, `Flow_Bridge_09_10.mp4`, `Flow_Bridge_15_16.mp4`) into `ep2_shots/flow/`.
  - Added `ep2_shots/assemble_ep2.sh` (FFmpeg 138% punch-in + silence trimming + Flow override audio muxing + Flow Start-to-End bridge insertion) and updated `.gitignore` to ignore `ep2_edited_clips/`.
  - Synced `ep2_shots/storyboard.md` Section 2 & Section 3 routing table with `Ep2_Shot_13B`, Flow bridges/overrides, and updated prompt dialogue.

### [2026-11-14] - Storyboard Canon & Prompt Synchronization Audit (`ep2_shots/storyboard.md`)
- **Full Alignment with Final Keyframes (`1.png`–`20.png`) & Video Prompts (`prompt_1`–`prompt_20_hk`)**:
  - `Ep2_Shot_01` (Section 1 Overview & Section 4 Keyframe Prompt): Replaced remaining `100% deadpan earnestness` / `deadpan serious gaze` with `a warm, confident, radiant smile and earnest focus`.
  - `Ep2_Shot_02` (Section 2 & Section 3 Routing Table): Aligned Naomi's prop anchors cleanly to her rose-gold lipstick micro-taser and compact-mirror signal decoder held from her small pink crossbody handbag (`--mode first_frame`).
  - `Ep2_Shot_03` (Section 2 Title, Anchors & Dialogue): Updated heading to「戰術鉤爪手槍罵戰」and aligned Oliver & Saffron's visual/dialogue anchors strictly to `3.png` and `prompt_3.txt` / `prompt_3_hk.txt`.
  - `Ep2_Shot_17` & `Ep2_Shot_18` (Section 2 Anchors, Dialogue & Section 3 Routing Table): Aligned Griz's floor-length repair bill, Oliver cradling the smoking matte-black tactical pistol, Finn's right-side framing, and unified `--mode first_frame (~1 CU)` routing for `Ep2_Shot_02`, `Ep2_Shot_17`, and `Ep2_Shot_18`.

### [2026-11-14] - Episode 2 Production Completed (Act IV Videos 17–20 HK & EN Done; 40/40 Complete)
- **MiniMax H3 Video Generation (Colab A100)**:
  - Generated and saved all 8 bilingual `.mp4` videos for Act IV (`Ep2_Shot_17_HK/EN` – `Ep2_Shot_20_HK/EN`) using `ep2_shots/17.png`–`20.png` in `first_frame` mode.
  - Verified all 40 Episode 2 videos (`Ep2_Shot_01_HK/EN` – `Ep2_Shot_20_HK/EN`) across Acts I–IV are complete locally.
  - Colab A100 runtime automatically disconnected upon completion (`0 active assignments`, `446.72 CU` remaining).

### [2026-11-14] - Act IV Keyframes (17.png–20.png) Standardized & Bilingual Prompts Created
- **Keyframe Standardization & Renaming (`ep2_shots/`)**:
  - `Post-Mission Repair Bill Blues.png` ➔ `ep2_shots/17.png` (`Ep2_Shot_17`)
  - `Futuristic Command Centre Celebration.png` ➔ `ep2_shots/18.png` (`Ep2_Shot_18`)
  - `Command Centre_ Wings on the Screen.png` ➔ `ep2_shots/19.png` (`Ep2_Shot_19`)
  - `Mastermind’s Amber Command Room.png` ➔ `ep2_shots/20.png` (`Ep2_Shot_20`)
  - All 20 Episode 2 keyframes (`1.png`–`20.png`) are now 100% complete (`Step 3 [DONE]`).
- **Video Prompts Created**:
  - Created all 8 bilingual video prompts for Act IV (`prompt_17.txt`–`prompt_20.txt` and `prompt_17_hk.txt`–`prompt_20_hk.txt`) aligned to the spatial framing of `17.png`–`20.png`, Maya's warm confident smile, and silent Barnaby.

### [2026-11-14] - Act III Bilingual Video Generation Completed (Shots 11–16 HK & EN)
- **MiniMax H3 Video Generation (Colab A100)**:
  - Generated and saved all 12 bilingual `.mp4` videos for Act III (`Ep2_Shot_11_HK/EN` – `Ep2_Shot_16_HK/EN`) using `ep2_shots/11.png`–`16.png` in `first_frame` mode (`32/40` Episode 2 videos now complete across Acts I–III).
  - Colab A100 runtime automatically disconnected upon completion (`0 active assignments`, `459.23 CU` remaining).

### [2026-11-14] - Act III Keyframes (11.png–16.png) Standardized & Bilingual Prompts Created
- **Keyframe Standardization & Renaming (`ep2_shots/`)**:
  - `The Colossus Storms the Golden Vault.png` ➔ `ep2_shots/11.png` (`Ep2_Shot_11`)
  - `Cathedral Showdown_ Sparks and Steel.png` ➔ `ep2_shots/12.png` (`Ep2_Shot_12`)
  - `Ballroom Clash_ The Flying Floral Kick.png` ➔ `ep2_shots/13.png` (`Ep2_Shot_13`)
  - `Chandelier Chaos in the Grand Ballroom.png` ➔ `ep2_shots/14.png` (`Ep2_Shot_14`)
  - `Moonlit Winged Assault in the Ruined Hall.png` ➔ `ep2_shots/15.png` (`Ep2_Shot_15`)
  - `Cybernetic Winged Heroine Deflects Colossal Axe.png` ➔ `ep2_shots/16.png` (`Ep2_Shot_16`)
- **Video Prompts Created**:
  - Created all 12 bilingual video prompts for Act III (`prompt_11.txt`–`prompt_16.txt` and `prompt_11_hk.txt`–`prompt_16_hk.txt`) aligned to the modern high-budget anime style, spatial framing of `11.png`–`16.png`, Maya's warm confident smile, and silent Barnaby.
- **Storyboard Alignment (`ep2_shots/storyboard.md`)**:
  - Updated `Ep2_Shot_14` descriptors from deadpan focus/pride to Maya's warm, confident, radiant smile.

### [2026-11-14] - Regenerated 10 Updated Videos (Shots 01, 03, 07, 08, 10 — HK & EN)
- **MiniMax H3 Video Regeneration (Colab A100)**:
  - Regenerated and overwrote all 10 bilingual `.mp4` videos for Shots **01, 03, 07, 08, and 10** (`Ep2_Shot_01_HK/EN`, `03_HK/EN`, `07_HK/EN`, `08_HK/EN`, `10_HK/EN`) using the updated `1.png`, `7.png`, `8.png` keyframes and upgraded prompts (Maya's warm confident smile, silent Barnaby, Naomi replacing civilians in Shot 08, clean tactical pistol in Shot 03, and pistol-banana handoff in Shot 10).
  - Colab A100 runtime automatically disconnected upon completion (`0 active assignments`, `478.2 CU` remaining).

### [2026-11-13] - 2020s Anime Style Upgrade, Character Rules & Storyboard/Prompt Alignment
- **Style Guide & Pipeline Upgrade (`prompts/style_guide.md`, `AGENTS.md`)**:
  - Upgraded Base Visual Style from 1990s flat cel-shading to **Modern high-budget 2020s anime key visual illustration** (Ufotable/Makoto Shinkai cinematic lighting, delicate thin lineart, volumetric lighting, glossy fabric & sheer pantyhose textures).
  - Documented the **Hybrid Image Pipeline** (Google Flow / Nano Banana staging draft ➔ ChatGPT 1:1 Master Style Upgrade).
- **Character Canon Rules (`bible/character_roster.md`)**:
  - Updated **Agent Maya Tachibana**'s signature demeanor to a warm, approachable, radiant and confident smile while earnestly doing silly things.
  - Added **STRICT AUDIO RULE** for **Barnaby** (non-speaking orangutan; keeps mouth closed during dialogue).
  - Added **CIVILIAN STATUS** lock for **Airi Fujimoto** and **Nia Vale** (non-combatant civilians excluded from tactical spy missions/vault battles).
- **Storyboard & Video Prompts Alignment (`ep2_shots/storyboard.md`, `ep2_shots/prompt_*.txt`)**:
  - Unified all keyframe and video prompts (`prompt_1`–`prompt_10`, EN & HK) to the modern high-budget anime style.
  - Updated `Ep2_Shot_08` and `Ep2_Shot_12` to replace civilians Airi & Nia with **Agent Naomi Brooks** and **Agent Evelyn Carter** alongside **Agent Isabella Chen**.
  - Updated `Ep2_Shot_10` action so Maya holds her pistol in her right hand with a warm smile and reaches her left hand backward for gear, only for silent Barnaby to hand her a banana.
- **Updated Keyframe First-Frames (`ep2_shots/1.png`, `7.png`, `8.png`)**:
  - Replaced `ep2_shots/1.png` (`Warm Smile, Steady Hold.png`), `ep2_shots/7.png` (`Maya and Barnaby’s Grand Hotel Arrival.png`), and `ep2_shots/8.png` (`Gala Balcony Toast at Dusk.png`) with upgraded modern 2020s anime keyframes aligned to the new character & style rules, completing the full prompt & keyframe upgrade.

### [2026-11-12] - Act II Keyframes Completed (8.png, 9.png, 10.png) & Video Prompts Prepared
- **Keyframe Standardization & Renaming**:
  - `Gala Balcony Toast Under Golden Light.png` ➔ `ep2_shots/8.png` (`Ep2_Shot_08`: VIP Champagne Balcony toast between Minister Helena Voss and Gideon Ward, with Isabella Chen, Airi Fujimoto, and Nia Vale).
  - `Ventilation Grille Chaos in the Palace.png` ➔ `ep2_shots/9.png` (`Ep2_Shot_09`: Saffron Sinclair and Dorian Marlowe wedged headfirst in golden air duct, Finn Calder dizzy under grille).
  - `Laser Corridor Showdown.png` ➔ `ep2_shots/10.png` (`Ep2_Shot_10`: Vault laser corridor with Agent Chloe Han, Maya & Barnaby behind defense barrel, Dorian & Saffron crashing on Finn).
- **Prompt Files Generated**:
  - Created bilingual video prompt files for all Act II shots (`prompt_6.txt`–`prompt_10.txt` in English and `prompt_6_hk.txt`–`prompt_10_hk.txt` in HK Cantonese) with `<Picture 1>` formatting and lip-sync dialogue under 30 characters.
- **Video Generation**:
  - Successfully generated and saved all 5 Cantonese Act II videos (`Ep2_Shot_06_HK.mp4` – `Ep2_Shot_10_HK.mp4`) in 8-step `first_frame` mode on Colab A100.
  - Successfully generated and saved all 5 English Act II videos (`Ep2_Shot_06_EN.mp4` – `Ep2_Shot_10_EN.mp4`).
  - Completed pending Act I English video (`Ep2_Shot_03_EN.mp4`). All 20 bilingual videos for Act I & Act II are now 100% complete and saved locally. Colab session stopped with 504.5 CU balance remaining.

### [2026-11-11] - Character Sheet Visual Audit (Dorian, Gideon, Helena) & Act II Keyframes (6.png, 7.png)
- **Dorian Marlowe**: Locked hair to `short tousled jet-black hair with side-swept bangs` (matches `Dorian Marlowe.png`); added explicit hair descriptor to every Dorian keyframe prompt in `ep2_shots/storyboard.md` (Shots 6, 9, 10, 12, 13, 18).
- **Gideon Ward**: Corrected to match `Gideon Ward.png` — age 39, 188 cm, messy swept-back dark brown hair, full beard, dark brown waxed-canvas field jacket over open gray shirt and black T-shirt, dark brown cargo trousers, brown field boots.
- **Helena Voss**: Corrected hosiery to `sheer nude pantyhose with small black polka dots` (matches `Helena Voss.png`).
- Added **Visual Descriptor Lock** rule to `AGENTS.md` Section 4.
- Added and standardized Act II 16:9 keyframes in `ep2_shots/`: `6.png` (`Ep2_Shot_06`: Red Carpet Entrance with Dorian, Saffron, Chloe, Finn) and `7.png` (`Ep2_Shot_07`: Gala Service Corridor Wine Barrel with Maya, Barnaby, Guards, Finn). Aligned Act II script, routing, and prompts in `ep2_shots/storyboard.md`.

### [2026-11-10] - Canonical Full Names Locked (Maya Tachibana, Saffron Sinclair, Marcus "Griz" Grisham) + Weapon/Gadget Refinement
- **Canonical Full Names Added (`bible/character_roster.md`, `ep2_shots/storyboard.md`)**:
  - **Agent Maya** ➔ **Agent Maya Tachibana (橘 瑪雅 / 瑪雅・橘)**
  - **Agent Saffron** ➔ **Agent Saffron Sinclair (薩芙蓉・辛克萊)**
  - **Commander Griz** ➔ **Commander Marcus "Griz" Grisham (馬庫斯・「葛瑞茲」・格里沙姆)** (`bible/character_sheets/Commander Griz.png`, upgraded to a clean single-character turnaround sheet with 6 facial expressions, tactical gear callouts, and stateless Continental Union profile, removing the old drifted female portraits and background flag).
- **Naomi Brooks (`bible/character_roster.md`, `ep2_shots/storyboard.md`, `prompt_2*.txt`)**: Replaced the unrealistic "giant grapple-launcher / full-sized riot shield pulled from a tiny pink handbag" with realistic, compact spy gadgets that fit inside her small pink crossbody handbag (rose-gold lipstick micro-taser, compact-mirror signal decoder, and palm-sized micro-EMP discs).
- **Agent Saffron Sinclair & Oliver Kade (`bible/character_roster.md`, `bible/character_sheets/Saffron Sinclair.png`, `ep2_shots/storyboard.md`, `prompt_3*.txt`)**: Retired the one-off "Banana Blaster" joke weapon and updated `Saffron Sinclair.png` (and `Maya Tachibana.png`) in `bible/character_sheets/`, standardizing Saffron's weapon to the **sleek matte-black custom multi-mode tactical pistol** (equipped with suppressed fire, stun darts, and a retractable micro-wire grappling hook). Updated `Ep2_Shot_03`, `Ep2_Shot_14`, and `Ep2_Shot_17` accordingly.

### [2026-11-10] - Episode 2 Act I Keyframes (1.png–5.png) & Video Prompts Added
- Added and renamed Act I 16:9 keyframes in `ep2_shots/`: `1.png` (`Ep2_Shot_01`), `2.png` (`Ep2_Shot_02`), `3.png` (`Ep2_Shot_03`), `4.png` (`Ep2_Shot_04`), and `5.png` (`Ep2_Shot_05`).
- Created English and HK Cantonese MiniMax H3 / Flow video prompt files (`prompt_1.txt`–`prompt_5.txt` and `prompt_1_hk.txt`–`prompt_5_hk.txt`) in `ep2_shots/`.

### [2026-11-08] - Episode 2 Full 20-Shot Storyboard Script + Dorian Marlowe Integration + Character Audit
- Completed **Step 2**: Expanded `ep2_shots/storyboard.md` into a full 20-shot script (`Ep2_Shot_01` to `Ep2_Shot_20`) with English & HK Cantonese lip-sync dialogue and Google Flow / MiniMax H3 routing table.
- Audited `bible/character_roster.md`, `bible/world_rules.md`, `prompts/style_guide.md`, and `ep2_shots/storyboard.md` against the official character sheets in `bible/character_sheets/`:
  - **Commander Griz**: Removed outdated "respirator mask / steam venting" references; locked in his clean-shaven, stern 190 cm tactical appearance (`Commander Griz.jpg`).
  - **Agent Maya**: Defined her core persona as an earnest airhead who projects an ultra-competent elite aura while doing silly things with 100% deadpan seriousness that succeed by sheer accident ("failing upwards / 一本正經做傻事卻錯有錯著"). Kept burgundy high heels as her default outfit anchor (not forcing shoeless prompts by default, while allowing occasional natural shoe-loss mishaps when fitting).
  - **Agent Chloe Han**: Updated hosiery anchor to match `Agent Chloe.jpg` (`sheer skin-tone stockings with a jeweled thigh garter strap and silver-white floral high heels`).
  - **Copyright-Clean Descriptions**: Replaced all third-party IP names in character docs with pure personality and comedic trait descriptions.
- Added and renamed `bible/character_sheets/Dorian Marlowe.png` and integrated **Dorian Marlowe / Mirror (多利安・馬洛／鏡像)** into `bible/character_roster.md` and `ep2_shots/storyboard.md` (completing all 5 new Episode 2 character slots and expanding the canonical roster to 20 characters).
- Added Section 5 (**End-to-End Episode Production Pipeline & Antigravity Prompt-Dispatch Protocol**) to `AGENTS.md`, defining the 4-step workflow where Antigravity proactively provides ready-to-copy prompts for ChatGPT, Gemini, Google Flow, and MiniMax H3 at each production stage.
- Added **Character Canon & Relationship Validation Rules** (Canon First, Relationship Lock, No Template Text Bleeding, Proposal vs. Canon) to `AGENTS.md` and `prompts/style_guide.md` to prevent layout reference text from bleeding into new character sheets (e.g., clarifying that Airi Fujimoto is Aoi's sister, while Nia Vale is an independent fashion student / gala assistant).
- Updated `bible/character_sheets/Nia Vale.png` with corrected profile text.

### [2026-11-07] - Centralization, Style Guide Split & 19-Character Roster Expansion
- Added and renamed 4 new character turnaround sheets in `bible/character_sheets/`: `Finn Calder.png`, `Nia Vale.png`, `Oliver Kade.png`, and `Gideon Ward.png`.
- Integrated 4 new characters into `bible/character_roster.md` (expanding roster to 19 characters): **Nia Vale (妮雅・維爾)**, **Finn Calder / Trigger (芬恩・考爾德)**, **Gideon Ward / The Broker (基甸・沃德)**, and **Oliver Kade / Patch (奧利佛・凱德)**.
- Updated `prompts/style_guide.md` to explicitly separate **Rule Set 1: 角色三視圖設定表 (Character Turnaround Sheets)** (`bible/character_sheets/`, multi-view reference layout with front/side/back views, 6 expressions, outfit/hosiery/footwear detail boxes, height ruler, and EN/JP profile card modeled after Airi Fujimoto & Helena Voss) vs. **Rule Set 2: 單幅 16:9 劇集分鏡圖 (Single-Frame 16:9 Episode Storyboard Keyframes)** (`ep1_shots/` & `ep2_shots/`, strictly single-frame 16:9 widescreen with no multi-panel grids for Flow & MiniMax H3).
- Added AGENTS.md, PLANNING_CHANGELOG.md, and bible/locations.md.
- Refined Character Personas (bible/character_roster.md):
  - Commander Griz: Clean-shaven, grizzled tactical commander who uses Maya and Saffron's unpredictability as a tactical weapon.
  - Agent Chloe Han (韓克洛伊): Upgraded to VIP Sixth Ranger / Ace specializing in lethal Taekwondo high-kick combat while keeping ladylike elegance.
  - Agent Saffron: Defined as the overconfident, dramatic senior operative whose flashy superspy stunts backfire into slapstick.
  - Agent Maya & Barnaby: Set the shoeless/tickle gag as their Episode 1 origin story; from Episode 2 onward, Barnaby is Maya's loyal guardian and slapstick partner-in-crime.
  - Specialist Trio Sparks: Added rivalry between Evelyn and Saffron, Naomi's bottomless pink tactical handbag + deadpan snark, and Isabella's smiling schemer/betting habit.
  - Expanded Roster (15 Characters): Integrated Victoria Parker (Raven, 10D light brown pantyhose), Emily Parker, Aoi Fujimoto, Elise Mori, Airi Fujimoto, Minister Helena Voss, and The Colossus under the stateless Continental Union setting.
