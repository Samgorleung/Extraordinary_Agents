# Global Style & Dual-Engine Production Rules

## 1. Image Generation Rules: Two Distinct Formats (ChatGPT / Meta AI Muse / Nano Banana 2.1)

- **Base Visual Style (Applies to All Art)**: Modern high-budget 2020s anime key visual illustration (Ufotable and Makoto Shinkai cinematic lighting style), ultra-detailed digital painting, delicate thin lineart, soft multi-layered gradient shading, volumetric lighting, ray-traced floor reflections, and natural semi-matte 15-denier sheer nylon textures (no oily glare). Strictly NO 1990s flat cel-shading or thick comic ink outlines.
- **Stateless World Rule**: Continental Union alternate-modern setting; NO real-world national flags, country names, or unintended watermark text.

### Rule Set 1: 角色三視圖設定表 (Character Turnaround Sheets — 存入 `bible/character_sheets/`)
- **Purpose**: Official character design reference sheets used to lock in visual identity across all AI tools.
- **Required Multi-View Reference Sheet Layout** (strictly following the template standard of **Airi Fujimoto** and **Helena Voss**):
  1. **Full-Body 3-View Turnaround (全身正、側、背面三視圖)**: Full-body **Front, Side, and Back** views standing on a clean reference baseline.
  2. **6 Facial Expression Close-Ups (6種表情特寫)**: 6 distinct head/shoulder portraits showcasing core personality emotions (e.g., neutral, smirk/smile, serious/angry, surprised, flustered/embarrassed, signature expression).
  3. **Outfit, Footwear, Hosiery & Accessory Detail Callout Boxes (服裝鞋襪配件細節框)**: Zoomed-in inset boxes highlighting signature garments, hosiery/pantyhose texture & denier (e.g., 10D light brown sheer, black dotted sheer, fishnet, sheer light-brown tights, white thigh-highs), high heels/boots, and signature props/weapons.
  4. **Height Scale Ruler (身高比例尺)**: Vertical metric height scale bar (cm) alongside the full-body turnaround views.
  5. **English / Japanese / Chinese Profile Info Card (簡介卡)**: Clean typography block displaying the character's Name, Codename/Title, Age, Height, Affiliation, and key visual/personality notes.
- **Character Canon & Relationship Validation Rules (角色正史與親屬關係防呆守則 — 必讀)**:
  1. **Canon First (正史優先)**: All character bios, affiliations, and relationships MUST strictly follow `bible/character_roster.md`.
  2. **Relationship Lock (關係鎖定)**: NEVER invent or mix up family/blood relationships (e.g., **Nia Vale is NOT Aoi Fujimoto's sister**—**Airi Fujimoto** is Aoi's younger sister, and **Emily Parker** is **Victoria Parker**'s younger sister; Nia Vale is only a fashion-community acquaintance of Airi).
  3. **No Template Text Bleeding (嚴禁排版參考圖文字滲漏)**: When using an existing character sheet (such as `Airi Fujimoto.png` or `Helena Voss.png`) as a visual layout reference, **NEVER copy over the reference character's family relationships, bio text, or personality traits** onto the new character's sheet. Every text block must be written specifically for the new character.
  4. **Proposal vs. Canon (提案與正史分界)**: Any newly brainstormed lore or relationships by an AI must first be marked as `PROPOSED` and only added to `bible/character_roster.md` or printed on official character sheets after creator approval.

### Rule Set 2: 單幅 16:9 劇集分鏡圖 (Single-Frame 16:9 Episode Storyboard Keyframes — 存入 `ep1_shots/` 或 `ep2_shots/`)
- **Purpose**: Shot-by-shot keyframe images generated specifically as input frames for **Google Flow** and **MiniMax H3** video generation (or single-scene character concept previews).
- **CRITICAL SINGLE-FRAME RULE**: Strictly generate **individual, single-frame 16:9 widescreen (1920×1080) full-bleed images** for each shot. **NEVER** combine multiple views, panels, inset callout boxes, character sheets, or split-screen grids into an episode keyframe.
- **Close-Up Anti-3D Rule**: For close-up inserts of hands, feet, shoes, or props where faces are not visible, explicitly enforce: `modern 2020s anime key visual illustration with delicate thin lineart, non-photorealistic, no 3D CGI rendering or realistic skin textures`.
- **Footwear & Limb Clarity**:
  - **Default Outfit Anchor**: By default, Agent Maya wears her burgundy/dark-red high heels with sheer pale brown pantyhose (do not include shoeless/tickling keywords as default prompt boilerplate; only include a natural shoe-loss mishap if a specific scene calls for it).
  - **AI Content Filter Balance**: To avoid false-positive safety blocks on image/video platforms, focus prompts on **action-comedy & earnest slapstick** (Maya doing silly things with deadpan elite poise, banana-peel slips, mixed-up gadgets, and chain-reaction collisions) rather than explicit foot-tickling/licking keywords.
  - When multiple characters are on the floor, state: `Keep all legs and feet clearly separated on the floor`.

### Rule B — Hybrid Keyframe Pipeline, Semi-Matte 15D Hosiery & ChatGPT Anti-Trap Standards
- **Maya 絲襪定色與質感標準（柔霧 15D、去油光、防變赤腳／防變黑絲）**: Strictly **NEVER** use `barefoot` (causes ChatGPT to render bare skin + exposed toenails), **NEVER** use `coffee-brown` or `cocoa-brown` (darkens into sheer black under moonlit/dark warehouse lighting), and **NEVER** stack `glossy`, `satin nylon sheen`, or `crisp vertical specular highlights` (causes oily plastic glare on legs/suits). Always write verbatim:
  `subtle semi-matte 15-denier sheer light nude-beige nylon pantyhose (warm light skin-toned beige, strictly NOT black, charcoal, grey, or dark brown), with natural soft diffused fabric shading along the leg contours and smooth translucent nylon seamlessly encasing the feet and toes (no oily glare, no bare skin texture, no exposed toenails)`
- **ChatGPT 生圖 4 大防伏標準 (ChatGPT Anti-Trap Standards)**:
  1. **嚴禁負面詞反效果 (No Negative-Word Backfire)**: Never write `NO yellow gun` or `NO bananas` in weapon locks (ChatGPT often draws the forbidden yellow item); use pure positive locking instead: **`a sleek solid matte-black prototype compact tactical pistol`**.
  2. **H3 對白首幀嚴禁 `motion blur` (Zero Motion Blur on Dialogue Keyframes)**: All MiniMax H3 dialogue keyframes (e.g., `12.png`) MUST enforce **`crisp sharp focus throughout with zero motion blur`** and clearly visible frontal faces so H3 lip-sync does not blur character faces.
  3. **多角色警報場口控色 (Balanced Studio Lighting in Red-Alert Scenes)**: Red-alert HQ scenes (e.g., `06.png`) MUST specify **`balanced clean anime studio lighting`** on characters' faces and foregrounds, confining crimson red alarm illumination strictly to background walls and holographic screens (prevents the entire frame washing out in solid red).
  4. **男裝／戰術服裝去膠感 ＋ Barnaby 閉嘴防搶嘴 (Matte Tactical/Wool Fabrics & Closed-Mouth Barnaby)**: Always specify **`matte black tactical combat vest`** (Commander Griz) and **`matte tailored dark charcoal wool formal suit`** (Gideon Ward) to avoid plastic-shine artifacts; on Barnaby H3 keyframes (`07, 12, 14, 15.png`), explicitly state **`with his mouth gently closed`** to prevent MiniMax H3 voice-stealing.
- **Meta AI Muse 實戰定位與 3 大防伏鐵則（Co-Primary Keyframe Illustrator，Episode 3 起正式啟用，亦可用作 Ep 1 單鏡補救）**:
  - **核心定位**：與 **ChatGPT** 並列為**雙主力 16:9 靜態底圖繪師（Co-Primary Keyframe Illustrator）**，另兼顧前期場景概念圖與 IG/Threads/WhatsApp 宣發素材。
  - **何時優先選用 Muse（避開 ChatGPT 審查痛點與額度瓶頸）**：
    1. 凡涉及**喜劇肢體互動、絲襪赤腳特寫、鉤爪纏繞**等容易觸發 ChatGPT 誤判審查（Fetish / Harassment guardrails）嘅場口，直接優先改用 Meta AI Muse 生成初圖。
    2. 當 ChatGPT 生圖額度緊張時，由 Muse 承接 Episode 3+ 場景概念圖及多角色初稿。
  - **Muse 實戰 3 大防伏鐵則（基於 Ep 1 `14.png` 實測）**：
    1. **必做「鞋隻數量」檢查**：Muse 初圖有時會出現「人物腳上著住一對、地下又多畫一對」嘅高跟鞋分身問題，出圖後必須即場檢查，發現分身就要求 Muse 原地微調刪除或交 **Nano Banana 2.1** 清理。
    2. **原地對話微調鎖定細道具**：Muse 支援極高一致性嘅對話式局部修圖並具自我 QC 意識，但每次落改圖指令時，**必須同時明確列出要原封不動保留嘅場內小型道具**（例如：`keep Chloe's silver heels and the yellow banana peel on the floor unchanged`），防止微調時誤刪配角物件。
    3. **最後質感把關**：若 Muse 出圖嘅絲襪質感仍未夠統一，最後交由 Google Flow **Nano Banana 2.1（0 credits）** 做統一收尾。
- **Nano Banana 2.1「0-Credit 局部修圖」流程**: When a ChatGPT or Meta AI Muse image renders hosiery too bare or too black, OR leaves duplicate shoes / pose breaks (e.g., `10.png` / `13.png` / `14.png`), use Google Flow with **Nano Banana 2.1 | Thinking: High | x2–x4 (0 credits)** and attach **ONLY the single target image** (NEVER attach character reference sheets simultaneously, so composition stays locked and no extra characters bleed in). Keep the unaffected half of the frame locked and only locally refine the target character, footwear count, and hosiery.
- **Keyframe Engine Split (ChatGPT + Meta AI Muse 雙主力分流)**: Route serious HQ briefings & complex weapon/prop scenes (e.g., Ep1 `01, 02, 06, 10, 12, 15, 16`) to **ChatGPT**; route comedy physical interactions, leg/hosiery/shoeless close-ups, grapple-wire tangles, and Ep3+ concept drafts (e.g., Ep1 `03, 04, 05, 07, 08, 09, 14` fixes & Ep3+ comedy shots) to **Meta AI Muse** and/or **Google Flow**, finishing with **Nano Banana 2.1 (0 credits)** when texture unification is needed.

---

## 2. Video Prompt Rules (Google Flow & MiniMax H3)

### Rule A — Google Flow Policy-Safe Video Prompting & Anti-Slide Entrance (Omni 1.2)
- **Banned Keyword Combinations**: NEVER combine `unconscious`, `lying on back`, `unprotected sole`, `barefoot`, `shoeless`, `sheer pantyhose`, or `garter stockings` with looming/creeping figures in Google Flow video prompts (triggers false-positive safety policy blocks).
- **Frame-0 Outfit Lock**: Because Frame 0 already locks the character's outfit and hosiery visually, Google Flow **video** prompts MUST focus strictly on camera movement, lighting, and physical action—**omitting hosiery, barefoot, shoeless, and garter descriptors**.
- **Anti-Cardboard-Slide Depth-Axis Entrances (防滑步進場原則)**: Whenever a character enters the shot (e.g., Agent Chloe Han in `Flow_Bridge_09_10`), ALWAYS route them forward along the camera depth axis (`walks forward along the depth axis out of the mist`), and NEVER describe entering sideways from the frame edge (prevents flat cardboard-cutout horizontal sliding).
- **LANGUAGE FORMAT RULE**: Write ALL camera movements, physical actions, and audio descriptions in **English** so prompts work seamlessly in both Google Flow and MiniMax H3. Only the spoken dialogue inside quotation marks `"..."` should be written in the target language.
- **Multi-Language Audio Tags**:
  * Silent / Action: `no spoken dialogue, only natural laughter/breathing and ambient sound effects.`
  * English: `speaking in English, saying clearly: "..."`
  * HK Cantonese (use authentic spoken Cantonese characters 口語): `speaking in natural Hong Kong Cantonese, saying clearly: "..."`
  * Mandarin: `speaking in Mandarin Chinese, saying clearly: "..."`
  * Japanese: `speaking in Japanese, saying clearly: "..."`

---

**6-Tool Hybrid Pipeline**: Use **Meta AI Muse** (comedy / hosiery / guardrail-sensitive scenes & Ep3+ concept drafts) and **ChatGPT** (serious HQ / complex weapon-prop scenes & turnaround sheets) as co-primary illustrators, refine locally with **Google Flow Nano Banana 2.1 (0 credits)**, render pure action & bridges in **Google Flow Omni 1.2**, and mass-produce 12s bilingual lip-sync in **MiniMax H3 (Colab A100)**—guided by **Gemini** (creative direction & continuity) and **Antigravity** (SSOT & WSL automation).
