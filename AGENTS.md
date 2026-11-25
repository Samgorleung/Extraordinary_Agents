# Extraordinary Agents: Master Workflow, AI Routing & Terminal Cheat Sheet

This file serves as the Single Source of Truth (SSOT) operational manual for both human creators and AI Agents (Antigravity, ChatGPT, Gemini).

## 1. Multi-AI Division of Labor (6 工具協作線與分工)

| Tool / AI | Primary Role | Key Responsibilities |
| :--- | :--- | :--- |
| GitHub Repo | Central SSOT Database | Stores all Lore, Character Sheets, Locations, Prompts, and Changelog. |
| Antigravity | Local Automation Agent & AI Dispatcher | GitHub 單一真相來源維護、`ffprobe`/PNG 標準化、WSL 安全斷點批跑腳本與 Colab CU 保護監控（失敗即停機），並主動派發下一步 Prompt。 |
| ChatGPT | Co-Primary Keyframe & Sheet Illustrator | 雙主力 16:9 底圖繪師之一：主力負責**正經總部戲、複雜武器／道具、角色三視圖設定表**（須嚴守 4 大防伏標準）。 |
| Meta AI Muse | Co-Primary Keyframe & Concept Illustrator *(Ep 3 起正式啟用；可作 Ep 1 單鏡補救)* | 與 ChatGPT 並列**雙主力 16:9 靜態底圖繪師**：優先負責**喜劇肢體互動、絲襪赤腳特寫、鉤爪纏繞**等易觸發 ChatGPT 誤判審查場口，兼顧 Ep 3+ 場景概念圖、多角色初稿與 IG/Threads/WhatsApp 宣發素材。 |
| Google Flow | Nano Banana 2.1 + Omni 1.2 Engine | **Nano Banana 2.1**（0-Credit 局部精修、清理多餘鞋隻與統一絲襪質感）＋ **Omni 1.2**（無對白動作片、`Rule A` Z 軸進場及 `Bridge` 首尾幀過渡）。 |
| MiniMax H3 (WSL / Colab A100) | Bilingual Lip-Sync Video Engine | 12 秒香港廣東話＋英文雙語對白對嘴量產（`--mode first_frame`，鎖死 `COLAB_EXEC_TIMEOUT=1200 COLAB_HIGH_MEM=1`）。 |
| Gemini | Creative Director, Reviewer & Escalation Lead | 創意導演、分鏡防穿幫審查、審查繞路改寫與救火；亦協助構思劇本對白（EN/HK/TW/JP）及全域架構排錯。 |

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
3. **Step 3: Single-Frame 16:9 Keyframe Generation (單幅 16:9 劇集分鏡底圖) 👉 Antigravity 出 Prompt ➔ 貼去 ChatGPT / Meta AI Muse / Google Flow 生圖**
   - **流程**：劇本分鏡表拍板後，需要為每一鏡生成 16:9 獨立算片底圖。
   - **Hybrid Image Pipeline (`Rule B` — ChatGPT + Meta AI Muse 雙主力 + Nano Banana 2.1 收尾)**：
     - **ChatGPT**：負責正經總部戲／複雜武器道具場口（Ep 1 `01, 02, 06, 10, 12, 15, 16`），嚴守 4 大防伏標準：正面鎖定 `a sleek solid matte-black prototype compact tactical pistol`（禁 `NO yellow gun/bananas`）、H3 首幀 `crisp sharp focus throughout with zero motion blur`、紅燈場口人臉 `balanced clean anime studio lighting`、`matte` 西裝／戰術背心＋Barnaby `with his mouth gently closed`。
     - **Meta AI Muse** *(Ep 3 起正式啟用，亦可作 Ep 1 單鏡補救)*：優先處理喜劇肢體互動、絲襪／赤腳特寫、鉤爪纏繞等易觸發 ChatGPT 審查誤判嘅場口，以及 ChatGPT 額度緊張時嘅概念圖與多角色初稿。**Muse 防伏 3 鐵則**：(1) 必查鞋隻數量防「著住一對＋地下又一對」高跟鞋分身；(2) 原地對話微調必明確鎖定保留場內細道具（如 `keep Chloe's silver heels and the yellow banana peel on the floor unchanged`）；(3) 若絲襪質感未夠統一，交 Google Flow **Nano Banana 2.1**（`Thinking: High`, `x2`–`x4`, 0 credits，僅附單張目標圖）統一收尾。
     - **Maya 柔霧 15D 定色鎖定**：一律使用 `subtle semi-matte 15-denier sheer light nude-beige nylon pantyhose (no oily glare)`（嚴禁 `barefoot`、`coffee-brown / cocoa-brown`、`glossy`、`specular highlights`）。
   - **Antigravity 職責**：根據 `prompts/style_guide.md` 嘅 `Rule Set 2 (單幅 16:9 劇集分鏡圖，嚴禁多格拼圖)`，逐鏡寫好英文生圖 Prompt，明確標示引擎分流及需附帶嘅 `bible/character_sheets/` 設定圖；圖片放入 `epX_shots/` 後負責標準化轉 PNG、改名並 `git push`。
4. **Step 4: Dual-Engine Video Generation (雙引擎算片：Google Flow Omni 1.2 vs. MiniMax H3) 👉 Antigravity 直接寫入算片 Prompts 與執行安全批跑**
   - **流程**：按鏡頭性質分流算片：
     - **Google Flow (`Rule A` Policy-Safe)**：負責大場景 Establishing Shots、光影氣氛、緩慢推進及首尾幀過渡（Start-to-End Frame Transitions）。因為 Frame 0 已經鎖定造型，Flow 算片 Prompt **必須省略絲襪／赤腳／昏迷／吊襪帶等敏感字眼**，純寫攝影機運動、光影及動作；角色登場須寫沿景深 Z 軸迎面步出（`walks forward along the depth axis out of the mist`），嚴禁側身滑入防滑步。Antigravity 直接輸出 Flow 專用英文 Camera & Motion Instructions。
     - **MiniMax H3 (WSL / Colab A100)**：負責快節奏武打、複雜肢體拍檔搞笑互動、以及 12 秒香港廣東話＋英文雙語對嘴量產（`--mode first_frame`）。使用可斷點續跑腳本（如 `ep1_shots/run_ep1_h3_batch.sh hk|en|all`），鎖死 `COLAB_EXEC_TIMEOUT=1200 COLAB_HIGH_MEM=1`，遇錯或超時即時 `colab stop`（HTTP 503 最多只重試 1 次）。Antigravity 亦負責生成並更新 `epX_shots/prompt*.txt`。
