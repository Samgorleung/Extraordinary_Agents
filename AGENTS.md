# Extraordinary Agents: Master Workflow, AI Routing & Terminal Cheat Sheet

This file serves as the Single Source of Truth (SSOT) operational manual for both human creators and AI Agents (Antigravity, ChatGPT, Gemini).

## 1. Multi-AI Division of Labor (各 AI 與工具分工)

| Tool / AI | Primary Role | Key Responsibilities |
| :--- | :--- | :--- |
| GitHub Repo | Central SSOT Database | Stores all Lore, Character Sheets, Locations, Prompts, and Changelog. |
| Antigravity | Local Automation Agent | Reads AGENTS.md, edits .md and .txt files locally, manages new image files, updates PLANNING_CHANGELOG.md, and runs git commit / git push automatically. |
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
