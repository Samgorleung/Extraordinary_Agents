# Global Style & Dual-Engine Production Rules

## 1. Image Generation Rules: Two Distinct Formats (ChatGPT Image / Nano Banana)

- **Base Visual Style (Applies to All Art)**: Modern high-budget 2020s anime key visual illustration (Ufotable and Makoto Shinkai cinematic lighting style), ultra-detailed digital painting, delicate thin lineart, soft multi-layered gradient shading, volumetric lighting, ray-traced floor reflections, and realistic glossy sheer pantyhose textures. Strictly NO 1990s flat cel-shading or thick comic ink outlines.
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

---

## 2. Video Prompt Rules (Google Flow & MiniMax H3)
- **LANGUAGE FORMAT RULE**: Write ALL camera movements, physical actions, and audio descriptions in **English** so prompts work seamlessly in both Google Flow and MiniMax H3. Only the spoken dialogue inside quotation marks `"..."` should be written in the target language.
- **Multi-Language Audio Tags**:
  * Silent / Action: `no spoken dialogue, only natural laughter/breathing and ambient sound effects.`
  * English: `speaking in English, saying clearly: "..."`
  * HK Cantonese (use authentic spoken Cantonese characters 口語): `speaking in natural Hong Kong Cantonese, saying clearly: "..."`
  * Mandarin: `speaking in Mandarin Chinese, saying clearly: "..."`
  * Japanese: `speaking in Japanese, saying clearly: "..."`

---

**Hybrid Image Pipeline**: Use Google Flow / Nano Banana to draft complex multi-character staging first, then use ChatGPT for a 1:1 Master Style Upgrade.
