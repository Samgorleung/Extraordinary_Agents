# Global Style & Dual-Engine Production Rules

## 1. Image Generation Rules: Two Distinct Formats (ChatGPT Image / Nano Banana)

- **Base Visual Style (Applies to All Art)**: Clean 2D cel-shaded Japanese anime blended with detailed comic-style black ink outlines and high-contrast cinematic lighting. Non-photorealistic, no 3D CGI rendering or realistic photo skin textures.
- **Stateless World Rule**: Continental Union alternate-modern setting; NO real-world national flags, country names, or unintended watermark text.

### Rule Set 1: 角色三視圖設定表 (Character Turnaround Sheets — 存入 `bible/character_sheets/`)
- **Purpose**: Official character design reference sheets used to lock in visual identity across all AI tools.
- **Required Multi-View Reference Sheet Layout** (strictly following the template standard of **Airi Fujimoto** and **Helena Voss**):
  1. **Full-Body 3-View Turnaround (全身正、側、背面三視圖)**: Full-body **Front, Side, and Back** views standing on a clean reference baseline.
  2. **6 Facial Expression Close-Ups (6種表情特寫)**: 6 distinct head/shoulder portraits showcasing core personality emotions (e.g., neutral, smirk/smile, serious/angry, surprised, flustered/embarrassed, signature expression).
  3. **Outfit, Footwear, Hosiery & Accessory Detail Callout Boxes (服裝鞋襪配件細節框)**: Zoomed-in inset boxes highlighting signature garments, hosiery/pantyhose texture & denier (e.g., 10D light brown sheer, black dotted sheer, fishnet, sheer light-brown tights, white thigh-highs), high heels/boots, and signature props/weapons.
  4. **Height Scale Ruler (身高比例尺)**: Vertical metric height scale bar (cm) alongside the full-body turnaround views.
  5. **English / Japanese Profile Info Card (英文/日文簡介卡)**: Clean typography block displaying the character's Name, Codename/Title, Age, Height, Affiliation, and key visual/personality notes in English & Japanese.

### Rule Set 2: 單幅 16:9 劇集分鏡圖 (Single-Frame 16:9 Episode Storyboard Keyframes — 存入 `ep1_shots/` 或 `ep2_shots/`)
- **Purpose**: Shot-by-shot keyframe images generated specifically as input frames for **Google Flow** and **MiniMax H3** video generation (or single-scene character concept previews).
- **CRITICAL SINGLE-FRAME RULE**: Strictly generate **individual, single-frame 16:9 widescreen (1920×1080) full-bleed images** for each shot. **NEVER** combine multiple views, panels, inset callout boxes, character sheets, or split-screen grids into an episode keyframe.
- **Close-Up Anti-3D Rule**: For close-up inserts of hands, feet, shoes, or props where faces are not visible, explicitly enforce: `strictly flat 2D anime cel-shading with visible black ink outlines, non-photorealistic, no 3D CGI rendering or realistic skin textures`.
- **Footwear & Limb Clarity**: By default, Agent Maya wears her high heels with sheer pale brown pantyhose unless a scene specifically calls for a shoeless callback/gag. When multiple characters are on the floor, state: `Keep all legs and feet clearly separated on the floor`.

---

## 2. Video Prompt Rules (Google Flow & MiniMax H3)
- **LANGUAGE FORMAT RULE**: Write ALL camera movements, physical actions, and audio descriptions in **English** so prompts work seamlessly in both Google Flow and MiniMax H3. Only the spoken dialogue inside quotation marks `"..."` should be written in the target language.
- **Multi-Language Audio Tags**:
  * Silent / Action: `no spoken dialogue, only natural laughter/breathing and ambient sound effects.`
  * English: `speaking in English, saying clearly: "..."`
  * HK Cantonese (use authentic spoken Cantonese characters 口語): `speaking in natural Hong Kong Cantonese, saying clearly: "..."`
  * Mandarin: `speaking in Mandarin Chinese, saying clearly: "..."`
  * Japanese: `speaking in Japanese, saying clearly: "..."`
