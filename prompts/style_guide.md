# Global Style & Dual-Engine Production Rules

## 1. Image Generation Rules: Two Distinct Formats (ChatGPT Image / Nano Banana)

- **Base Visual Style (Applies to All Art)**: 2D cel-shaded anime blended with detailed comic linework, crisp black ink outlines, and high-contrast cinematic lighting.
- **Stateless World Rule**: No real-world national flags, country names, or unintended watermark text.

### Format A: Character Turnaround Sheets (角色設定集 — 存入 `bible/character_sheets/`)
- **When to Use**: When designing, updating, or documenting a character's canonical reference sheet.
- **Required Multi-View Reference Sheet Layout** (following the exact template standard of **Airi Fujimoto** and **Helena Voss**):
  1. **Full-Body 3-View Turnaround**: Full-body **Front, Side, and Back** views standing on a clean reference baseline.
  2. **6 Facial Expression Close-Ups**: Distinct head/shoulder portraits showing key personality emotions (e.g., neutral, smirk/smile, angry/serious, surprised, embarrassed/flustered, signature expression).
  3. **Outfit, Footwear, Hosiery & Accessory Detail Callout Boxes**: Dedicated zoomed-in inset boxes highlighting signature garments, hosiery/pantyhose texture & denier (e.g., 10D sheer, dotted sheer, fishnet, thigh-highs), high heels/footwear, and key props/weapons.
  4. **Height Scale Ruler**: Vertical metric height scale bar (cm) alongside the full-body views.
  5. **English / Japanese Profile Info Card**: Clean header/sidebar typography block displaying the character's Name, Codename/Title, Age, Height, Affiliation, and key personality/visual notes in English & Japanese.

### Format B: Episode Storyboard Keyframes (分鏡算片底圖 — 存入 `ep1_shots/` 或 `ep2_shots/`)
- **When to Use**: When generating shot-by-shot keyframe images intended as input frames for **Google Flow** and **MiniMax H3** video generation.
- **CRITICAL SINGLE-FRAME RULE**: Strictly generate **individual, single-frame 16:9 widescreen full-bleed images** for each shot. **NEVER** combine multiple panels, inset boxes, character sheet callouts, or split-screen grids into an episode keyframe.
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
