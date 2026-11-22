# Episode 1 Remaster — Google Flow (Omni 1.2) Production Prompt Plan

All **5 non-dialogue action shots** (`Ep1_Shot_03`, `07`, `08`, `10`, `12`) and **1 Start-to-End action bridge** (`Flow_Bridge_08_09`) are assigned to **Google Flow (Omni 1.2)** in clean 2020s high-budget modern anime cinematic style (**Ufotable & Makoto Shinkai volumetric lighting, delicate thin lineart, glossy fabric & sheer pantyhose sheen**; strictly NO 1990s flat cel-shading and **no spoken dialogue**).

Save all rendered `.mp4` files inside `ep1_shots/flow/` using the exact filenames below so `ep1_shots/assemble_ep1.sh` picks them up automatically.

---

## 1. Quick Shot Inventory (`ep1_shots/flow/`)

| Target Filename | Storyboard Slot | Mode & Source Keyframes | Target Duration | Visual Focus |
| :--- | :--- | :--- | :---: | :--- |
| **`Flow_Shot_03.mp4`** | Act II (`Ep1_Shot_03`) | First Frame (`ep1_shots/03.png`) | `5s` | Moonlit skylight dive & burgundy heels slipping off in mid-air |
| **`Flow_Shot_07.mp4`** | Act III (`Ep1_Shot_07`) | First Frame (`ep1_shots/07.png`) | `4s` | Tactical flashlight sweep catching laughing Maya & Barnaby |
| **`Flow_Shot_08.mp4`** | Act III (`Ep1_Shot_08`) | First Frame (`ep1_shots/08.png`) | `5s` | Barnaby throws crates at guards & shields Maya under laser dots |
| **`Flow_Bridge_08_09.mp4`** | Act III Bridge (`08 -> 09`) | Start-to-End (`Flow_Shot_08.mp4` final frame ➔ `09.png`) | `4s` | Pink stun-smoke rocket blasts front guards -> clears to Chloe Han |
| **`Flow_Shot_10.mp4`** | Act III (`Ep1_Shot_10`) | First Frame (`ep1_shots/10.png`) | `6s` | Saffron catwalk chase, stumble dodge & grapple-wire ankle plunge |
| **`Flow_Shot_12.mp4`** | Act III (`Ep1_Shot_12`) | First Frame (`ep1_shots/12.png`) | `6s` | Chloe high-heel disarm + spinning Taekwondo kick knockout |

---

## 2. Ready-to-Copy Google Flow (Omni 1.2) Prompts

### Clip 1 — `Flow_Shot_03.mp4` (`Ep1_Shot_03`, 5s, First Frame `03.png`)
```text
Modern high-budget 2020s anime cinematic action animation (Ufotable and Makoto Shinkai moonlit volumetric lighting, delicate thin lineart, ray-traced glass reflections). Starting from the moonlit warehouse skylight, Agent Maya (wavy shoulder-length brown hair, reddish-brown sleeveless blouse, dark brown mini skirt, sheer pale brown pantyhose) gives a warm, confident smile as she taps her comms earpiece, drops into a sleek spy crouch, and dives headlong through the glass skylight. Camera tracks tightly downward with her in slow-motion bursts amidst glittering shattered glass shards under the silver full moon as air rush pulls both of her burgundy high heels cleanly off her sheer pantyhose-clad feet in mid-descent. No spoken dialogue, only comms beep, whistling night wind, crisp skylight glass shatter, aerial whoosh, and twin shoe-slip sounds.
```

### Clip 2 — `Flow_Shot_07.mp4` (`Ep1_Shot_07`, 4s, First Frame `07.png`)
```text
Modern high-budget 2020s anime suspense-comedy animation (Ufotable dramatic high-contrast spotlight shafts, delicate thin lineart, glossy sheer pantyhose texture). Inside the shadowed dockside warehouse, piercing bright white tactical flashlight beams abruptly snap on from upper doorways and sweep onto shoeless Agent Maya (sheer pale brown pantyhose on concrete beside her detached burgundy heels and squished banana peel) and the orange orangutan wearing his metallic specimen collar. Maya's carefree laugh snaps instantly into wide-eyed panic as she slaps both hands over her open mouth while the orangutan whips his head up sharply toward the armed silhouettes closing in. Rapid push-in framing. No spoken dialogue, only sharp tactical flashlight clicks, startled gasp, heavy mercenary footsteps, and rifle bolt clicks.
```

### Clip 3 — `Flow_Shot_08.mp4` (`Ep1_Shot_08`, 5s, First Frame `08.png`)
```text
Modern high-budget 2020s anime high-octane action animation (Ufotable dynamic camera tracking, flying wooden splinters, glowing crimson laser sights, delicate thin lineart). The large orange orangutan wearing the old metallic specimen collar narrows his eyes fiercely and vaults in front of shoeless Agent Maya (crouching behind him in sheer pale brown pantyhose). With booming power, he hoists a heavy wooden shipping crate and slams it into two charging armed guards before backhand-sweeping a third guard across the concrete floor. Immediately, six rifle reinforcements rush onto the upper steel catwalk and warehouse doors as vivid red laser-dot sights swarm onto them; the orangutan plants his wide muscular back firmly in front of Maya to shield her. No spoken dialogue, only deep primal ape growl, heavy crate splintering impact, knocked-out guard thuds, and rapid laser-sight lock hums.
```

### Clip 4 — `Flow_Bridge_08_09.mp4` (Start-to-End `Flow_Shot_08.mp4` final frame ➔ `09.png`, 4s Bridge)
```text
Modern high-budget 2020s anime seamless transition shot (Ufotable luminous volumetric pink smoke particles, dynamic shockwave distortion, delicate thin lineart). Starting from the final red-laser standoff frame of Flow_Shot_08.mp4 around the protective orangutan and shoeless Maya, a bright glowing pastel-pink stun-smoke projectile streaks at high velocity straight from the left edge at chest height and detonates across the frontline guards. Thick luminous pink-and-white shockwave smoke blossoms outward, knocking the front riflemen off their feet as the camera glides smoothly forward through the clearing rosy haze to reveal Agent Chloe Han (`09.png`) stepping into the left foreground with her smoking pink launcher perched gracefully over her shoulder beside shoeless Maya on the right floor. No spoken dialogue, only sharp rocket whistle, crisp stun-smoke detonation, muffled body falls, and swirling wind haze.
```

### Clip 5 — `Flow_Shot_10.mp4` (`Ep1_Shot_10`, 6s, First Frame `10.png`)
```text
Modern high-budget 2020s anime slapstick-action tracking shot (Ufotable moonlit warehouse catwalk lighting, bright amber laser tracer streaks, delicate thin lineart). High on the narrow steel warehouse catwalk, Agent Saffron Sinclair (sleek black updo, black halter high-slit dress, sheer grey thigh-high garter stockings, long black opera gloves, black ankle-strap heels) puffs her chest in an arrogant superhero pose before spotting four armed guards rushing behind her. Eyes bulging in pure panic, she sprints wildly down the steel grate, trips over her own heels into an accidental face-first duck that lets glowing rifle tracers whiz cleanly above her head, accidentally flips the side grapple switch on her matte-black prototype tactical pistol, and gets yanked straight off the catwalk edge upside-down by a taut silver micro-wire coiled tight around her ankle. No spoken dialogue, only proud chuckle cut short by panicked gasp, clanging metal footsteps, tracer gunfire, accidental switch click, and high-speed zipline cable zip.
```

### Clip 6 — `Flow_Shot_12.mp4` (`Ep1_Shot_12`, 6s, First Frame `12.png`)
```text
Modern high-budget 2020s anime martial arts showcase (Ufotable sweeping dynamic camera arc, luminous teal wind trails, bright impact sparks, glossy sheer hosiery and floral silk motion). Starting from the warehouse floor beside the concrete stairs, Agent Chloe Han (dark bob with blue floral ornament, flowing blue-and-white floral high-slit gown, sheer skin-tone stockings with jeweled thigh garter, silver-white floral heels) glides effortlessly into combat as the last elite guards charge from the left. With serene elegance, she flicks a crisp silver-white heel kick to spin an assault rifle out of the first guard's hands, vaults into a breathtaking spinning Taekwondo high-kick in mid-air through flowing floral sleeves, and delivers a clean open-palm shockwave strike knocking the final pair backward off their feet. Camera whips briefly right to show shoeless Maya, Saffron in her black dress, and the orangutan cheering with starry-eyed anime sparkles. No spoken dialogue, only spinning rifle clatter, clean air-cleaving Taekwondo kick whoosh, heavy double knockout thud, and bright anime sparkle chimes.
```
