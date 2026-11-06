# Global Style & Dual-Engine Production Rules

## 1. Keyframe Image Rules (ChatGPT Image / Nano Banana)
- **CRITICAL FORMAT RULE**: Always generate **individual, single-frame 16:9 widescreen images** for each shot so they can be used directly as start frames in Google Flow and MiniMax H3. NEVER combine multiple panels into a comic grid or split-screen layout unless explicitly requested for rough concepting.
- **Base Style**: 2D cel-shaded anime blended with detailed comic linework, cinematic lighting, 16:9 aspect ratio (1344x768).
- **Footwear & Limb Clarity**: Always explicitly state whether Agent Maya is wearing her high heels or has shoeless pantyhose-clad feet in a given scene. When multiple characters are on the floor, state: `Keep all legs and feet clearly separated on the floor`.
- **Stateless World**: No real-world national flags, country names, or text watermarks.

## 2. Video Prompt Rules (Google Flow & MiniMax H3)
For every shot, provide both an **Image Prompt** (to generate the start frame) and a **Video Motion Prompt**:
- **Route to Google Flow**: Atmospheric camera moves, slow push-ins, or Start+End frame transitions.
- **Route to MiniMax H3**: Fast combat, complex limb/character interaction (`Starting from <Picture 1>...`).
- **Multi-Language Audio Tags**:
  * Silent / Action: `no spoken dialogue, only natural laughter/breathing and ambient sound effects.`
  * English: `speaking in English, saying clearly: "..."`
  * HK Cantonese (use spoken Cantonese characters 口語): `speaking in natural Hong Kong Cantonese, saying clearly: "..."`
  * Mandarin: `speaking in Mandarin Chinese, saying clearly: "..."`
  * Japanese: `speaking in Japanese, saying clearly: "..."`
