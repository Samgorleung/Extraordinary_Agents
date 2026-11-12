# Project Planning Roadmap & Changelog

## 1. Active Production Roadmap (目前計劃與待辦事項)

### Episode 1 Status: Completed / Archiving
- Core comedy setup established: Maya loses her shoes and meets Barnaby the orangutan during a chaotic infiltration; Saffron's overconfident superspy stunts backfire; Chloe Han steps in as the VIP Sixth-Ranger ace to clear the room with high-kick martial arts.
- Resulting Arc: Maya and Barnaby become inseparable best friends and partners from Episode 2 onward.

### Episode 2 Planning (In Progress — Step 3: Keyframe Generation)
- [DONE] **Step 1 (Character Roster & Turnaround Sheets)**: All 20 canonical characters locked in `bible/character_roster.md` and `bible/character_sheets/` (including Episode 2 debuts: `Oliver Kade.png`, `Finn Calder.png`, `Gideon Ward.png`, `Nia Vale.png`, and `Dorian Marlowe.png`).
- [DONE] **Step 2 (Full 20-Shot Storyboard & Script)**: Expanded `ep2_shots/storyboard.md` into the complete 20-shot script (`Ep2_Shot_01` – `Ep2_Shot_20`) with full visual anchors, bilingual dialogue (English & HK Cantonese), and Google Flow / MiniMax H3 dual-engine routing table.
- [IN PROGRESS] **Step 3 (Single-Frame 16:9 Keyframe Generation)**:
  - [DONE] Act I Keyframes (`ep2_shots/1.png` to `ep2_shots/5.png` for `Ep2_Shot_01` – `Ep2_Shot_05`) generated, standardized, and committed.
  - [DONE] Act II Keyframes (`ep2_shots/6.png` to `ep2_shots/10.png` for `Ep2_Shot_06` – `Ep2_Shot_10`) fully generated, standardized, and committed:
    - `6.png`: Red Carpet Rivals (Dorian & Saffron, Chloe, Finn).
    - `7.png`: Service Corridor Infiltration (Maya & Barnaby rolling router barrel, guards bowing, Finn peeking).
    - `8.png`: VIP Champagne Balcony (Helena Voss & Gideon Ward toast, Isabella & Airi, Nia in background).
    - `9.png`: Mezzanine Air Vent Standoff (Saffron & Dorian wedged in golden duct, Finn flattened by grille).
    - `10.png`: Laser Corridor Vault Approach (Chloe Han poised stance, Maya & Barnaby behind barrel, Dorian & Saffron crashed on Finn).
  - [TO-DO] Act III – Act IV Keyframes (`Ep2_Shot_11` – `Ep2_Shot_20`).
- [IN PROGRESS] **Step 4 (Dual-Engine Video Generation)**:
  - [DONE] Created English and HK Cantonese video prompt files for Act I (`ep2_shots/prompt_1.txt` – `prompt_5.txt` and `ep2_shots/prompt_1_hk.txt` – `prompt_5_hk.txt`).
  - [DONE] Created English and HK Cantonese video prompt files for Act II (`ep2_shots/prompt_6.txt` – `prompt_10.txt` and `ep2_shots/prompt_6_hk.txt` – `prompt_10_hk.txt`).
  - [DONE] Generated and saved all 5 Cantonese Act I videos (`Ep2_Shot_01_HK.mp4` – `Ep2_Shot_05_HK.mp4`) and 4 English Act I videos (`Ep2_Shot_01_EN`, `02_EN`, `04_EN`, `05_EN`).
  - [DONE] Generated and saved all 5 Cantonese Act II videos (`Ep2_Shot_06_HK.mp4` – `Ep2_Shot_10_HK.mp4`) and 4 English Act II videos (`Ep2_Shot_06_EN`, `07_EN`, `08_EN`, `09_EN`).
  - [IN PROGRESS] Rendering final 2 wrap-up videos on Colab A100 (`Ep2_Shot_10_EN.mp4` & `Ep2_Shot_03_EN.mp4`).

## 2. Changelog (更新日誌)

### [2026-11-12] - Act II Keyframes Completed (8.png, 9.png, 10.png) & Video Prompts Prepared
- **Keyframe Standardization & Renaming**:
  - `Gala Balcony Toast Under Golden Light.png` ➔ `ep2_shots/8.png` (`Ep2_Shot_08`: VIP Champagne Balcony toast between Minister Helena Voss and Gideon Ward, with Isabella Chen, Airi Fujimoto, and Nia Vale).
  - `Ventilation Grille Chaos in the Palace.png` ➔ `ep2_shots/9.png` (`Ep2_Shot_09`: Saffron Sinclair and Dorian Marlowe wedged headfirst in golden air duct, Finn Calder dizzy under grille).
  - `Laser Corridor Showdown.png` ➔ `ep2_shots/10.png` (`Ep2_Shot_10`: Vault laser corridor with Agent Chloe Han, Maya & Barnaby behind defense barrel, Dorian & Saffron crashing on Finn).
- **Prompt Files Generated**:
  - Created bilingual video prompt files for all Act II shots (`prompt_6.txt`–`prompt_10.txt` in English and `prompt_6_hk.txt`–`prompt_10_hk.txt` in HK Cantonese) with `<Picture 1>` formatting and lip-sync dialogue under 30 characters.
- **Video Generation**:
  - Successfully generated and saved all 5 Cantonese Act II videos (`Ep2_Shot_06_HK.mp4` – `Ep2_Shot_10_HK.mp4`) in 8-step `first_frame` mode on Colab A100.
  - Successfully generated and saved 4 English Act II videos (`Ep2_Shot_06_EN.mp4` – `Ep2_Shot_09_EN.mp4`).
  - Active batch running for the final 2 videos: `Ep2_Shot_10_EN.mp4` (Laser Corridor English) and `Ep2_Shot_03_EN.mp4` (Quartermaster Lab English).

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
