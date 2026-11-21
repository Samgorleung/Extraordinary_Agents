# Legacy Episode 1 Audit & Prompt Archive

> **Repository Sync Note**: This document consolidates all legacy Episode 1 `.mp4` clip metadata (`ffprobe`) and `prompt*.txt` scripts moved into `ep1_shots/Archive/`. Video binaries (`.mp4`, `.mov`) remain excluded from Git via `.gitignore`.

## 0. Archive & `.gitignore` Verification Summary

- **`.gitignore` Check**: Confirmed lines 1–2 of `.gitignore` globally ignore `*.mp4` and `*.mov` across all subdirectories (`git check-ignore -v` verified on `ep1_shots/Archive/*.mp4` and `.mov`).
- **Archived Media Assets (Git-ignored)**: **24 `.mp4` clips**
  - **22 Legacy 720p Clips**: `1280x720`, `h264`, `24 fps`, `aac` audio track present (`Clip_01` through `Clip_21`, including two `Clip_11` alternate takes).
  - **2 MiniMax H3 Combined Epilogue Clips**: `1344x768`, `h264`, `24 fps`, `aac` audio track present (`Clip_20_21_Epilogue.mp4` and `Clip_20_21_Epilogue_HK.mp4`).
- **Archived Text & Image Assets (Git-tracked in `ep1_shots/Archive/`)**:
  - **25 `.txt` prompt files**: 21 distinct non-empty prompts, 2 exact-duplicate prompt pairs (`prompt_clip11__Shot_4A.txt` = `prompt_clip_12_Shot_4A-1.txt`; `prompt_clip13_Shot_4A.txt` = `prompt_clip_13_Shot_4A-2.txt`), and 1 empty 0-byte file (`prompt_clip11_Shot_4B.txt`).
  - **3 Keyframe Images** moved from `ep1_shots/`: `5AB_1.jpg`, `5AB_2.jpg`, `5AB_3.jpg`.
- **Duration Totals**:
  - All 24 `.mp4` clips combined: `129.246s` (`02:09.25`)
  - Single-pass legacy 20-clip sequence (`Clip_01`–`Clip_10` + `Clip_12`–`Clip_21`, excluding the two `Clip_11` alternates and the two H3 Epilogues): `96.682s` (`01:36.68`)
  - Hybrid epilogue variant (swapping `Clip_20` + `Clip_21` [`12.074s`] for one `Clip_20_21_Epilogue[_HK].mp4` [`12.250s`]): `96.858s` (`01:36.86`)
- **Known Archive Quirks**:
  - No `Shot_4A-3` clip or prompt exists in the sequence (`Shot_4A-2` jumps directly to `Shot_4A-4`).
  - `Clip_11` contains two alternate takes (`Clip_11_-_Shot_4A-1__00631a05.mp4` and `Clip_11_-_Shot_4B__c305c048.mp4`); `prompt_clip11_Shot_4B.txt` is 0 bytes.

---

## 1. Archived Clip Inventory Table

| Filename | Duration | Resolution | Matching Prompt File |
| :--- | :---: | :---: | :--- |
| `Clip_01_-_Prologue_1__129c4ac9.mp4` | `4.032s` | `1280x720` | `prompt_clip01_Prologue_1.txt` |
| `Clip_02_-_Prologue_2__13dc9260.mp4` | `4.032s` | `1280x720` | `prompt_clip02_Prologue_2.txt` |
| `Clip_03_-_Shot_0A__6873ecf3.mp4` | `4.032s` | `1280x720` | `prompt_clip03_Shot_0A.txt` |
| `Clip_04_-_Shot_0B__8d0e2adc.mp4` | `4.032s` | `1280x720` | `prompt_clip04_Shot_0B.txt` |
| `Clip_05_-_Shot_1__40a7eb49.mp4` | `4.032s` | `1280x720` | `prompt_clip05_Shot_1.txt` |
| `Clip_06_-_Shot_2__2c0f0af8.mp4` | `4.032s` | `1280x720` | `prompt_clip06_Shot_2.txt` |
| `Clip_07_-_Shot_2A__91448095.mp4` | `4.032s` | `1280x720` | `prompt_clip07__Shot_2A.txt` |
| `Clip_08_-_Shot_2B__f4b1acf1.mp4` | `8.043s` | `1280x720` | `prompt_clip08_Shot_2B.txt` |
| `Clip_09_-_Shot_2C__0b312346.mp4` | `8.043s` | `1280x720` | `prompt_clip09_Shot_2C.txt` |
| `Clip_10_-_Shot_3A__a8e28fb5.mp4` | `4.032s` | `1280x720` | `prompt_clip10_Shot_3A.txt` |
| `Clip_11_-_Shot_4A-1__00631a05.mp4` | `4.032s` | `1280x720` | `prompt_clip11__Shot_4A.txt` *(alt take; duplicate text of `prompt_clip_12_Shot_4A-1.txt`)* |
| `Clip_11_-_Shot_4B__c305c048.mp4` | `4.032s` | `1280x720` | `prompt_clip11_Shot_4B.txt` *(0 bytes / empty file)* |
| `Clip_12_-_Shot_4A-1__ce868bd8.mp4` | `4.032s` | `1280x720` | `prompt_clip_12_Shot_4A-1.txt` *(duplicate text of `prompt_clip11__Shot_4A.txt`)* |
| `Clip_13_-_Shot_4A-2__8b8dfcf5.mp4` | `4.032s` | `1280x720` | `prompt_clip_13_Shot_4A-2.txt` *(duplicate text of `prompt_clip13_Shot_4A.txt`)* |
| `Clip_14_-_Shot_4A-4__b37c4fb3.mp4` | `4.032s` | `1280x720` | `prompt_clip14_Shot_4A-4.txt` |
| `Clip_15_-_Shot_4A-5__1cc06c52.mp4` | `4.032s` | `1280x720` | `prompt_clip15_Shot_4A-5.txt` |
| `Clip_16_-_Shot_4A-6__bd07e46e.mp4` | `4.032s` | `1280x720` | `prompt_clip16_Shot_4A-6.txt` |
| `Clip_17_-_Shot_4B__de51fde3.mp4` | `4.032s` | `1280x720` | `prompt_clip17_Shot_4B.txt` |
| `Clip_18_-_Shot_4C__106d789d.mp4` | `6.037s` | `1280x720` | `prompt_clip18_Shot_4C.txt` |
| `Clip_19_-_Shot_4D__e5052e6e.mp4` | `6.037s` | `1280x720` | `prompt_clip19_Shot_4D.txt` |
| `Clip_20_-_Shot_5A__cb59347b.mp4` | `6.037s` | `1280x720` | `prompt_clip20_Shot_5A.txt` |
| `Clip_21_-_Shot_5B__724e54ed.mp4` | `6.037s` | `1280x720` | `prompt_clip21_Shot_5B.txt` |
| `Clip_20_21_Epilogue.mp4` | `12.250s` | `1344x768` | `prompt.txt` *(MiniMax H3 EN combined Epilogue)* |
| `Clip_20_21_Epilogue_HK.mp4` | `12.250s` | `1344x768` | `prompt_hk.txt` *(MiniMax H3 HK Cantonese lip-sync Epilogue)* |

---

## 2. Full Archived Prompts (Chronological Order)

### 1. `Prologue_1` — `prompt_clip01_Prologue_1.txt`
```text
2D cel-shaded anime animation. Inside high-tech HQ command center, Commander Griz leans over glowing blue holographic map speaking into comms mic, then straightens up pointing at the map emphasizing strict stealth. Beside him, Agent Chloe sits gracefully in her floral dress and heels, taking a sip of tea and lowering her teacup onto her saucer with a serene smile. Smooth movement, 2D anime style, clean line art. Audio: holographic hum, radio static, tea cup saucer clink.
```

### 2. `Prologue_2` — `prompt_clip02_Prologue_2.txt`
```text
2D cel-shaded anime animation. Agent Maya stands on the dark warehouse roof ledge touching her comms earpiece with a cocky smirk, then lowers her hand and drops into a coiled pre-jump stance facing the window glass. Both burgundy high heels firmly on her pantyhose-clad feet. Smooth animation, 2D anime style, clean line art. Audio: radio beep, roof wind.
```

### 3. `Shot_0A` — `prompt_clip03_Shot_0A.txt`
```text
2D cel-shaded anime animation. Agent Maya leaps through a high warehouse window surrounded by shattered glass shards, dropping in mid-air as downward momentum pulls both of her burgundy high heels cleanly off her feet, leaving both feet shoeless in sheer pale brown pantyhose. Smooth aerial drop and shoe slip animation, 2D anime style, clean line art. Audio: glass shatter, air woosh, shoe slip.
```

### 4. `Shot_0B` — `prompt_clip04_Shot_0B.txt`
```text
2D cel-shaded anime animation. Agent Maya drops downward through the air with both feet strictly shoeless in sheer pale brown pantyhose and lands smoothly in a 2-point cool spy crouch on the concrete floor in front of her two detached burgundy high heels. Smooth landing animation, 2D anime style, clean line art. Audio: air woosh, landing thud on concrete.
```

### 5. `Shot_1` — `prompt_clip05_Shot_1.txt`
```text
2D cel-shaded anime animation. Agent Maya crouches in a cool hero landing pose on the concrete floor, but her cool composure crumbles a second later as the stinging foot pain hits her shoeless feet. She hunches forward clutching her knees with a teary-eyed wince of stinging foot pain. Both feet remain planted shoeless in sheer pale brown pantyhose in the exact same spot on the floor, and both detached burgundy high heels stay resting on the concrete floor to her right. Smooth expression shift and knee-clutching movement, 2D anime style, clean line art. Audio: dust settling, soft wince groan.
```

### 6. `Shot_2` — `prompt_clip06_Shot_2.txt`
```text
2D cel-shaded anime animation. Agent Maya takes a step forward on the concrete floor inside the dark warehouse, her pantyhose-clad right foot steps directly onto the intact yellow banana peel, slips forward, and she lands on her back on the concrete floor with her legs kicked up, dizzy spiral eyes. The banana peel squishes under her right sole. Both feet remain strictly shoeless in sheer pale brown pantyhose throughout, and both detached burgundy high heels stay in the exact same spot on the concrete floor behind her. Camera and horizon remain locked. Smooth 2D anime slip animation, clean line art. Audio: footsteps, banana squish FX, comic fall thud.
```

### 7. `Shot_2A` — `prompt_clip07__Shot_2A.txt`
```text
2D cel-shaded anime animation. Barnaby the orangutan reaches in and actively licks and pokes the yellow banana pulp on Agent Maya's right pantyhose-clad sole. Agent Maya's expression flips into helpless, teary-eyed anime tickle laughter—she tilts her head back laughing, covers her mouth, and her toes curl in tickling agony. Both feet remain strictly shoeless in sheer pale brown pantyhose in the exact same spot on the floor, and both detached burgundy heels stay resting on the concrete floor to her right. Smooth expression shift and tickle animation, 2D anime style, clean line art. Audio: licking squish FX, burst of laughter.
```

### 8. `Shot_2B` — `prompt_clip08_Shot_2B.txt`
```text
2D cel-shaded anime animation. Inside high-tech HQ command center, the holographic table flashes red. During the first half of the clip, Commander Griz speaks rapidly and animatedly into his comms microphone with active lip-sync mouth movement while looking at the red holographic alert as Chloe sits listening calmly. In the second half of the clip, Griz points sharply toward the exit at normal human speed while Chloe smoothly rises from her chair holding her smoke-launcher. Smooth natural motion pacing, 2D anime style, clean line art. Audio: holographic alarm hum, rapid comms speech, chair rustle.
```

### 9. `Shot_2C` — `prompt_clip09_Shot_2C.txt`
```text
2D cel-shaded anime animation. In the sleek HQ armory corridor, Agent Saffron (black halter dress, garter stockings, black heels) holds a compact grapple pistol cleanly at her side. She touches her left-ear comms earpiece with her left hand, nodding and speaking calmly into her mic with a sharp, professional smirk. Pacing for 8s clip: during the first half of the clip, she inspects her grapple pistol with a confident spy expression; in the second half, she touches her earpiece and speaks into comms with active lip-sync mouth movement. Smooth natural motion pacing, 2D anime style, clean line art. Audio: footsteps, comms click beep, confident dialogue voice.
```

### 10. `Shot_3A` — `prompt_clip10_Shot_3A.txt`
```text
2D cel-shaded anime animation. Agent Maya is laughing hysterically on the concrete floor as Barnaby pokes her pantyhose-clad right foot, but bright tactical flashlight beams suddenly cut through the warehouse darkness from above. Maya's laughing expression instantly shatters into a wide-eyed, horrified gasp and scream with both hands slapped over her open mouth, while Barnaby looks up startled toward the light. Both feet remain strictly shoeless in sheer pale brown pantyhose in the exact same spot, the squished yellow banana peel and pulp stay on her right sole and floor, and both detached burgundy heels stay resting on the concrete floor. Smooth expression shift and lighting transition, 2D anime style, clean line art. Audio: laughter transitioning to horrified scream gasp, flashlight click.
```

### 11. `Shot_4A-1` — `prompt_clip11__Shot_4A.txt` & `prompt_clip_12_Shot_4A-1.txt` *(identical duplicates)*
```text
2D cel-shaded anime animation. No Chloe in frame. A glowing pink smoke rocket enters from the left at chest level and streaks directly toward the two background guards, exploding into a thick low cloud of pink and white stun-smoke that knocks both guards flat onto the concrete floor with their rifles dropped beside them. Agent Maya and Barnaby watch in amazed relief from the floor. Maya remains strictly shoeless in sheer pale brown pantyhose with yellow banana pulp on her right sole. Smooth rocket flight and explosion animation, 2D anime style, clean line art. Audio: rocket flying whoosh, pink smoke explosion, guard knockout thud.
```

### 12. `Clip_11 / Shot_4B (Alt)` — `prompt_clip11_Shot_4B.txt`
*(Empty file — 0 bytes. Corresponding video file: `Clip_11_-_Shot_4B__c305c048.mp4`.)*

### 13. `Shot_4A-2` — `prompt_clip13_Shot_4A.txt` & `prompt_clip_13_Shot_4A-2.txt` *(identical duplicates)*
```text
2D cel-shaded anime animation. The two background guards lie knocked out in pink stun-smoke. Agent Chloe steps gracefully into the frame in her blue and white floral dress and high heels, lifting her smoking launcher over her right shoulder with pinky extended and smiling smugly while blowing a tiny puff of smoke off the nozzle. Agent Maya remains in the exact same spot propped on the floor, both feet strictly shoeless in sheer pale brown pantyhose with yellow banana pulp on her right sole, two detached burgundy heels resting on the concrete floor. Smooth entrance and smug pose animation, 2D anime style, clean line art. Audio: footsteps, smoke launcher poof, gentle puff of smoke.
```

### 14. `Shot_4A-4` — `prompt_clip14_Shot_4A-4.txt` *(Note: no `Shot_4A-3` exists in archive)*
```text
2D cel-shaded anime animation. Agent Saffron stands puffing her chest out in a proud superhero pose on a high steel catwalk, but four armed guards emerge behind her. Saffron's proud pose shatters in comical terror: her eyes bug out, hands thrown up in shock, as she turns and bolts down the catwalk. Smooth motion, 2D anime style, clean line art. Audio: proud laugh, sudden panic gasp, scurrying footsteps.
```

### 15. `Shot_4A-5` — `prompt_clip15_Shot_4A-5.txt`
```text
2D cel-shaded anime animation. Tracking shot along high steel catwalk. Agent Saffron (long black dress, garter stockings, black heels) sprints frantically in sheer panic with four guards chasing behind firing tracer streaks over her head. Saffron clumsily stumbles forward into an awkward duck, causing all shots to miss her high in the air. Fast punchy slapstick animation, 2D anime style, clean line art. Audio: footsteps, laser gunfire, goofy ducking gasp.
```

### 16. `Shot_4A-6` — `prompt_clip16_Shot_4A-6.txt`
```text
2D cel-shaded anime animation. At the end edge of high steel catwalk, Agent Saffron's feet get completely tangled in a loose zipline rope loop as she pitches off the open edge, sliding rapidly downward along the zipline cable dangling upside-down by her ankles and screaming in comical panic as the four guards sprint forward. Fast punchy slapstick animation, 2D anime style, clean line art. Audio: footsteps, rope snag, zipline whir, screaming gasp.
```

### 17. `Shot_4B` — `prompt_clip17_Shot_4B.txt`
```text
2D cel-shaded Japanese anime animation. Agent Chloe stands on the left. Agent Saffron (long black dress, garter stockings) ziplines in from above shouting to help with rope around her ankles, but crashes head-first into Barnaby and Maya, causing Saffron, Maya, and Barnaby to collide and get knocked out cold on the floor in a dizzy pile. Agent Chloe gracefully sidesteps unharmed to the left, resting her launcher over her shoulder and placing her hand on her forehead in an exasperated deadpan facepalm sigh. Agent Maya remains strictly shoeless in sheer pale brown pantyhose with yellow banana pulp on her right sole. Smooth zipline crash and sidestep sigh animation, 2D anime style, clean line art. Audio: zipline whir, crash thud, deep deadpan sigh.
```

### 18. `Shot_4C` — `prompt_clip18_Shot_4C.txt`
```text
2D cel-shaded anime animation. Agent Chloe stands facing and aiming LEFT, firing a controlled burst from her submachine gun with a bright yellow muzzle flash pointing LEFT toward the stairs, disarming the guards whose rifles drop to the floor. Agent Maya (shoeless in pantyhose) and Saffron remain locked on the right floor. Smooth submachine gun firing animation, 2D anime style, clean line art. Audio: SMG gunfire burst, disarmed rifle clatter.
```

### 19. `Shot_4D` — `prompt_clip19_Shot_4D.txt`
```text
2D cel-shaded anime animation. As the last two guards lunge at Chloe from the left in close quarters, Agent Chloe drops into a martial arts stance and performs a poised Kung Fu high side-kick to the left in her high heel and an open-palm strike, knocking both charging guards backward off their feet simultaneously. Agent Chloe remains completely composed. On the right floor, Agent Maya (shoeless in pantyhose), Saffron (black dress and heels), and Barnaby cheer with starry-eyed amazement and happy anime sparkles! Smooth martial arts action and cheering animation, 2D anime style, clean line art. Audio: martial arts strike woosh, guard knockout thud, cheering sparkles.
```

### 20. `Shot_5A` — `prompt_clip20_Shot_5A.txt`
```text
2D cel-shaded anime animation. Agent Chloe smiles serenely while speaking into her comms earpiece in her blue and white floral dress and high heels. On the right floor, Barnaby the orangutan leans his long arm and finger forward mischievously with a banana right next to the squished yellow banana pulp on Maya's pantyhose sole, while Agent Maya's eyes widen in sudden shock and realization with both hands raised. Saffron watches beside them in her black dress and black heels. All 4 feet remain locked on the floor. Smooth comms speech and realization expression animation, 2D anime style, clean line art. Audio: radio comms beep, shocked gasp.
```

### 21. `Shot_5B` — `prompt_clip21_Shot_5B.txt`
```text
2D cel-shaded anime animation. Barnaby's fingers directly poke and tickle the yellow banana pulp on Maya's shoeless pantyhose sole on the floor—Agent Maya bursts into helpless, hysterical anime tickle-laughter in the rope pile with tears in her eyes and toes curling in ticklish agony, both feet strictly shoeless in sheer pale brown pantyhose. Saffron facepalms and groans in the rope pile beside her in her black dress and black high heels. In the center-left, Agent Chloe gives an elegant, smug wink to the camera in her blue and white floral dress and high heels. Flattened banana peel and two detached burgundy heels stay resting on the floor. All 4 feet remain locked in low floor positions. Smooth tickle laughter, facepalm, and wink animation, 2D anime style, clean line art. Audio: poking squish FX, burst of laughter, facepalm groan, anime wink sparkle.
```

### 22. `Epilogue (MiniMax H3 EN)` — `prompt.txt`
```text
Anime action-comedy scene inside a dimly lit warehouse. On the left, the elegant woman in the blue-and-white floral dress and white high heels speaks calmly into her earpiece with a composed smile, then lowers her hand and gives a playful, confident wink toward the camera. On the right, the brown-haired woman in the red sleeveless top sits on the floor with both shoeless pantyhose-clad feet resting in front of her next to the woman in the black halter dress and black high heels. The large orangutan sitting behind them grins mischievously, holds a peeled yellow banana in one hand, and reaches his other long arm down to playfully poke and tickle the banana-covered sole of the brown-haired woman's shoeless pantyhose foot. The brown-haired woman's eyes widen in sudden surprise before she bursts into helpless, hysterical laughter while the woman in the black dress facepalms and groans. Keep all four legs and feet clearly separated on the floor.
```

### 23. `Epilogue (MiniMax H3 HK Cantonese)` — `prompt_hk.txt`
```text
Starting from <Picture 1>, anime action-comedy scene inside a dimly lit warehouse. On the left, the elegant woman in the blue-and-white floral dress and white high heels speaks calmly into her earpiece in natural Hong Kong Cantonese, saying clearly: "報告總部，呢度情況已經搞掂晒！" with a composed smile, then lowers her hand and gives a playful, confident wink toward the camera. On the right, the brown-haired woman in the red sleeveless top sits on the floor with both shoeless pantyhose-clad feet resting in front of her next to the woman in the black halter dress and black high heels. The large orangutan sitting behind them grins mischievously, holds a peeled yellow banana in one hand, and reaches his other long arm down to playfully poke and tickle the banana-covered sole of the brown-haired woman's shoeless pantyhose foot. The brown-haired woman's eyes widen in sudden surprise before she bursts into helpless, hysterical laughter and shouts in Hong Kong Cantonese: "好痕呀！唔好搞我隻腳呀！" while the woman in the black dress facepalms and groans. Keep all four legs and feet clearly separated on the floor.
```

---

## 3. Legacy Episode 1 Plot Beats, Dialogue & Continuity Notes for Ep2 Bridge

### Plot Beats
- **Briefing (`Prologue_1`)**: Inside high-tech HQ, Commander Griz leans over a blue holographic map stressing strict stealth over comms, while Agent Chloe sits calmly sipping tea with a serene smile.
- **Roofs & Forced Entry (`Prologue_2` ➔ `Shot_0A`–`0B`)**: On the dark warehouse roof, Maya confirms over comms with a cocky smirk, leaps through a high window in shattering glass, loses both burgundy heels in mid-air descent (`Shot_0A`), and lands in a two-point spy crouch barefoot in sheer pale-brown pantyhose ahead of her detached heels (`Shot_0B`).
- **Landing Fail & Banana-Tickle Gag (`Shot_1` ➔ `Shot_2`–`2A`)**: Maya's cool spy pose breaks a second later as foot pain hits and she clutches her knees (`Shot_1`); stepping forward shoeless onto an intact banana peel, she slips onto her back with dizzy spiral eyes and banana pulp on her right sole (`Shot_2`). Barnaby the orangutan appears, licking and poking the banana-coated sole until Maya dissolves into helpless tickle laughter (`Shot_2A`).
- **HQ Alert & Backup Dispatch (`Shot_2B`–`2C`)**: The HQ hologram flashes red; Griz urgently radios over comms and points toward the exit while Chloe rises with her smoke-launcher (`Shot_2B`). In the sleek HQ armory corridor, Agent Saffron inspects her compact grapple pistol and reports in over comms with a sharp smirk (`Shot_2C`).
- **Compromised Cover & Chloe's Entrance (`Shot_3A` ➔ `Shot_4A-1`–`4A-2`)**: Tactical flashlights pierce the warehouse as guards spot Maya and Barnaby mid-laugh (`Shot_3A`). Before guards can act, a pink stun-smoke rocket streaks in from the left and knocks both guards out cold (`Shot_4A-1`); Chloe glides into frame, launcher over her shoulder, blowing a tiny puff of smoke (`Shot_4A-2`).
- **Saffron's Catwalk Disaster (`Shot_4A-4`–`4A-6` ➔ `Shot_4B`)**: Above on the steel catwalk, Saffron strikes a superhero pose only for four armed guards to emerge behind her (`Shot_4A-4`). She bolts under laser tracer fire, stumbles into an accidental dodge (`Shot_4A-5`), catches her ankles in a loose zipline rope, plunges off the catwalk screaming upside-down (`Shot_4A-6`), and crashes head-first straight into Maya and Barnaby in a dizzy heap while Chloe serenely sidesteps with a deadpan facepalm (`Shot_4B`).
- **Chloe Solos the Remaining Guards (`Shot_4C`–`4D`)**: Facing left toward the stairs, Chloe fires a controlled SMG burst disarming the guards (`Shot_4C`), then defeats the last two lunging guards in close quarters using a poised high-heel Kung Fu side-kick and open-palm strike while Maya, Saffron, and Barnaby cheer with anime sparkles (`Shot_4D`).
- **Epilogue Report & Tickle Callback (`Shot_5A`–`5B` / H3 `Epilogue` & `Epilogue_HK`)**: Chloe serenely reports mission completion into her comms earpiece and winks at the camera; beside her on the floor, Barnaby mischievously pokes the banana pulp on Maya's shoeless sole with a peeled banana, sending Maya into hysterical laughter while Saffron groans and facepalms.

### Recorded Dialogue Lines
- **Legacy Clips 01–21 (`1280x720`)**: No scripted spoken lines written in the prompts (comms speech and yells are depicted visually with SFX markers only in `Prologue_1`, `Shot_2B`, `Shot_2C`, `Shot_4B`, `Shot_5A`).
- **MiniMax H3 HK Epilogue (`prompt_hk.txt`, `Clip_20_21_Epilogue_HK.mp4`)**:
  - **Chloe Han**: `"報告總部，呢度情況已經搞掂晒！"`
  - **Maya Tachibana**: `"好痕呀！唔好搞我隻腳呀！"`

### Continuity & Upgrade Gaps to Bridge into Episode 2
1. **Cast & Worldbuilding Expansion**: Legacy Ep1 features only 5 characters (Griz, Chloe, Maya, Barnaby, Saffron). Rebuilt Ep1 should establish early Continental Union worldbuilding, how Barnaby ended up paired with Maya, and optional Act IV / Epilogue hooks introducing Episode 2 figures (e.g., Emily Parker searching for Victoria/Raven, Oliver Kade at HQ armory, Finn Calder's briefing banter, or hints of Helena Voss & Gideon Ward's syndicate leak behind the warehouse arms cache).
2. **Audio/Visual Parity**: Upgrading legacy `1280x720` silent/SFX-only 4–8s beats into Episode 2's hybrid pipeline (`1344x768` MiniMax H3 bilingual EN/HK lip-sync dialogue shots + Google Flow Omni 1.2 action/comedy transitions) will eliminate abrupt silent cuts and preserve consistent character design anchors from `bible/character_roster.md`.
