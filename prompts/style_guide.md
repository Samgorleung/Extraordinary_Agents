# Global Style & Dual-Engine Production Rules

## 1. Keyframe Image Rules (ChatGPT Image / Nano Banana)
- **CRITICAL FORMAT RULE**: Always generate **individual, single-frame 16:9 widescreen images** for each shot. NEVER combine multiple panels into a grid or split-screen layout.
- **Base Style**: 2D cel-shaded anime blended with detailed comic linework, crisp black ink outlines, cinematic lighting, 16:9 aspect ratio.
- **Close-Up Anti-3D Rule**: For close-up inserts of hands, feet, shoes, or props where faces are not visible, explicitly enforce: `strictly flat 2D anime cel-shading with visible black ink outlines, non-photorealistic, no 3D CGI rendering or realistic skin textures`.
- **Footwear & Limb Clarity**: By default, Agent Maya wears her high heels with sheer pale brown pantyhose unless a scene specifically calls for a shoeless callback/gag. When multiple characters are on the floor, state: `Keep all legs and feet clearly separated on the floor`.
- **Stateless World**: No real-world national flags, country names, or text watermarks.

## 2. Video Prompt Rules (Google Flow & MiniMax H3)
- **LANGUAGE FORMAT RULE**: Write ALL camera movements, physical actions, and audio descriptions in **English** so prompts work seamlessly in both Google Flow and MiniMax H3. Only the spoken dialogue inside quotation marks `"..."` should be written in the target language.
- **Multi-Language Audio Tags**:
  * Silent / Action: `no spoken dialogue, only natural laughter/breathing and ambient sound effects.`
  * English: `speaking in English, saying clearly: "..."`
  * HK Cantonese (use authentic spoken Cantonese characters 口語): `speaking in natural Hong Kong Cantonese, saying clearly: "..."`
  * Mandarin: `speaking in Mandarin Chinese, saying clearly: "..."`
  * Japanese: `speaking in Japanese, saying clearly: "..."`
