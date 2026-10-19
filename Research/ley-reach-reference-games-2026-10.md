# Reference games: The Ash Remembers, Realindustry, Scapewatch: Idle MMO

Revision 1.1 · 2026-10-19 · For Durand · Baseline: `main` at `7e19c56` (v1.1.0-alpha.6)

This is a design reference.

- Durand's rulings are in [§8](#8-decisions-durand-2026-10-19) and [§9](#9-direction-depth-in-view-from-the-start).
- Everything else is a proposal and goes through the authority order in [`DEVELOPMENT_PLAN.md`](https://github.com/kendur/ley-reach/blob/7e19c56/docs/DEVELOPMENT_PLAN.md) §1.
- The proposed numbers are playtest values, not canon.

---

## Contents

- [Method and confidence](#method-and-confidence)
- [At a glance](#at-a-glance)
- [1 The Ash Remembers](#1-the-ash-remembers)
- [2 Realindustry](#2-realindustry)
- [3 Scapewatch: Idle MMO](#3-scapewatch-idle-mmo)
- [4 Recommendations for Ley Reach](#4-recommendations-for-ley-reach)
- [5 Do not adopt](#5-do-not-adopt)
- [6 Pitfalls and guards](#6-pitfalls-and-guards)
- [7 Mapping to issues and the plan](#7-mapping-to-issues-and-the-plan)
- [8 Decisions (Durand, 2026-10-19)](#8-decisions-durand-2026-10-19)
- [9 Direction: depth in view from the start](#9-direction-depth-in-view-from-the-start)
- [10 Open questions](#10-open-questions)
- [Sources](#sources)

---

## Method and confidence

- **How it was gathered.** One parallel research pass per game, then a spot-check pass against official or primary pages.
- **No page could be opened directly.** Page fetches failed on DNS, and the network proxy refused Steam, SteamDB, Discord and Reddit. Every fact about the three games therefore comes from search-engine extracts of the named pages. Quotes are extract text and were not re-read on the live page.
- **Spot-checked (19 Oct):**
  - Scapewatch: the success formula, failure XP, task weighting and rerolls, and the new-tasks bar.
  - The Ash Remembers: the 1.7.4 readability profiles, Simple Menu and Pin Bar; tooltip pinning; the Ember Crucible hotfix 1.4.3.
  - Realindustry: the 1.1.2 resource-connections window, and planned versus measured rates.
- **Not reached:** Reddit, full Steam review pages, screenshots and video. Screen layout is therefore thinly documented for The Ash Remembers and Scapewatch.
- **Claims about Ley Reach** come from this repository at the baseline commit.
- **Labels:**
  - **[O]** official: developer site, press kit, store page, patch notes, or a developer-run wiki.
  - **[C]** community: fan wiki, guide or data file.
  - **[P]** a player review or forum post.
  - **[I]** inference.
  - **✓** a claim confirmed in the spot-check pass.

## At a glance

| | The Ash Remembers | Realindustry | Scapewatch: Idle MMO |
|---|---|---|---|
| Form | Dark-fantasy idle RPG, text and menus | Menu-driven industrial automation | Idle MMO in the RuneScape mould, watched character on a 2D map |
| Developer | Veyr Works (Marco Hempelmann, solo, Germany) [O] | AssemblyPrime [O] | Puzzle Drop Studios [O] |
| Release | 7 Sep 2026; patch 1.7.4 on 13 Oct [O] | 22 Sep 2026; demo 1 Apr [O] | 25 Sep 2026; open playtest 8 May [O][C] |
| Platforms | Windows on Steam [O]; a browser build is claimed only by listings [C] | Windows, macOS [O] | Windows, Linux, browser, Android [O] |
| Model | $11.99, no microtransactions [O] | $14.99 [O] | $14.99 plus two packs that add offline hours [O] |
| Steam reviews (snapshot) | 95% of 48 [O] | 70% of 57; demo 44% of 58 [O] | 89% of about 505 [O] |
| Lesson for Ley Reach | Readability, tooltips, safe automation, too many systems at once | Showing a large resource graph, rates, bottlenecks; flowchart automation | Queue rows, offline caps, the step to light multiplayer |

---

## 1 The Ash Remembers

### Mechanics worth noting

- **Skills and professions [O].**
  - 21 skills to level 100: 16 professions and 5 combat skills.
  - The professions feed each other: "Mining and smelting supply the forge, farming and fishing supply the kitchen."
  - There is "no pure-combat path", because cooked food is what keeps a fighter standing.
- **Offline progress [O].**
  - Combat, gathering and crafting all run offline. Before launch the global cap was stated as "up to 24 hours".
  - Some features have their own caps. The fishing set line runs offline for at most 12 h. The Ember Crucible catches up at most 60 runs.
- **Queue slots as rewards [O].** The workshop queue holds three crafts and runs offline (1.2.2). A crafting side slot unlocks at total level 150.
- **Prestige, the "Ashfall" [O].**
  - It keeps achievements, companions, titles, the homestead, the Ash Book, the Relic Hall and melee mastery.
  - Content is gated by Ashfall count.
  - Patch 1.6.2: "the Ashfall forgets less".
- **Mastery past the cap [O].** Melee XP beyond level 100 buys ranks of +0.25% HP and armour, up to 20 ranks. The ranks survive the Ashfall.
- **Difficulty modes [O].**
  - Standard: death costs gold, and the first three deaths are free.
  - Ashen Path: one life.
  - Hermit: no market and no buying.
  - World Ablaze: enemies have 5× health and 3× damage.
- **Endgame cadence [O].**
  - 11 world bosses appear daily, and titans rotate weekly.
  - From the third Ashfall, **Ember Grades** let the player set how tough endgame bosses are. Grade 0 is unchanged, and each grade has a first-win reward.
- **Goals the player can reach [O].**
  - Daily contracts come "only ever from enemies you can actually reach".
  - Each run offers 3–5 reachable deeds. They feed a persistent Ash Book of 120 entries in six branches.
- **Knowledge grows with play [O].** Kill a foe often enough and the bestiary opens "its entire loot … weakness included".
- **Visible settlement growth [O].**
  - The Emberhome homestead goes through six build stages.
  - A causeway grows from daily work and is shown on the world map "picture by picture".
- **Automation that spent silently, then was fixed [O ✓].** The Ember Crucible took 20,000 gold per run "silently, until now". Hotfix 1.4.3 added:
  - a notice on the first run;
  - a journal entry for every run;
  - a gold reserve, 100,000 by default;
  - an off switch.

### UI and UX

- **Screen layout:** not documented in any reachable source.
- **Patch 1.7.4 "See Clearly" [O ✓]:**
  - brightness, contrast, and text scaling up to 150%;
  - three profiles: *Default*, *Bright and clear* and *Easy on the eyes*;
  - a **Simple Menu** and a **Pin Bar**;
  - "honest values and clocks" in many displays.
- **Pinnable tooltips [O/P ✓]:** pin with middle-click or Alt+click; Esc releases.
- **Rarity glow [O]:**
  - Starts at Rare and grows with rarity. Strength can be set to Off, Normal or Strong.
  - Only the top tiers animate, and not in calm mode. The glow is display only.
  - Journal lines for Epic loot and above are tinted.
- **Show the outcome, not the stat [O].** The comparison window shows total armour and "what percentage of damage it really stops".
- **Navigation [O]:**
  - Jump buttons for tasks, recipes and nodes (1.1).
  - Boss cards show counters, and hunts show their sources (1.6.0).
- **Loot filter [O]:**
  - Keep or sell per item set; "Sell" applies only where something better is already worn.
  - Favourite, enchanted and crafted pieces are protected.

### Reception

- **Praise [P]:** "peak active/idle game"; "nice combination of afk-idle gameplay and active gameplay".
- **The recurring criticism [P]:** "a little overwhelming because there are a lot(!) of systems".
- **Specific complaints [P]:**
  - On a depth slider running to 1200, some values cannot be reached with the mouse. The player asked for arrow buttons or a typed number.
  - Fishing yields "Trout" but cooking asks for "Ember Trout".
  - German text shows up in the English client.
- **A rebalance walked back [O]:** an endgame tightening was reverted in 1.3.8 "without removing earned rewards".

---

## 2 Realindustry

### Mechanics worth noting

- **Scale [O].**
  - You build a Hyperdrive Engine as director of colony NIZ-08.
  - The game has 236 resources, about 354 processes, 56 facilities, 146 research projects, 10 tech levels, 16 hidden Registry lore entries and 3 endings.
  - Eras run from hand labour through electricity, nuclear and quantum to antimatter.
- **Three stages of labour [O/C].**
  1. Manual clicking, in batches with cooldowns.
  2. Colonists running "manual schemes":
     - 0, 10 or 20 colonists to start, by difficulty;
     - +15 for each new research tier, through tier 6 only.
  3. Electronic automation cores, which pay "control energy".
- **The scaling path had to be stated outright [O].** Patch 1.1.3 declared electronics the long-term scaling path, with colonists for "getting started and bridging the transition". The same patch cut one example's cost from 586.95 to 30 electricity per cycle.
- **Facility upgrades on three named axes [O]:**
  - Speed Governor: spend electricity for speed.
  - Batch Handler: +1 iteration per level.
  - Parallel Controller: more slots.
  - Prices rise in linear steps, then stop rising.
- **Recipes [C]**, from a community data file whose counts match the official ones:
  - multiple outputs and alternative recipes;
  - tool durability by material (20 / 50 / 150 / 500 / 1000);
  - fuel substitution;
  - catalysts, meaning inputs that come back;
  - byproducts that feed recycling at fractional yields.
  - Yields appear deterministic [I].
- **Failure states [I].** There is no game over. The game fails softly, through stalls, warnings about missing resources or power, and forecasts of when stock runs out.

### UI and UX

- **Form [I]:** 2D cards, windows and menus. No spatial factory map was found.
- **Automation as flowcharts ("blueprints") [O]:**
  - Block types: production, wait, rest, loop (a set count or endless), stock condition, branch, join, synchronisation barrier.
  - Templates with 2–16 parallel branches.
  - Validation, plus warnings at run time.
  - A confirmation before clearing a populated scheme.
- **Automation Board 2.0, patch 1.1.2 [O ✓]:**
  - Each building card shows inputs, outputs, power and scheme status.
  - **Planned** (nominal) and **measured** output are shown side by side, over 1, 5, 15 or 30 minutes.
  - Measurement runs on the save's play clock, so pauses and reloads do not distort rates. Until a window fills, rates use the shorter interval already collected.
- **Resource connections window [O ✓]:**
  - Lists producers, consumers, recipes and shared stock.
  - Shows estimated against measured balance, and **the time until stock runs out** when flow is negative.
  - Opens from any resource in the game.
  - A right-click quick menu can be driven by arrows, Home, End and Esc (single source).
- **Disabled actions explain themselves [O].** A greyed Produce button says what is missing.
- **Finding things among 236 resources [O]:** search in recipe and resource lists; favourites; hiding buildings and recipes.
- **Codex and hidden lore [O]:**
  - Almanac: one entry per resource, with composition and history.
  - Registry: hidden lore entries with a found-of-total counter.
- **Notification placement [O]:** popups were moved because they covered the automation controls.
- **Engineering [O]:**
  - Forecasts and rate history run in a shared background worker. They are cached by scheme contents, and stale replies are dropped after a save loads. There is a synchronous fallback.
  - Saves gained deduplication and compact exports. Storage-quota and disk-full errors are reported separately.
- **Signs of a gap [C]:** within two weeks of launch, a player published an external planner. Its features:
  - "fewest runs / least raw" optimisation;
  - "what's blocking this locked recipe";
  - tags for cyclic chains.

### Reception

- **Demo 44% positive, full game 70% [O].**
- **The top complaint is clicking before automation [P].**
  - "I just don't understand why this had to be a clicker game."
  - "You are even manual producing stuff on Research Level 5."
- **Rules that do not explain themselves [P]:**
  - why a Rest block supports only two colonists;
  - what "iterations" mean compared with "cycles";
  - why tools run at 3.2 per minute while wood arrives at 3.3.
- **Save failures:** saves failed at the browser storage limit [P].
- **Praise [P][O]** is mostly for depth and for the patch pace (1.1.0 to 1.1.3 in about a month).

---

## 3 Scapewatch: Idle MMO

### Mechanics worth noting

- **Form [O].**
  - Always online, with the character simulated on the server.
  - The world is a hand-painted 2D map of more than 540 nodes, and you watch your character walk between them.
  - 30 skills in five groups. Each gathering skill pairs with a processing skill.
- **Resolution [O ✓]:**
  - Success = min(100, 70 + (level − required) + bonus sources)%.
  - Each point over 100 shortens the action by 0.05 s.
  - A failed action pays about 10% of the success XP; the Gauntlet raid pays 25%.
- **XP curve [O]:**
  - Level 99 costs 50 M XP, about 3.8× the RuneScape figure. The cost doubles every 7 levels.
  - Four skills continue to level 120 (400 M XP).
  - A "trimmed" cape at 100 M XP keeps maxed skills worth training.
- **Tasks are generated, not chosen [O ✓ / C ✓]:**
  - There is one active task and five queued slots. Each slot offers three rolled options.
  - The player weights skills, activities, tiers and locations, using Skill Credits earned on level-ups at rising cost.
  - A reroll costs 5 Reroll Credits; you earn 1 per completed task.
- **New-tasks bar [C ✓].**
  - A quest reward unlocks a draggable bar. New tasks enter above it, and rows below it are frozen and dimmed.
  - The bar cannot go above row 2, so the next task always stays visible.
  - Without it, new tasks go to the bottom.
- **Row states [C]:**
  - Red: no materials. The task still runs, at half XP, with no output.
  - Yellow: some materials missing.
  - Book icons mark a quest step or a first visit.
- **Offline caps [O][C]:**
  - Free accounts get 8 h, the base game 16 h, and each paid pack +16 h, up to 48 h. These caps were doubled five days after launch.
  - Logging in refills the timer.
  - A **sleep mode** stays online, stops drawing the screen, and spends no offline budget.
- **Combat [O].**
  - Fights are auto-resolved queue tasks. Patch 1.0.2 removed the End Combat button; you leave a fight with Skip.
  - Right-clicking the fight row opens a gear calculator.
  - "Optional real-time combat" was **not** verified.
- **No player trading [C].** The Barter skill trades with the game.
- **Rare rewards [O].**
  - Pets drop per XP gained, about 1 per 10 M XP in that skill.
  - Each gives +5% XP, and these bonuses stack to at most +40% per skill.
- **Raids [O].**
  - Dungeons take up to 5 players. Loot from completed waves is kept if the team is wiped. Common drops scale with each player's share of the damage, with a minimum of one.
  - The Gauntlet skilling raid has five roles. Each pairs a gathering skill with a processing skill to feed one shared army stat. Switching roles deposits your bag first.
- **Social [O]:**
  - clans and friends;
  - broadcasts for level-ups, quests, pets and deaths;
  - hiscores for skills, pets, treasure scrolls, clans and endless-dungeon depth;
  - lobby privacy (Open, Friends & Clan, Closed) and an Invites tray;
  - a community XP boost, up to +10%, fed by everyone's item finds.

### UI and UX

- **The map [O].** The main view watches the character on the map.
- **The queue [C].**
  - A compact list at the bottom right; each row shows the remaining distance in parentheses.
  - Drag a row to reorder it. A thumbtack expands the alternatives for that slot.
- **Hotkey screens [C]:** Map (M), Diary (R), Quests (3), Skill Customization (Z or 2).
- **Return screen [O].** The store copy promises "what your character accomplished while you were away". Its layout is undocumented.
- **Player requests [P]:**
  - numbers on the HP bars;
  - filtering and sorting of raid lobbies, since one world "puts up a ton of 1 person lobbies";
  - an AFK toggle.

### Reception

- **Very Positive, 89% of about 505 [O].**
- **Praise [P]:** the mix of online play and idling, and a slow-burn hook: the queue "turned them off at first", then they "became hooked".
- **Criticism centres on the random queue [P ✓].** "Nudging a skill weight from 7% to 10% is not choice, it's the illusion of one."
- **Other criticism [P]:**
  - "not really an MMO, it's just an idle game with a chat room";
  - selling offline hours;
  - InsertCoins (6/10): "mostly panels and lists", lacking a "moment of contemplation".
- **Queue bugs [O]:** replaying the tutorial changed the queue, and skipping mid-action kept the old task's rewards. Both were fixed in 1.0.2.

---

## 4 Recommendations for Ley Reach

Items are ranked by three things: strength of evidence, fit with what Ley Reach already has, and cost. Each lists the evidence, the current state, the proposal, and where the work lands.

### Tier 1: interface work that fits now

**R1. Dial target precision** (decided: [§8.1](#81-the-dial-is-twitchy-means-the-slider-input); [#95](https://github.com/kendur/ley-reach/issues/95) item 3)

- **Evidence:** The Ash Remembers slider complaint. The player could not reach exact values with the mouse and asked for arrows or a typed number [P].
- **Today:** [`renderDial`](https://github.com/kendur/ley-reach/blob/7e19c56/src/ui/views.js) is an `<input type="range" min="-100" max="100" step="1">` with five presets (−100, −45, 0, 45, 100). In the README screenshot the track is roughly 270 px wide, so each pixel of mouse travel moves the target by about 0.75 points.
- **Proposal:**
  - Add a numeric target field next to the slider, with ±1 and ±5 steppers.
  - Holding Shift while dragging moves at one fifth of the speed.
  - Keep the native slider keys (arrows, Page Up/Down, Home/End) and the presets.
  - Optionally, show **time in band** over the last 1, 5 and 15 minutes, borrowing Realindustry's measured windows.
  - The needle's drift is the designed difficulty and stays.
- **Lands in:** `renderDial` and the dial input handler in [`app.js`](https://github.com/kendur/ley-reach/blob/7e19c56/src/ui/app.js). The target already goes through a command.

**R2. Queue rows carry state**

- **Evidence:**
  - Scapewatch rows show distance, colour-coded material sufficiency, and quest or first-visit icons [C].
  - Realindustry's disabled actions name what is missing [O].
- **Today:** [`renderQueue`](https://github.com/kendur/ley-reach/blob/7e19c56/src/ui/views.js) shows the name, the remaining count, five controls and a progress bar. Settlement blockers are already given in words ("All 3 work places occupied").
- **Proposal:** add to each row:
  - **Time to finish** the whole order.
  - **Input cover** in words: *enough*, *runs out after N*, or *waiting for inputs* (see [§8.2](#82-an-order-that-runs-out-of-inputs)).
  - **Success %** and the **most likely quality tier** for the person actually assigned. The tier distribution can be counted exactly, as [`tools/engine-telemetry.js`](https://github.com/kendur/ley-reach/blob/7e19c56/tools/engine-telemetry.js) already does.
  - Do not rely on colour alone ([#87](https://github.com/kendur/ley-reach/issues/87), [#88](https://github.com/kendur/ley-reach/issues/88)).
- **Lands in:** `renderQueue`, and Phase B item 4 ("read-only queries and observable views").

**R3. A resource-connections panel for every resource**

- **Evidence:** Realindustry 1.1.2 [O ✓], showing producers, consumers, net balance, and time until stock runs out.
- **Today:** the Settlement **Runway** card does this for provisions and coin only.
- **Proposal:** activating a resource in the header strip (click or Enter) opens a panel with:
  - what produces it: queued orders, workers, machines, Standing Orders;
  - what consumes it: recipes, wages, provisions, maintenance;
  - net change per hour;
  - when it runs out.
  - Offer two destinations, as Realindustry does: **Codex** and **Connections**.
  - This generalises Runway rather than adding a second model.
- **Lands in:** a new view, plus an engine query that aggregates queues, jobs and machines (Phase B item 4).

**R4. Expected against measured, on the world clock**

- **Evidence:** Realindustry's planned and measured rates over 1, 5, 15 and 30 minutes, on the save's play clock [O ✓].
- **Today:** Trades show expected yield at the current dial. Nothing shows what actually happened, apart from the offline totals.
- **Proposal:**
  - Keep measured rates per resource and per action in **fixed-size ring buffers**, keyed to world time. Live play and catch-up then agree, consistent with alpha.6's "time that runs the same however it is watched".
  - Add an **observed tier histogram** per action next to its exact expected distribution.
  - Begin session-only; persist later with a schema bump and a "history begins on <date>" note.

**R5. Tooltips you can pin from the keyboard**

- **Evidence:** The Ash Remembers pins with middle-click or Alt+click and releases with Esc [O/P ✓].
- **Today:** hover text throughout, themed tooltips (PR [#98](https://github.com/kendur/ley-reach/pull/98)), and hover cards on touch screens.
- **Proposal:**
  - A pin key on a focused tooltip, and Alt+click with the mouse.
  - Esc releases it.
  - The in-place repaint ([`morph.js`](https://github.com/kendur/ley-reach/blob/7e19c56/src/ui/morph.js)) must keep a pinned tooltip.

**R6. Readability profiles and a calm mode** ([#87](https://github.com/kendur/ley-reach/issues/87))

- **Evidence:** The Ash Remembers 1.7.4 [O ✓]: text scaling to 150%, three named profiles, and glow levels Off, Normal and Strong, with no animation in calm mode.
- **Proposal:**
  - Make **text scale** (100–150%) and **motion and glow** preferences separate from the theme.
  - A profile is a named bundle of theme, scale and motion.

**R7. Fewer tabs, then a pin strip** (overload; [#95](https://github.com/kendur/ley-reach/issues/95) item 1)

- **Evidence:**
  - "A lot(!) of systems" is The Ash Remembers' most repeated critique. Its developer answered with a Simple Menu and a Pin Bar [O ✓].
  - Realindustry's most manual opening hours reviewed worst [O].
- **Today:** the `TABS` array in [`app.js`](https://github.com/kendur/ley-reach/blob/7e19c56/src/ui/app.js) has 15 tabs, which wrap onto two rows. Two are history only: *The Blend* (retired) and *Standing*.
- **Proposal:**
  - Group the tabs into five sections:
    - **Work:** Trades, Scars, Champions.
    - **People:** Characters, Hiring.
    - **Settlement:** Settlement, The Cell, Rig, Operatives.
    - **Orders:** Standing Orders.
    - **Records:** Codex, Record, Log, Standing, The Blend.
  - Add a pin strip for a few trades, people or resources.
  - Number keys keep working by mapping 1–5 to sections.
  - How sections behave during the tutorial is in [§9.1](#91-greyed-but-live-interface-during-the-tutorial).

**R8. Offline Dispatch: highlights first**

- **Evidence:**
  - Scapewatch was criticised as "mostly panels and lists" with no "moment of contemplation" [P].
  - The Ash Remembers shows progress "picture by picture" and narrates its stories [O].
- **Proposal:**
  1. Lead with up to three highlights: the best roll tier, Resonances, level-ups, champion windows met or missed, settlement milestones.
  2. Then show what each person did, including waits for inputs and study time ([§8.2](#82-an-order-that-runs-out-of-inputs)).
  3. Then the change in stores, with a net rate per hour.
  4. Then problems: stalls, arrears, and what ran out and when.
  5. Show the remaining offline cap as a live countdown in the header.
- **Lands in:** `offlineModal` in [`app.js`](https://github.com/kendur/ley-reach/blob/7e19c56/src/ui/app.js) and the summary in [`offline.js`](https://github.com/kendur/ley-reach/blob/7e19c56/src/engine/offline.js).

**R9. Toasts outside the content column**

- **Evidence:** Realindustry had to move popups that covered its controls [O].
- **Today:** `MAX_TOASTS = 5`, plus a "…and N more — see the Log" counter. In the README's Trades screenshot, which is from an older build, the stack still covers the action list.
- **Proposal:** show at most 2 or 3 toasts, place them outside the panel column, and fold same-kind bursts into one line.

### Tier 2: mechanics

**M1. Safety rails for Standing Orders** (E21)

- **Evidence:**
  - The Ember Crucible fix [O ✓]: a first-run notice, a journal entry per run, a reserve floor, and a toggle.
  - Automation options ship off by default, and protected item classes are never sold [O].
  - Realindustry validates before running, warns at run time, and confirms before clearing [O].
- **Today:**
  - One engine, with limits of 10 rules, 3 conditions and 2 actions ([`rules.js`](https://github.com/kendur/ley-reach/blob/7e19c56/src/engine/rules.js)).
  - A dry run exists. A `marked` value kind lets a condition compare against a marker.
  - Firings are counted in the Dispatch.
- **Gaps and proposal.** Add each of these:
  - a reserve floor on any action that consumes resources, defaulting to the marker when one is set;
  - an announcement the first time a rule fires live;
  - the last-fired time and fire count on each rule card;
  - a per-rule cap on offline catch-up.
- This changes the rule schema, so it needs `RULES_VERSION` 2 and a migration.

**M2. Orders that run out of inputs:** decided; the specification is in [§8.2](#82-an-order-that-runs-out-of-inputs).

**M3. A track past level 99 that never resets:** decided in principle, after the leveling pace is fixed. See [§8.3](#83-a-track-past-99-yes-but-leveling-is-too-fast).

**M4. Champion grades**

- **Evidence:** The Ash Remembers' Ember Grades let the player choose toughness, with Grade 0 unchanged and a first-win reward per grade [O].
- **Proposal:** after the first kill, the player may pick a grade for that champion. A trophy's tier records the grade it was won at. The weekday tides already supply the rotation.

**M5. Offer only goals the player can reach** (E25)

- **Evidence:** The Ash Remembers offers contracts "only ever from enemies you can actually reach", and 3–5 reachable deeds per run [O].
- **Fit:** this matches the Phase E requirement: "Tie acceptance to capacity and settlement; tie inbound discovery to actual reputation evidence."
- **Proposal:** make it a stated generation rule for inquiries and contracts.

**M6. Codex entries that reveal in stages**

- **Evidence:**
  - The bestiary reveals loot and weakness after enough kills [O].
  - Scapewatch's diaries pay out for visiting more places and tiers [C].
- **Proposal:**
  - Three stages: *seen*, *studied* and *mastered*.
  - The last stage reveals something practical, such as a scar's stone odds or a champion's counter.
  - Mark first-time work on its queue row.

**M7. Show how to grow beyond the current cap**

- **Evidence:** Realindustry's colonist cap, with no visible way past it, drove the "clicker" backlash. The developer then had to name electronics as the way forward [O][P].
- **Proposal:** the Settlement panel names each way to grow (residents, hires, slots opened by Leadership, machines) and its next unlock.

**M8. Machine wear, substitute inputs, byproducts**

- **Evidence:** Realindustry's tool durability tiers, catalysts, alternative fuels, and recycling of byproducts [C].
- **Proposal:**
  - Show the runs remaining on each machine.
  - Allow declared substitute inputs per action.
  - Give every byproduct a use.
- **Priority:** low.

### Tier 3: guild multiplayer (Phase C)

**G1. Social features, cheapest first [O].** Guild broadcasts; guild-local hiscores; a shared guild meter with a cap; lobby privacy (Open, Guild, Closed) and an Invites tray.

**G2. A co-op event built on the Gauntlet model [O].**
- Each role pairs a gathering trade with a processing trade to feed one shared target.
- Switching roles deposits what you carry first.
- Loot from completed stages is kept on a wipe, with a minimum of one share each.

**G3. No player market at first [C].** Phase C already limits trade to quotes and settlement for goods and services.

**G4. Leaderboards you can trust [I].**
- In Ley Reach, catch-up runs on the client, so global hiscores could be forged.
- Keep hiscores guild-local, or require command logs that the host replays. The recording and headless-replay tools from Phase B already provide that replay.

**G5. Never sell offline time.** Scapewatch drew "pay-to-win" complaints and doubled its caps five days after launch [O][P].

---

## 5 Do not adopt

- **A generated or random task queue.** It is Scapewatch's most divisive feature. It contradicts Ley Reach's queues, which the player writes per person.
  - The **new-tasks bar** matters only if Standing Orders gain an action that adds queue entries. `ACTION_KINDS` has none.
  - If one is added, rows a rule inserts go above a boundary the player places, and automation never touches anything below it.
- **Scapewatch's resolution formula.** Ley Reach's d100 engine and calibration bands are canon ([`CANON_MAPPING.md`](https://github.com/kendur/ley-reach/blob/7e19c56/docs/CANON_MAPPING.md)).
  - Margin already carries any overflow into the quality tier.
  - Scapewatch pays a failure 10% of a success. In Ley Reach, failure is what teaches.
- **An opening built on clicking.** Realindustry's demo, the most manual part of the game, scored 44% [O]. This supports [#95](https://github.com/kendur/ley-reach/issues/95) item 2.
  - Keep Tap the Nexus as an optional active input, not something progress depends on.
- **Paid offline hours** (G5).
- **A world view that is only decoration.** Phase F already requires that location carry mechanical weight.

## 6 Pitfalls and guards

| Pitfall | Seen in | Guard for Ley Reach |
|---|---|---|
| One item, two names ("Trout" and "Ember Trout") | The Ash Remembers | One registry mapping each id to a name; a test that every action input and output resolves through it |
| Untranslated strings | The Ash Remembers | A missing-key test, once localisation exists |
| Automation spending without telling anyone | The Ash Remembers (Crucible) | M1 |
| Notifications covering controls | Realindustry; Ley Reach Trades screenshot | R9 |
| Browser storage limit | Realindustry | Fixed-size history buffers, save size shown, quota errors reported separately |
| New statistics empty after an update | Realindustry | Version the fields; show "history begins on …" |
| Rates that do not add up (3.2 vs 3.3 per minute) | Realindustry | A tooltip breaking each rate down into base time, speed modifiers, strain and rounding |
| Terms used inconsistently ("iterations", "cycles") | Realindustry | A glossary in the Codex; define each term once |
| Queue changed by unrelated actions, including a tutorial replay | Scapewatch 1.0.2 | Add skip-mid-order and tutorial-replay cases to [`test/queue-controls.test.js`](https://github.com/kendur/ley-reach/blob/7e19c56/test/queue-controls.test.js) |
| Rebalance taking back earned rewards | The Ash Remembers 1.3.8 | Already practised: the retired ladder kept as history. Applies to [§8.3](#83-a-track-past-99-yes-but-leveling-is-too-fast) |

## 7 Mapping to issues and the plan

| Item | Ley Reach issue or plan section |
|---|---|
| R1 dial target precision | [#95](https://github.com/kendur/ley-reach/issues/95), item 3 (decided, §8.1) |
| Nexus demoted (§5) | [#95](https://github.com/kendur/ley-reach/issues/95), item 2 |
| Order of the trades list: R7 pins plus search, favourites and hide (Realindustry) | [#95](https://github.com/kendur/ley-reach/issues/95), item 1 |
| Quantity presets | [#94](https://github.com/kendur/ley-reach/issues/94). These games add little; extend the existing 10, 100 and ∞ buttons |
| Character sheet: effective rating after strain and the expected tier spread ("honest values") | [#93](https://github.com/kendur/ley-reach/issues/93) |
| R5, R6 | [#87](https://github.com/kendur/ley-reach/issues/87), [#88](https://github.com/kendur/ley-reach/issues/88) |
| R2, R3, R4 | Phase B item 4, read-only queries and observable views |
| M1, §9.3 | E21 Standing Orders and markers |
| §8.2 | E09 work priorities; queue engine ([`queues.js`](https://github.com/kendur/ley-reach/blob/7e19c56/src/engine/queues.js), [`shift.js`](https://github.com/kendur/ley-reach/blob/7e19c56/src/engine/shift.js)) |
| §8.3 | E01 clock and §4.3 temporal model; E04 attributes, resolution and learning; [`BALANCE.md`](https://github.com/kendur/ley-reach/blob/7e19c56/docs/BALANCE.md) |
| §9.1, §9.2 | E24 art, rendering, audio and input; Phase A ActorPolicy seam; E02, E11, E18 for the most detailed levels |
| M5 | E25 negotiated contracts and inquiries; Phase E |
| G1–G5 | Phase C; E27 security gates |

---

## 8 Decisions (Durand, 2026-10-19)

### 8.1 "The dial is twitchy" means the slider input

[#95](https://github.com/kendur/ley-reach/issues/95) item 3 is an input-precision problem, not the needle's volatility. R1 is the fix. The dial's designed difficulty is unchanged.

### 8.2 An order that runs out of inputs

**Ruling.** When an order runs out of inputs:
- drop it to the next order in the queue;
- if nothing else in the queue can run, fall back to study;
- as soon as the materials arrive, restart the waiting production on the next cycle: finish the repetition in progress, then switch.

**Specification** (proposed wording of that ruling):

1. **Detection.** Before a person starts a repetition, the order's inputs for one repetition are checked against what is available to them. Reservations count, so another worker's claim is not available.
2. **Waiting.** An order that cannot start becomes *waiting for inputs*. This is a third kind of pause beside "paused" (by the player) and "paused by a standing order". It keeps its place and its slot in the queue.
3. **Next order.** The person starts the next runnable order in their own queue.
4. **Study fallback.** If none of their orders can run, they study the trade of the first waiting order. Study follows the existing rules: [`STUDY_BLOCK_AP`](https://github.com/kendur/ley-reach/blob/7e19c56/src/engine/progression.js) per study block, into that trade's own ledger.
5. **Return.** When inputs for one repetition become available, the person finishes the repetition in progress (work or study), then returns to the waiting order. With several waiting orders, the one highest in the queue goes first.
6. **Same everywhere.** Live play and offline catch-up behave identically through `advanceWorld`.
7. **Reporting.** The queue row says *waiting for inputs: needs 4 ore*. The Dispatch reports each wait, what was worked instead, and time spent studying.

**Edge cases to settle:**

| Case | Recommendation |
|---|---|
| Inputs trickle in one repetition at a time (another worker produces ore as fast as it is used), so the person would switch every cycle | Resume at one repetition, as ruled, and merge repeated wait and resume lines in the Log. Add a "resume when N are ready" setting only if switching ever costs time |
| Two waiting people want the same units | The existing reservation tie-break in `shift.js` decides; one unit cannot restart two orders |
| The trade cannot be studied (at the release cap, or there is nothing to study) | Rest instead, shedding strain, and say so on the row |
| A mentee's order is waiting | Their supervising mentor is released for their own queue |
| A Standing Order paused the order | The rule's pause wins; the order stays paused until the rule releases it |
| Hired workers on jobs rather than queues | Apply the same policy to job assignments, or record that it is queue-only for now |

### 8.3 A track past 99: yes, but leveling is too fast

**Ruling.** A persistent, never-resetting track past level 99 is the intended return of the retired ladder ([`PHASE0_BASELINE.md`](https://github.com/kendur/ley-reach/blob/7e19c56/docs/PHASE0_BASELINE.md) §3: "the concept will be reused in a non-resetting form"). Durand also judges the current leveling speed far too fast.

**The measurements agree.**
- **Bot results.** [`BALANCE.md`](https://github.com/kendur/ley-reach/blob/7e19c56/docs/BALANCE.md) has the policy bot (mixed dial, no rest rule) reaching best level 41–56 on day 1 and 86–99 on day 7. Three of the four pregens reach **99 within a week**.
- **The tests require this pace.** The gates in [`test/progression.test.js`](https://github.com/kendur/ley-reach/blob/7e19c56/test/progression.test.js) demand at least level 40 after a day and 80 after a week. They were set with Durand, so slowing leveling means re-setting them deliberately.
- **The curve is not the cause.** Level 99 costs 16,915,681 XP ([`skills.js`](https://github.com/kendur/ley-reach/blob/7e19c56/src/engine/data/skills.js): base 100, growth ×1.105 per level). That is more than RuneScape's roughly 13 M, and Scapewatch uses 50 M. The fast pace comes from XP per action.
- **Four trades lag far behind.** The table below gives a floor, not a forecast: continuous work at the best action available, *if every repetition taught*. In fact only failures and mentored successes award XP ([`sim.js`](https://github.com/kendur/ley-reach/blob/7e19c56/src/engine/sim.js)), so real time is longer.

  | Trades | Hours from 1 to 99 if every repetition taught |
  |---|---|
  | Ley Tapping | 4.7 |
  | Sollencraft, Metallurgy, Gem Cutting | 6.4–6.6 |
  | Cipherwork, Spiritlore, Reclamation, Chirurgy, Arksys, Maskwright, Cartography | 8.9–12.2 |
  | **Construction, Provisioning, Logistics, Negotiation** | **1,762–2,088** |

  The four settlement trades earn XP 150–400× more slowly than the original twelve. Retuning should fix that gap, not just the overall speed.
- **Two separate scales.** The level shown in Trades ("lv 72") is this XP track, and it also gates which actions are open. A person's *rating* is separate: AP bought step by step, with a release cap of 60. [`BALANCE.md`](https://github.com/kendur/ley-reach/blob/7e19c56/docs/BALANCE.md) already lists AP pace as open ("15–25 points in its first day"). The target needs to say which scale it slows, or both.

**Anchor the pace to the Chronicle Clock (Durand, 2026-10-19).**

Pace is to be set against the Workshop entry on game time and lifetimes:
- The entry: BBEG-tSAC [`WORKSHOP/system/chronicle_clock_demography_and_lifespan.md`](https://github.com/kendur/BBEG-tSAC/blob/main/WORKSHOP/system/chronicle_clock_demography_and_lifespan.md).
- Its 3 October section was approved by Durand.
- This repository already adopts it as [`DEVELOPMENT_PLAN.md`](https://github.com/kendur/ley-reach/blob/7e19c56/docs/DEVELOPMENT_PLAN.md) §4.3 (temporal model) and E01 (clock).

The entry stays a tSAC Workshop proposal. Using it here is a Ley Reach ruleset selection, which the authority order allows; it does not promote anything to canon.

**What it gives.**
- Advancement consumes world (Chronicle) time.
- Biological curves govern "age-sensitive ease of advancement".
- The Persistent preset starts testing at **10:1** (one real day = ten world days). Tests should also cover 20:1 and 30:1.
- The entry's benchmark for mastery is a **four-year apprenticeship**.

**Where the game stands.**
- World time runs 1:1 with play time (`state.stats.playSeconds`).
- One payroll "service day" is hard-coded as 1,800 real seconds ([`settlement.js`](https://github.com/kendur/ley-reach/blob/7e19c56/src/engine/settlement.js)). If a service day stands for a world day, that is an implicit **48:1** [I].
- So the alpha already runs a Chronicle Rate, but not one of the tested profiles, and no single setting controls it.

**Measured pace against that benchmark.** Level 99 within a week of real time, as measured in [`BALANCE.md`](https://github.com/kendur/ley-reach/blob/7e19c56/docs/BALANCE.md), translates to:

| Chronicle Rate | World time in one real week | A four-year apprenticeship in real time |
|---|---|---|
| 10:1 (Persistent, first test) | 70 world days | 146 real days |
| 20:1 | 140 world days | 73 real days |
| 30:1 | 210 world days | 49 real days |
| 48:1 (today's implicit service day) | 336 world days | 30 real days |
| 60:1 (earlier comparison) | 420 world days | 24 real days |

At every rate in the table, today's week to 99 is a small fraction of an apprenticeship. That is the gap Durand called "way too fast".

**Proposal [I]:**
1. Make the Chronicle Rate one versioned setting, as §4.3 requires, and derive the service day from it.
2. Express learning in world time: XP and AP per world hour of qualifying failure, study or mentored work, rather than per real-second repetition. Changing the Chronicle Rate then changes real-time pace consistently.
3. Set the targets as world durations scaled by the biological curve, for example *field competence (rating 41) ≈ an apprenticeship; level 99 ≈ a working life's mastery*. Real-time pace then becomes an output of the selected profile, as the entry intends for lifespan.
4. Re-set the gates in `test/progression.test.js` to match, with Durand.

**What has to be decided before tuning:**
1. The temporal profile for the alpha: 10:1 as the plan says, or another of the tested rates.
2. The world-time targets: field competence, the first 99, all twelve original trades at 99.
3. Whether active play may outpace an idle settlement, and by how much.
4. Which levers to use:
   - XP per action in [`actions.js`](https://github.com/kendur/ley-reach/blob/7e19c56/src/engine/data/actions.js);
   - the failure rate implied by action difficulty;
   - the curve (`XP_BASE`, `XP_GROWTH`);
   - AP (`STUDY_BLOCK_AP`, `failureAp`, `stepCost`).

Earned levels on existing saves stay; this is the history-not-wipe rule in §6.

### 8.4 Location

This document lives in `docs/research/` in this repository.

---

## 9 Direction: depth in view from the start

Durand, 2026-10-19:
- All three games feel overwhelming at first, and that is part of their appeal.
- Realindustry's blueprint-style programming stood out.

The three ideas below are restated, then reviewed against the code and the plan. The review flags gaps and conflicts; it does not decide them.

### 9.1 Greyed-but-live interface during the tutorial

**Direction.**
- In the first levels, the more sophisticated interface elements are shown but greyed until the tutorial unlocks them.
- Grey signals there is much more depth, but none of it is needed yet.
- Those systems run on default, simplified settings, and the player can watch them working.
- Interaction unlocks step by step. Leaving the tutorial unlocks everything.

**Fit.**
- This is progressive disclosure without hiding: depth is visible, control comes later.
- The Ash Remembers' Simple Menu hides things; this keeps them in view, which answers the same overload complaint while keeping the sense of depth.
- "Running on defaults" fits the plan. Phase A asks for "the smallest ActorPolicy seam … Keep a deterministic default", and Standing Orders already ships starter rules.
- No tutorial exists today. There is a one-time intro modal (`flags.seenIntro`).

**Gaps and conflicts:**

1. **Grey already means "unavailable".**
   - Today grey marks work that is not open yet (an action above your level) and civic standings not yet reached. If tutorial locks use the same grey, "not yet, the tutorial is driving" looks the same as "not possible".
   - That breaks the project rule that a block is explained in words.
   - So a locked-but-live element needs its own look:
     - live values at full contrast, because they carry information;
     - only the *controls* greyed;
     - a label such as *Automatic: unlocks after "Your first order"*.
2. **Accessibility.**
   - Greyed controls should use `aria-disabled="true"`, not `disabled`, so they stay focusable and announce why they are locked. The client already handles `[aria-disabled="true"]` in its focus code.
   - WCAG exempts inactive controls from contrast minimums, but not the live readouts beside them.
3. **The defaults act, so they are world state.**
   - A default that rests a strained person, or sets the dial, changes outcomes. It must run through the command boundary, be recorded, and replay headlessly like any other policy.
   - Each gated system needs a named, versioned default policy. "Simplified settings" is not enough to implement against.
4. **Not everything should be gated.**
   - The dial is the game's central decision. Gating it to a default (say, Band) removes the decision the tutorial is meant to teach.
   - Recommendation: never gate the dial or the queue. Gate Standing Orders, Hiring, The Cell, Operatives, Rig, Champions and other people's queues.
5. **Visible but locked still adds clutter.**
   - Collapse each locked section to a one-line live summary, for example *Standing Orders — 1 automatic rule running*.
   - Otherwise the greyed screen reproduces the overload it is meant to stage.
6. **Leaving and replaying the tutorial.**
   - *Exit tutorial* should be one recorded command that unlocks everything.
   - Replaying the tutorial must change no world state (see Scapewatch 1.0.2 in §6).
   - Saves that are already past the intro migrate as fully unlocked.
7. **Multiplayer.**
   - Tutorial progress belongs to the player (the controller), not the world.
   - On a shared guild host, one newcomer's tutorial cannot lock systems for everyone.

### 9.2 Simple ↔ Complex, at every level

**Direction.**
- One overall Simple-to-Complex setting.
- The same setting on each major component, and perhaps on its parts.
- Players who want to can deal with a single piece of material, an individual customisable worker, each animal or tree.
- Others play with menus of numbers and buttons, and everything in between is possible.
- This carries over Durand's simple-versus-complicated ideal for tabletop and video play. The plan already notes this for Arksys: "simple/full interfaces can remain supported" (E17).

**Recommended principle: the setting changes who decides, not what the rules are.**
- The simulation always runs at one fidelity.
- *Simple* hands the detailed decisions to a default policy and shows totals.
- *Complex* hands those same decisions to the player.
- This keeps one authoritative simulation, which the plan requires (§3; "do not leave one for the browser and introduce another for sprites"; one automation engine).
- It also keeps headless replay and multiplayer consistent.
- The alternative, different rules per setting (say, averaged yields in Simple), creates a second simulation.

**Consequences:**

1. **The simulation must hold the most detailed state any player may touch.**
   - Today people are individual records. Resources are counts in `state.resources`. Trees, animals and individual pieces of material are not entities.
   - Those arrive with E11 (inventory and provenance), E18 (creatures) and Phase F (places). The Complex end therefore deepens by phase; Simple works now.
2. **Scale.** The acceptance gate runs eight hours of catch-up for 16 residents and 24 hires in 8 ms against a 2,000 ms budget. A separate record for every tree, animal and piece would break that.
   - Proposal [I]: *individuate on demand*.
   - Keep interchangeable stock as counts or lots, each lot carrying its quality-tier spread.
   - Promote a unit to an individual record when a player inspects, names or customises it, or when a system needs its identity (provenance, a named animal).
   - Fold it back only if nothing identifying was ever attached.
3. **Changing the setting is sometimes a command.**
   - Moving Simple → Complex changes nothing by itself.
   - Moving Complex → Simple hands decisions back to the default policy, so it changes outcomes. It must be a recorded command, not just a display preference.
4. **More than two positions.** "Everything in between" suggests an ordinal scale per component rather than a switch:

   | Level | Name | What the player handles | For example (Work) |
   |---|---|---|---|
   | 0 | Summary | Totals, numbers and buttons | "Settlement output: 40 bars/day" |
   | 1 | Group | Per trade, building or team | Queue per trade |
   | 2 | Individual | Per person, machine or rule | Each resident's queue, each worker's job (today's game) |
   | 3 | Item | Per piece, animal or tree | A single ingot's quality; one named ox (needs E11, E18, Phase F) |

5. **Inheritance.**
   - The overall setting sets the default; a component or part may override it.
   - Changing the overall setting keeps overrides, and one command resets everything to the overall setting.
   - The interface shows *follows overall (Simple)* or *set here (Individual)*.
6. **Balance needs a stated position.**
   - If Complex play yields more, Simple players fall behind. If the default policy is as good as expert play, Complex is decoration.
   - Proposed position: a Simple setting reaches a stated share of expert output. Complex wins through specialisation and expression, not through tedious clicking.
   - Server rulesets (Phase C hosting profiles) may pin levels for competitive worlds.
7. **The tutorial is the same mechanism.** A component locked by the tutorial is *pinned at Summary and not interactive*. Unlocking it allows higher levels; leaving the tutorial unpins everything. One system, not two.

### 9.3 Blueprint-style automation

**Direction.** Realindustry's flowchart, blueprint-style programming was a highlight.

**Fit.**
- An accessible block editor for Standing Orders is already planned ([`PLAYER_EXPRESSION_AND_MODDING.md`](https://github.com/kendur/ley-reach/blob/7e19c56/docs/PLAYER_EXPRESSION_AND_MODDING.md) §2, "puzzle-piece blocks").
- [`rules.js`](https://github.com/kendur/ley-reach/blob/7e19c56/src/engine/rules.js) states that blocks compile to versioned data, not to code.
- On the §9.2 scale, a blueprint canvas is the Individual level of the Orders component:
  - Summary: switch starter rules on and off.
  - Group: the rule list.
  - Individual: the visual graph.

**Conflict to rule on.**
- The accepted foundation calls Standing Orders "deliberately limited … not intended to become arbitrary user code". Today's vocabulary is reactive: *when, then, until*, at most 3 conditions and 2 actions.
- Realindustry's blueprints are programs: production steps with loop, wait, branch, join and synchronisation.
- Two readings:
  1. **Blueprint as a layout.** The graph draws the same limited vocabulary, with conditions feeding actions. No change to the accepted design.
  2. **Blueprint as a production program.** Add sequence and control flow: loop N, wait until, branch on stock, run in parallel across people. This is closer to what Realindustry players praised. It changes the accepted foundation, so it needs a ruling.
- Either way:
  - there is still one engine (Durand, 2026-09-16);
  - execution is bounded, with step limits and no zero-time loops;
  - it is deterministic offline;
  - it is validated before it runs, with a dry run (which exists today);
  - nodes warn while running;
  - clearing a populated blueprint asks for confirmation;
  - there are templates;
  - a keyboard and screen-reader view of the same data sits beside the canvas. A node graph alone is not accessible.

---

## 10 Open questions

1. **Order runs out of inputs (§8.2):**
   - Should resuming wait for one repetition's inputs or for a buffer?
   - What happens when study is impossible (rest is recommended)?
   - Does the policy also cover hired workers on jobs?
2. **Leveling pace (§8.3):**
   - Which temporal profile does the alpha use?
   - What are the world-time targets, and on which scale (XP levels, AP ratings, or both)?
   - Re-set the progression tests to match.
   - Close the 150–400× gap for the four settlement trades.
   - Replace the hard-coded 1,800-second service day with the Chronicle Rate.
3. **Tutorial (§9.1):** which systems are gated, in what order, and what default policy runs each one while it is locked?
4. **Simple ↔ Complex (§9.2):**
   - A switch or the four-level scale?
   - What balance position for Simple against expert play?
   - May hosts pin levels?
5. **Blueprints (§9.3):** a layout of today's rules (no change), or production programs (amends the accepted foundation)?

---

## Sources

All accessed 19 October 2026 through search-engine extracts; see [Method](#method-and-confidence).

### The Ash Remembers

- Official site and patch notes: <https://theashremembers.com/>
- Press kit: <https://www.theashremembers.com/press/>
- Steam store page: <https://store.steampowered.com/app/4973460/The_Ash_Remembers/>
- Steam news:
  - <https://store.steampowered.com/news/app/4973460/view/698777425990910935>
  - <https://store.steampowered.com/news/app/4973460/view/698777425990911813>
- Steam community hub: <https://steamcommunity.com/app/4973460/>
- Developer YouTube channel: <https://www.youtube.com/channel/UCk5ONGadWbdSFVdc676w5Jg>
- Listings (low authority):
  - <https://www.igdb.com/games/the-ash-remembers>
  - <https://kotaku.com/games/the-ash-remembers>
  - <https://1vx.gg/games/the-ash-remembers>
  - <https://gocdkeys.com/buy-the-ash-remembers-pc-cd-key>

### Realindustry

- Steam store pages:
  - Full game: <https://store.steampowered.com/app/4384850/Realindustry/>
  - Demo: <https://store.steampowered.com/app/4525260/Realindustry_Demo/>
- Steam news:
  - 1.1.0: <https://store.steampowered.com/news/app/4384850/view/696523723786683895>
  - <https://store.steampowered.com/news/app/4384850/view/461208205952813598>
- 1.1.2 patch notes: <https://steamdb.info/patchnotes/25778162/>
- Steam community:
  - Hub: <https://steamcommunity.com/app/4384850>
  - "New and confused!" thread: <https://steamcommunity.com/app/4384850/discussions/0/582807198746470977/>
- Official site: <https://realindustrygame.com/>
- Developer on X: <https://x.com/RealindustryDev>
- Community planner and data file: <https://github.com/kaperk/industryplanner>
- Listings:
  - <https://gg.deals/game/realindustry/>
  - <https://discord.com/game/realindustry-1552168416180310056>
  - <https://kotaku.com/games/realindustry>
  - <https://games-stats.com/steam/game/realindustry/>
  - <https://awwrated.com/en/game/realindustry>

### Scapewatch: Idle MMO

- Steam store pages:
  - Main game: <https://store.steampowered.com/app/4671380/Scapewatch_Idle_MMO/>
  - Demo: <https://store.steampowered.com/app/4750660/Scapewatch_Idle_MMO_Demo/>
- DLC packs:
  - <https://store.steampowered.com/app/4991090/Scapewatch_Supporter_Pack/>
  - <https://store.steampowered.com/app/4991110/Scapewatch_Wings_Pack/>
- Official site and press kit:
  - <https://www.scapewatch.com/>
  - <https://scapewatch.com/presskit/>
- Official wiki:
  - Leveling: <https://www.scapewatch.com/wiki/guides/leveling.html>
  - Skills: <https://www.scapewatch.com/wiki/skills/index.html>
  - Dungeons: <https://scapewatch.com/wiki/guides/dungeons.html>
  - Gauntlet: <https://scapewatch.com/wiki/guides/gauntlet.html>
  - Pets and capes: <https://scapewatch.com/wiki/guides/pets-capes.html>
  - Slay masters: <https://scapewatch.com/wiki/guides/slay-masters.html>
  - Endgame: <https://scapewatch.com/wiki/guides/endgame.html>
- Scapewatch Atlas (fan):
  - New-tasks bar: <https://scapewatchatlas.com/systems/new-tasks-bar/>
  - Sleep mode and offline: <https://scapewatchatlas.com/systems/sleep-offline/>
  - Dungeons: <https://scapewatchatlas.com/systems/dungeons/>
- Impers' beginners guide on Steam: <https://steamcommunity.com/sharedfiles/filedetails/?id=3807910950>
- Fan beginner guide: <https://www.scapewatch.wiki/beginner-guide>
- Steam community:
  - Hub: <https://steamcommunity.com/app/4671380>
  - Discussions: <https://steamcommunity.com/app/4671380/discussions/>
  - Demo review: <https://steamcommunity.com/id/mphensley/recommended/4750660>
  - Offline-progress thread: <https://steamcommunity.com/app/4671380/discussions/0/565911524757101990/>
- Press:
  - InsertCoins: <https://insertcoins.press/en/articles/scapewatch-test>
  - Octavius Reviews: <https://www.octaviusreviews.com/niche/scapewatch-idle-mmo/>
  - Gaming Deputy (playtest, Polish): <https://www.gamingdeputy.com/pl/gaming-news/rozpoczely-sie-testy-gry-wieloosobowej-scapewatch-idle-mmo-2/>
- Listings:
  - <https://raijin.gg/app/4671380/Scapewatch_Idle_MMO>
  - <https://www.wasdland.com/game/scapewatch-idle-mmo-4671380/>
  - <https://pooksden.com/game/scapewatch-idle-mmo>
  - <https://discord.com/game/scapewatch-1504686356935213116>

### tSAC (BBEG-tSAC, `main` at `78a4f22`)

- Chronicle Clock, Demography, and Lifespan (Workshop proposal; its 3 October section approved by Durand): <https://github.com/kendur/BBEG-tSAC/blob/main/WORKSHOP/system/chronicle_clock_demography_and_lifespan.md>
- Skills and Advancement, candidate contract (Workshop): <https://github.com/kendur/BBEG-tSAC/blob/main/WORKSHOP/system/skills_and_advancement_contract.md>

### Ley Reach (this repository, `7e19c56`)

- Project documents: `Project-Setup.md`, `README.md`
- `docs/`: `DEVELOPMENT_PLAN.md`, `PHASE_B.md`, `PHASE0_BASELINE.md`, `BALANCE.md`, `PLAYER_EXPRESSION_AND_MODDING.md`
- Interface: `src/ui/app.js`, `src/ui/views.js`
- Rules and simulation: `src/engine/rules.js`, `src/engine/ruleRunner.js`, `src/engine/sim.js`, `src/engine/progression.js`
- Data: `src/engine/data/skills.js`, `src/engine/data/actions.js`
- Tools and tests: `tools/engine-telemetry.js`, `test/progression.test.js`
- Hours-to-99 floor: a one-off Node calculation over `ALL_ACTIONS` in `actions.js` and `xpForLevel`, assuming continuous work at the best action available and XP on every repetition
- Issues: #87, #88, #93, #94, #95
