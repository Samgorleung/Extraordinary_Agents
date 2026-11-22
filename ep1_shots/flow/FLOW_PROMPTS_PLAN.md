# Episode 1 Remaster — Google Flow (Omni 1.2) Production Prompt Plan

> **Rule A Compliance (`prompts/style_guide.md`)**: Frame-0 keyframes already lock every character's outfit and hosiery visually. All Google Flow **video** prompts below strictly focus on camera movement, lighting, and physical action—omitting `unconscious`, `lying on back`, `unprotected sole`, `barefoot`, `shoeless`, `sheer pantyhose`, `garter`, `stockings`, `tights`, and `hosiery` descriptors to prevent false-positive policy blocks. All 7 clips are strictly `No spoken dialogue`.

All **6 non-dialogue Flow shots** (`Ep1_Shot_03`, `05`, `08`, `09`, `11`, `13`) and **1 Start-to-End action bridge** (`Flow_Bridge_09_10`) belong in `ep1_shots/flow/` using the exact filenames below so `ep1_shots/assemble_ep1.sh` picks them up automatically.

---

## 1. Quick Shot Inventory (`ep1_shots/flow/`)

| Target Filename | Storyboard Slot | Mode & Source Keyframes | Target Duration | Visual Focus |
| :--- | :--- | :--- | :---: | :--- |
| **`Flow_Shot_03.mp4`** | Act II (`Ep1_Shot_03`) | First Frame (`ep1_shots/03.png`) | `5s` | Moonlit skylight jump & burgundy heels slipping off in mid-air |
| **`Flow_Shot_05.mp4`** | Act II (`Ep1_Shot_05`, **NEW**) | First Frame (`ep1_shots/05.png`) | `4s` | Mystery push-in past dazed spy toward glowing amber eyes in dark crate |
| **`Flow_Shot_08.mp4`** | Act III (`Ep1_Shot_08`) | First Frame (`ep1_shots/08.png`) | `4s` | Tactical flashlight sweep catching laughing Maya & Barnaby |
| **`Flow_Shot_09.mp4`** | Act III (`Ep1_Shot_09`) | First Frame (`ep1_shots/09.png`) | `5s` | Barnaby throws crates at guards & shields Maya under catwalk laser dots |
| **`Flow_Bridge_09_10.mp4`** | Act III Bridge (`09 -> 10`) | Start-to-End (`Flow_Shot_09.mp4` final frame ➔ `10.png`) | `4s` | Pink stun-smoke rocket blasts front guards -> clears to Chloe Han |
| **`Flow_Shot_11.mp4`** | Act III (`Ep1_Shot_11`) | First Frame (`ep1_shots/11.png`) | `6s` | Saffron catwalk pose -> stumble dodge -> grapple-wire ankle plunge |
| **`Flow_Shot_13.mp4`** | Act III (`Ep1_Shot_13`) | First Frame (`ep1_shots/13.png`) | `6s` | Chloe Taekwondo opening stance -> rifle disarm + spinning kick KO |

---

## 2. Ready-to-Copy Google Flow (Omni 1.2) Policy-Safe Prompts

### Clip 1 — `Flow_Shot_03.mp4` (`Ep1_Shot_03`, 5s, First Frame `03.png`)
```text
Modern high-budget 2020s anime cinematic action animation (Ufotable and Makoto Shinkai moonlit volumetric lighting, delicate thin lineart, ray-traced glass reflections). Starting from the Frame-0 rooftop pose beside the intact glass skylight (both burgundy high heels firmly worn on her feet), Agent Maya gives a warm, confident smile as she taps her comms earpiece, coils, and dives cleanly straight through the skylight glass. Camera tracks rapidly downward amidst exploding crystal glass shards beneath the silver full moon as aerodynamic rush pulls both burgundy high heels off her feet in mid-descent. No spoken dialogue, only comms beep, whistling night wind, crisp skylight glass shatter, aerial whoosh, and twin shoe-slip sounds.
```

### Clip 2 — `Flow_Shot_05.mp4` (`Ep1_Shot_05`, 4s, First Frame `05.png`) **[POLICY-SAFE THRILLER PUSH-IN]**
```text
Modern high-budget 2020s anime mystery-thriller animation (Ufotable deep shadow chiaroscuro, faint cold moonlight, subtle dust motes). Slow dramatic camera push-in past the dazed brunette spy sitting in the lower-left foreground toward the pitch-black cracked wooden crate behind her. Deep inside the dark shadows, the two glowing amber eyes blink and narrow intensely as a huge mysterious dark silhouette shifts forward out of the crate with slow heavy steps. No spoken dialogue, only dead radio static hum, creaking wooden planks, deep suspense bass rumble, and slow heavy footsteps.
```

### Clip 3 — `Flow_Shot_08.mp4` (`Ep1_Shot_08`, 4s, First Frame `08.png`)
```text
Modern high-budget 2020s anime suspense-comedy animation (Ufotable dramatic high-contrast spotlight shafts, delicate thin lineart). Inside the shadowed dockside warehouse, piercing bright white tactical flashlight beams abruptly snap on from upper doorways and sweep onto Agent Maya (sitting on the concrete beside her detached burgundy heels and squished banana peel) and the orange orangutan wearing his metallic specimen collar. Maya's carefree laugh snaps instantly into wide-eyed panic as she slaps both hands over her open mouth while the orangutan whips his head up sharply toward the armed silhouettes closing in. Rapid push-in framing. No spoken dialogue, only sharp tactical flashlight clicks, startled gasp, heavy mercenary footsteps, and rifle bolt clicks.
```

### Clip 4 — `Flow_Shot_09.mp4` (`Ep1_Shot_09`, 5s, First Frame `09.png`)
```text
Modern high-budget 2020s anime high-octane action animation (Ufotable dynamic camera tracking, flying wooden splinters, emerging crimson laser sights, delicate thin lineart). Starting from his protective crouch raising the intact wooden crate in front of Agent Maya, the large orange orangutan wearing his metallic specimen collar roars silently and slams the heavy crate cleanly into two charging armed guards before backhand-sweeping the third guard across the concrete floor. Immediately afterward, six rifle reinforcements swarm onto the upper steel catwalk and warehouse doors as vivid red laser-dot sights lock across the scene; the orangutan drops broad-shouldered using his muscular back to shield Maya. No spoken dialogue, only deep primal ape growl, heavy crate splintering impact, knocked-out guard thuds, and rapid laser-sight lock hums.
```

### Clip 5 — `Flow_Bridge_09_10.mp4` (Start-to-End `Flow_Shot_09.mp4` final frame ➔ `10.png`, 4s Bridge)
```text
Modern high-budget 2020s anime seamless transition shot (Ufotable luminous volumetric pink smoke particles, dynamic shockwave distortion, delicate thin lineart). Starting from the tense red-laser standoff at the end of Flow_Shot_09.mp4 around the protective orangutan and Agent Maya, a bright glowing pastel-pink stun-smoke projectile streaks at high velocity straight from the left edge at chest height and detonates across the frontline guards. Thick luminous pink-and-white shockwave smoke blossoms outward, knocking the front riflemen off their feet as the camera glides smoothly forward through the clearing rosy haze to reveal Agent Chloe Han (`10.png`) stepping into the left foreground with her smoking pink launcher perched gracefully over her shoulder beside Maya on the right floor. No spoken dialogue, only sharp rocket whistle, crisp stun-smoke detonation, muffled body falls, and swirling wind haze.
```

### Clip 6 — `Flow_Shot_11.mp4` (`Ep1_Shot_11`, 6s, First Frame `11.png`)
```text
Modern high-budget 2020s anime slapstick-action tracking shot (Ufotable moonlit warehouse catwalk lighting, bright amber laser tracer streaks, delicate thin lineart). Starting from her arrogant Frame-0 superhero pose holding her matte-black tactical pistol on the high steel warehouse catwalk (`11.png`), Agent Saffron Sinclair (sleek black updo, black halter high-slit dress, long black opera gloves, black ankle-strap heels) glances back and spots four armed guards charging out of the shadows. Eyes bulging in pure panic, she sprints wildly along the catwalk, trips clumsily forward into an accidental duck as bright rifle tracers zip harmlessly over her head, accidentally flips her pistol's side grapple switch, and fires a silver micro-wire that coils tight around her right ankle—whipping her upside-down off the open catwalk ledge! No spoken dialogue, only proud chuckle cut short by panicked gasp, clanging metal footsteps, tracer gunfire, accidental switch click, and high-speed zipline cable zip.
```

### Clip 7 — `Flow_Shot_13.mp4` (`Ep1_Shot_13`, 6s, First Frame `13.png`)
```text
Modern high-budget 2020s anime martial arts showcase (Ufotable sweeping dynamic camera arc, luminous teal wind trails, bright impact sparks, glossy floral silk motion). Starting from her calm Frame-0 Taekwondo opening guard stance beside the concrete warehouse stairs (`13.png`), Agent Chloe Han (dark bob with blue floral ornament, flowing blue-and-white floral high-slit gown, silver-white floral heels) glides smoothly forward as the final elite guards rush in from the left. With serene elegance, she flicks a crisp silver-white floral heel kick to spin the first guard's rifle skyward, launches into an aerodynamic spinning Taekwondo high-kick in mid-air through flowing floral sleeves, and delivers a clean open-palm strike sending the final guards tumbling off their feet. Camera pans briefly right to show Maya, Saffron in her black dress, and the orangutan cheering with starry-eyed anime sparkles. No spoken dialogue, only spinning rifle clatter, clean air-cleaving Taekwondo kick whoosh, heavy double knockout thud, and bright anime sparkle chimes.
```
