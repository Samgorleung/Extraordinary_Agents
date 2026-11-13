# Extraordinary Agents: Master Workflow, AI Routing & Terminal Cheat Sheet

This file serves as the Single Source of Truth (SSOT) operational manual for both human creators and AI Agents (Antigravity, ChatGPT, Gemini).

## 1. Multi-AI Division of Labor (各 AI 與工具分工)

| Tool / AI | Primary Role | Key Responsibilities |
| :--- | :--- | :--- |
| GitHub Repo | Central SSOT Database | Stores all Lore, Character Sheets, Locations, Prompts, and Changelog. |
| Antigravity | Local Automation Agent & AI Dispatcher | Reads AGENTS.md, edits .md and .txt files locally, manages/renames new image files, updates PLANNING_CHANGELOG.md, runs git commit / git push automatically, **and proactively reminds the creator of the next production step while generating ready-to-copy prompts/instructions for ChatGPT, Gemini, Google Flow, and MiniMax H3**. |
| ChatGPT | Visual & Storyboard Director | Connects via GitHub app. Reads bible/ and prompts/style_guide.md to generate Character Turnaround Sheets, Location Concept Art, and Single-Frame 16:9 Keyframe Images. |
| Google Flow | Atmospheric Video Engine | Generates wide establishing shots, moody lighting scenes, slow camera push-ins, and Start-to-End frame transitions. |
| MiniMax H3 (WSL) | Action & Dialogue Video Engine | Runs locally/Colab via WSL. Handles fast combat, complex character/limb interactions (Starting from <Picture 1>), and multi-language lip-sync dialogue (especially HK Cantonese). |
| Gemini (General Chats) | Scriptwriter & Prompt Polisher | Connects via GitHub MCP. Assists with brainstorming episode scripts, translating dialogue (EN/HK/TW/JP), and formatting video prompts. |
| Gemini (Main Architect) | Resource & Escalation Lead | Oversees global resource allocation, cross-tool architecture optimization, and troubleshoots complex technical/workflow bottlenecks when other AIs get stuck. |

## 2. Repository Directory Structure (資料夾結構)

- AGENTS.md : Master workflow cheat sheet, AI routing rules, and terminal commands.
- PLANNING_CHANGELOG.md : Active episode roadmap, to-do list, and chronological update log.
- prompts/style_guide.md : Global rules for 16:9 single-frame images, 2D ink outlines, and multi-language video prompts.
- bible/world_rules.md : Stateless world rules (Continental Union) and dual-tone balance (Action-Comedy vs. Shadow Conspiracy).
- bible/character_roster.md : Full profiles, outfits/hosiery anchors, running gags, and relationships for all characters.
- bible/locations.md : Recurring locations, architecture, lighting, and background visual anchors.
- bible/character_sheets/ : High-res character turnaround sheets (.jpg / .png).
- ep1_shots/ & ep2_shots/ : Keyframe images (1.jpg, etc.) and video prompts (prompt.txt, prompt_hk.txt). Note: .mp4 files are ignored by Git.

## 3. Terminal Command Cheat Sheet (WSL 常用指令速查表)

A. 每次開工前由 GitHub 拉取最新進度落本機:
   cd /mnt/c/Users/Mori/minimax-h3-colab-skill/Extraordinary_Agents && git pull

B. 當資料夾加入咗新圖片或改咗檔案後推上 GitHub:
   cd /mnt/c/Users/Mori/minimax-h3-colab-skill/Extraordinary_Agents
   git add .
   git commit -m "Update assets and docs"
   git push

C. 叫 ChatGPT 或另一個 Gemini 開工嘅標準開頭 Prompt:
   "請先讀取我 GitHub Samgorleung/Extraordinary_Agents 入面嘅 AGENTS.md、PLANNING_CHANGELOG.md、prompts/style_guide.md 同埋 bible/ 資料夾下嘅設定檔，跟住最新進度幫我處理以下任務："

## 4. Character Canon & Relationship Validation Rules (角色正史與親屬關係防呆守則)

1. **Canon First (正史優先)**：所有角色背景、身份及人際關係必須嚴格以 `bible/character_roster.md` 為唯一標準（Single Source of Truth）。
2. **Relationship Lock (關係鎖定)**：嚴禁擅自捏造或混淆親屬／血緣關係（例如：**Nia Vale 絕對唔係藤本葵 Aoi Fujimoto 嘅妹妹**，**Airi Fujimoto 藤本愛莉** 先係藤本葵嘅親妹妹；**Emily Parker** 先係 **Victoria Parker** 嘅親妹妹）。
3. **No Template Text Bleeding (嚴禁排版參考圖文字滲漏)**：借用舊角色設定圖（如 Airi Fujimoto 或 Helena Voss）做排版參考（Layout Reference）時，嚴禁將參考圖嘅親屬關係、角色簡介或性格文字抄落新角色度；新角色設定表上嘅所有文字必須完全根據新角色本身嘅正史重寫。
4. **Proposal vs. Canon (提案與正史分界)**：AI 新構思嘅角色背景或關係必須先標示為 `PROPOSED`（提案），經創作者確認後先至可以寫入 `bible/character_roster.md` 成為 Canon（正史）。
5. **Visual Descriptor Lock (外貌描述鎖定)**：所有生圖／算片 Prompt 入面嘅角色外貌（髮色、髮型、服裝、絲襪、鞋履）必須逐字抄自 `bible/character_roster.md` 嘅 Visual & Outfit Anchor，而該 Anchor 必須以 `bible/character_sheets/` 設定圖為準；嚴禁 AI 憑記憶自創外貌（例如 Dorian Marlowe 係**黑色短髮**，唔係金髮）。

## 5. End-to-End Episode Production Pipeline & Antigravity Prompt-Dispatch Protocol (劇集生產 4 步流水線與主動派 Prompt 機制)

Antigravity 除咗負責本地檔案管理同 Git 同步之外，喺完成每一個步驟後，**必須主動提示創作者下一步應該搵邊個 AI 工具，並直接提供一段 Ready-to-Copy 嘅開工 Prompt／指令**：

1. **Step 1: Character Concept & Turnaround Sheet (新角色定案與三視圖設定表) 👉 交俾 ChatGPT**
   - **流程**：創作者將以前喺 Flow / Gemini 算過嘅角色草圖／廢案連同現有設定表排版參考（如 `Airi Fujimoto.png`、`Helena Voss.png`、`Finn Calder.png`）上傳俾 **ChatGPT**。
   - **Antigravity 職責**：提供包含 `Rule Set 1 (角色三視圖設定表)` 及 `Character Canon & Relationship Validation Rules` 防呆提示嘅 Prompt 俾創作者貼去 ChatGPT；當創作者將新圖放入 `bible/character_sheets/` 後，負責統一改名、寫入 `bible/character_roster.md`、更新 `PLANNING_CHANGELOG.md` 並 `git push`。
2. **Step 2: Episode Script & Shot-by-Shot Storyboard (分場劇本與逐鏡腳本深化) 👉 交俾 Gemini (General Chat) 或 Antigravity**
   - **流程**：角色入齊庫後，根據 `epX_shots/storyboard.md` 嘅四幕大綱，細執每一鏡（Shot 1 – Shot N）嘅動作、搞笑橋段及中／英／粵語對白。
   - **Antigravity 職責**：可直接同創作者一齊擴充 `storyboard.md`，或生成一段指令叫連咗 GitHub 嘅 **Gemini Chat** 讀取最新 Repo 協助構思對白，定稿後由 Antigravity 寫入 `storyboard.md` 並 `git push`。
3. **Step 3: Single-Frame 16:9 Keyframe Generation (單幅 16:9 劇集分鏡底圖) 👉 Antigravity 出 Prompt ➔ 貼去 ChatGPT / Gemini / Flow 生圖**
   - **流程**：劇本分鏡表拍板後，需要為每一鏡生成 16:9 獨立算片底圖。
   - **Hybrid Image Pipeline**：Use Google Flow / Nano Banana to draft complex multi-character staging first, then use ChatGPT for a 1:1 Master Style Upgrade.
   - **Antigravity 職責**：根據 `prompts/style_guide.md` 嘅 `Rule Set 2 (單幅 16:9 劇集分鏡圖，嚴禁多格拼圖)`，逐鏡寫好英文生圖 Prompt，並明確提示創作者每一鏡需要附帶 `bible/character_sheets/` 入面邊幾張角色設定圖上傳俾 **ChatGPT / Gemini / Flow**；圖片放入 `epX_shots/` 後負責執齊檔名並 `git push`。
4. **Step 4: Dual-Engine Video Generation (雙引擎算片：Google Flow vs. MiniMax H3) 👉 Antigravity 直接寫入算片 Prompts**
   - **流程**：按鏡頭性質分流算片：
     - **Google Flow**：負責大場景 Establishing Shots、光影氣氛、緩慢推進及首尾幀過渡（Start-to-End Frame Transitions）。Antigravity 直接輸出 Flow 專用英文 Camera & Motion Instructions。
     - **MiniMax H3 (WSL)**：負責快節奏武打（如 Chloe 高踢腿）、複雜肢體拍檔搞笑互動（如 Maya 與 Barnaby 蕉皮／道具烏龍、Saffron 與 Dorian 撞擊鬧劇）、以及多國語言對嘴（特別係地道香港廣東話口語 Lip-Sync）。Antigravity 直接生成並更新 `epX_shots/prompt.txt`（英文版）及 `epX_shots/prompt_hk.txt`（香港廣東話口語版，包含 `<Picture 1>` 標記）。
