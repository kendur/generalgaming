# Ley Reach reference games: The Ash Remembers, Realindustry, Scapewatch: Idle MMO

Research date: 19 October 2026 · For Durand · Baseline: `kendur/ley-reach` `main` at `7e19c56`
(v1.1.0-alpha.6)

This is a design reference, not a ruling. Anything adopted goes through the authority order in
ley-reach `docs/DEVELOPMENT_PLAN.md` §1. "The Ash Rememgers" in the request is read as
*The Ash Remembers*.

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
- [7 Mapping to open issues and the plan](#7-mapping-to-open-issues-and-the-plan)
- [8 Open questions](#8-open-questions)
- [Sources](#sources)

---

## Method and confidence

- **Three research passes and one check.** There was one parallel pass per game, then a spot-check pass against official or primary pages.
- **No page could be opened directly.** Page fetches failed on DNS. The network proxy refused Steam, SteamDB, Discord and Reddit. Every fact below therefore comes from search-engine extracts of the named pages. Quotes are extract text and were not re-read on the live page.
- **Spot-checked claims (19 Oct):**
  - Scapewatch: the success formula, failure XP, task weighting and rerolls, and the new-tasks bar.
  - The Ash Remembers: the 1.7.4 readability profiles, Simple Menu and Pin Bar; tooltip pinning; the Ember Crucible hotfix 1.4.3.
  - Realindustry: the 1.1.2 resource-connections window, and planned versus measured rates.
- **Not reached:** Reddit, full Steam review pages, screenshots and video. Screen layout is therefore thinly documented for The Ash Remembers and Scapewatch.
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
| Lesson for Ley Reach | Readability, tooltips, safe automation, too many systems at once | Showing a large resource graph, rates, bottlenecks; automation editor | Queue rows, offline caps, the step to light multiplayer |

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
- **Automation as flowcharts [O]:**
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

Items are ranked by three things: strength of evidence, fit with what Ley Reach already has, and cost. Each lists the evidence, the current Ley Reach state, the proposal, and where the work lands.

### Tier 1: interface work that fits now

**R1. Separate dial *input* precision from dial *motion*** (relates to ley-reach #95, item 3)

- **Evidence:** The Ash Remembers slider complaint. The player could not reach exact values with the mouse and asked for arrows or a typed number [P].
- **Today:**
  - `renderDial` is an `<input type="range" min="-100" max="100" step="1">` with five presets (−100, −45, 0, 45, 100).
  - The needle then drifts with volatility around that target, and that drift is the designed difficulty ("The band is hard to hold. That is the point.").
- **Proposal:**
  - Add a numeric target field with ±1 and ±5 steppers, and coarse steps with Shift.
  - Show **time in band** over the last 1, 5 and 15 minutes, borrowing Realindustry's measured windows. The player then judges the band from an average rather than from a twitching needle.
  - Leave volatility alone unless the "twitchy" complaint is about the motion (see §8).
- **Lands in:** `src/ui/views.js` (`renderDial`) and a small read-only query.

**R2. Queue rows carry state**

- **Evidence:**
  - Scapewatch rows show distance, colour-coded material sufficiency, and quest or first-visit icons [C].
  - Realindustry's disabled actions name what is missing [O].
- **Today:** `renderQueue` shows the name, the remaining count, five controls and a progress bar. Settlement blockers are already given in words ("All 3 work places occupied").
- **Proposal:** add to each row:
  - **Time to finish** the whole order.
  - **Input cover** in words: *enough*, *runs out after N*, or *none*.
  - **Success %** and the **most likely quality tier** for the person actually assigned.
  - The tier distribution can be counted exactly: `tools/engine-telemetry.js` already does it, with no sampling.
  - Do not rely on colour alone (ley-reach #87, #88).
- **Lands in:** `renderQueue`, and Phase B item 4 ("read-only queries and observable views").

**R3. A resource-connections panel for every resource**

- **Evidence:** Realindustry 1.1.2 [O ✓], showing producers, consumers, net balance, and time until stock runs out.
- **Today:**
  - The Settlement **Runway** card does this for provisions and coin only.
  - The header resource strip has about 20 chips, each an icon and a number.
- **Proposal:** activating any chip (click or Enter) opens a panel with:
  - what produces the resource: queued orders, workers, machines, Standing Orders;
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
  - Add an **observed tier histogram** per action next to its exact expected distribution. That makes the d100 engine readable.
  - Begin session-only; persist later with a schema bump and a "history begins on <date>" note.
- **Lands in:** engine telemetry and views; persistence is optional.

**R5. Tooltips you can pin from the keyboard**

- **Evidence:** The Ash Remembers pins with middle-click or Alt+click and releases with Esc [O/P ✓].
- **Today:** hover text throughout, themed tooltips (PR #98), and hover cards on touch screens.
- **Proposal:**
  - A pin key on a focused tooltip, and Alt+click with the mouse.
  - Esc releases it.
  - The in-place repaint (`morph.js`) must keep a pinned tooltip.
- **Lands in:** `src/ui/tooltip.js`.

**R6. Readability profiles and a calm mode** (feeds ley-reach #87)

- **Evidence:** The Ash Remembers 1.7.4 [O ✓]: text scaling to 150%, three named profiles, and glow levels Off, Normal and Strong, with no animation in calm mode.
- **Today:** themes are data (`theme.js`), and Daylight meets 4.5:1 contrast. #87 proposes high-contrast and colour-vision-safe presets.
- **Proposal:**
  - Make **text scale** (100–150%) and **motion and glow** preferences separate from the theme.
  - A profile is a named bundle of theme, scale and motion.
- **Lands in:** `theme.js`, the preferences commands, and `styles/`.

**R7. Fewer tabs, then a pin strip** (overload; ley-reach #95, item 1)

- **Evidence:**
  - "A lot(!) of systems" is The Ash Remembers' most repeated critique. Its developer answered with a Simple Menu and a Pin Bar [O ✓].
  - Realindustry's most manual opening hours reviewed worst [O].
- **Today:** 15 tabs in the `TABS` array wrap onto two rows. Two of them are history only: *The Blend* (retired) and *Standing*.
- **Proposal:**
  - Group the tabs into five sections:
    - **Work:** Trades, Scars, Champions.
    - **People:** Characters, Hiring.
    - **Settlement:** Settlement, The Cell, Rig, Operatives.
    - **Orders:** Standing Orders.
    - **Records:** Codex, Record, Log, Standing, The Blend.
  - Hide a tab until it first matters, for example Hiring until Working Post and Champions until the first window.
  - Add a pin strip for a few trades, people or resources.
  - Number keys keep working by mapping 1–5 to sections.
- **Lands in:** `TABS` and the key handling in `src/ui/app.js`.

**R8. Offline Dispatch: highlights first**

- **Evidence:**
  - Scapewatch was criticised as "mostly panels and lists" with no "moment of contemplation" [P].
  - The Ash Remembers shows progress "picture by picture" and narrates its stories [O].
- **Today:** *Dispatch on your return* shows simulated time, time lost to the cap, a grid of gains, level-ups, Standing Order firings, and advice about the cap.
- **Proposal:**
  1. Lead with up to three highlights: the best roll tier, Resonances, level-ups, champion windows met or missed, settlement milestones.
  2. Then show what each person did. Work has belonged to the person doing it since alpha.5.
  3. Then the change in stores, with a net rate per hour.
  4. Then problems: stalls, arrears, and what ran out and when.
  5. Show the remaining offline cap as a live countdown in the header. Scapewatch players were confused by "no progress after 24 h".
- **Lands in:** `offlineModal` in `src/ui/app.js` and the summary in `offline.js`.

**R9. Toasts outside the content column**

- **Evidence:** Realindustry had to move popups that covered its controls [O].
- **Today:** `MAX_TOASTS = 5`, plus a "…and N more — see the Log" counter. In the README's Trades screenshot, which is from an older build, the stack still covers the action list.
- **Proposal:** show at most 2 or 3 toasts, place them outside the panel column, and fold same-kind bursts (several achievements) into one line.
- **Lands in:** `toast()` in `src/ui/app.js` and `styles/`.

### Tier 2: mechanics (design decisions; some need rulings)

**M1. Safety rails for Standing Orders** (E21)

- **Evidence:**
  - The Ember Crucible fix [O ✓]: a first-run notice, a journal entry per run, a reserve floor, and a toggle.
  - Automation options ship off by default, and protected item classes are never sold [O].
  - Realindustry validates before running, warns at run time, and confirms before clearing [O].
- **Today:**
  - One engine, with limits of 10 rules, 3 conditions and 2 actions.
  - A dry run exists. A `marked` value kind lets a condition compare against a marker.
  - Firings are counted in the Dispatch (`renderAwayRules`).
- **Gaps:**
  - No reserve-floor guard on actions that consume resources.
  - No announcement of a rule's first live firing.
  - No last-fired time or fire count on the rule card.
  - No per-rule cap on offline catch-up.
- **Proposal:** add all four. The reserve can default to a marker if one is set. This changes the rule schema, so it needs `RULES_VERSION` 2 and a migration.

**M2. Degrade instead of stalling when inputs run out**

- **Evidence:** Scapewatch's "red" tasks still run at half XP with no output, so an offline queue never dead-ends [C].
- **Fit:** Ley Reach says advancement comes "from study and from honest failure". An order that runs out of inputs could fall back to **study** of that trade instead of stalling.
- **Proposal:** give each order a policy: *wait* (today's behaviour), *skip*, or *study*. Report which one fired in the Dispatch.
- **Needs a ruling:** this touches the progression rulings.

**M3. A track past level 99 that never resets**

- **Evidence:**
  - The Ash Remembers mastery ranks past the cap (+0.25% per rank, at most 20, kept through prestige) [O].
  - Scapewatch's trimmed cape at twice the level-99 XP [O].
- **Fit:** Durand's ruling in `docs/PHASE0_BASELINE.md` §3 reads: "the resetting mechanic is retired; the concept will be reused in a non-resetting form." The README says the same of the ladder. A capped, persistent track per skill after 99 is one candidate.
- **Needs a decision:** this is a design and canon call.

**M4. Champion grades**

- **Evidence:** The Ash Remembers' Ember Grades let the player choose toughness, with Grade 0 unchanged and a first-win reward per grade [O].
- **Today:** 12 champions, 15-minute windows, permanent trophies. The weekday tides already supply a weekly rotation.
- **Proposal:** after the first kill, the player may pick a grade for that champion. A trophy's tier records the grade it was won at.

**M5. Offer only goals the player can reach** (E25)

- **Evidence:** The Ash Remembers offers contracts "only ever from enemies you can actually reach", and 3–5 reachable deeds per run [O].
- **Fit:** this matches the Phase E requirement: "Tie acceptance to capacity and settlement; tie inbound discovery to actual reputation evidence."
- **Proposal:** make it a stated generation rule for inquiries and contracts.

**M6. Codex entries that reveal in stages**

- **Evidence:**
  - The bestiary reveals loot and weakness after enough kills [O].
  - Scapewatch's diaries pay out for visiting more places and tiers, and a first-visit icon appears on the queue row [C].
- **Today:** 32 entries, each citing its source file.
- **Proposal:**
  - Three stages: *seen*, *studied* and *mastered*.
  - The last stage reveals something practical, such as a scar's stone odds or a champion's counter.
  - Mark first-time work on its queue row.

**M7. Show how to grow beyond the current cap**

- **Evidence:** Realindustry's colonist cap, with no visible way past it, drove the "clicker" backlash. The developer then had to name electronics as the way forward [O][P].
- **Today:** 4 + 8 residents is canon. The other ways to grow are hiring, slots opened by Leadership, and machines.
- **Proposal:** the Settlement panel names each way to grow and its next unlock, for example "next work place: Lodging House, needs construction 41".

**M8. Machine wear, substitute inputs, byproducts**

- **Evidence:** Realindustry's tool durability tiers, catalysts, alternative fuels, and recycling of byproducts [C].
- **Today:** machines are maintained (alpha.5), tools are a resource, and a test requires that no action be a pure loss.
- **Proposal:**
  - Show the runs remaining on each machine.
  - Allow declared substitute inputs per action.
  - Give every byproduct a use.
- **Priority:** low. Check the current data first.

### Tier 3: guild multiplayer (Phase C)

**G1. Social features, cheapest first.** All are Scapewatch features [O].
1. Guild broadcasts: level-ups, milestones, champion kills.
2. Guild-local hiscores.
3. A shared guild meter with a cap, fed by everyone's work, like Scapewatch's +10% community boost.
4. Lobby privacy (Open, Guild, Closed) and an Invites tray.

**G2. A co-op event built on the Gauntlet model [O].**
- Each role pairs a gathering trade with a processing trade to feed one shared target. Switching roles deposits what you carry first.
- Loot from completed stages is kept on a wipe, and every participant gets at least one share.
- This maps onto settlement work and E25 contracts.

**G3. No player market at first [C].** Scapewatch ships without trading. Phase C already scopes this down to quotes and settlement for goods and services; keep the open market deferred.

**G4. Leaderboards you can trust [I].**
- In Ley Reach, catch-up runs on the client, so global hiscores could be forged. Scapewatch is server-authoritative and still needed anti-bot work in 1.0.2.
- Two options:
  - keep hiscores guild-local, on a host the guild trusts; or
  - require command logs that the host replays.
- The recording and headless-replay tools from Phase B already provide that replay.

**G5. Never sell offline time.** Scapewatch drew "pay-to-win" complaints and doubled its caps five days after launch [O][P].

---

## 5 Do not adopt

- **A generated or random task queue.** It is Scapewatch's core feature and its most divisive one. It contradicts Ley Reach's queue, which the player writes per person, and its Standing Orders.
  - The **new-tasks bar** is worth keeping in reserve, but it only matters if Standing Orders gain an action that adds queue entries. `ACTION_KINDS` has `beginActivity` and no such action.
  - If one is added, rows a rule inserts go above a boundary the player places, and automation never touches anything below it.
- **Scapewatch's resolution formula.** Ley Reach's d100 engine and calibration bands are canon (`docs/CANON_MAPPING.md`).
  - Margin already carries any overflow into the quality tier.
  - Scapewatch pays a failure 10% of a success. Ley Reach's progression treats honest failure as the better teacher. Do not import it.
- **An opening built on clicking.** Realindustry's demo, the most manual part of the game, scored 44%. This supports item 2 of ley-reach #95.
  - Keep Tap the Nexus as an optional active input, not something progress depends on.
  - The README already calls it "the opening move, not the game".
- **Paid offline hours** (G5).
- **A world view that is only decoration.** Scapewatch players called the distance indicator cosmetic and the map decorative [P]. Phase F already requires that location carry mechanical weight; hold the 2D client to that.

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
| Queue changed by unrelated actions | Scapewatch 1.0.2 | Add skip-mid-order and intro-replay cases to `test/queue-controls.test.js` |
| Rebalance taking back earned rewards | The Ash Remembers 1.3.8 | Already practised: the retired ladder kept as history |

## 7 Mapping to open issues and the plan

| Item | Ley Reach issue or plan section |
|---|---|
| R1 dial precision, time in band | [#95](https://github.com/kendur/ley-reach/issues/95), item 3 |
| Nexus demoted (§5) | [#95](https://github.com/kendur/ley-reach/issues/95), item 2 |
| Order of the trades list: R7 pins plus search, favourites and hide (Realindustry) | [#95](https://github.com/kendur/ley-reach/issues/95), item 1 |
| Quantity presets | [#94](https://github.com/kendur/ley-reach/issues/94). These games add little here; the existing 10, 100 and ∞ buttons are the right pattern to extend |
| Character sheet: show effective rating after strain and the expected tier spread, not only base stats ("honest values") | [#93](https://github.com/kendur/ley-reach/issues/93) |
| R5, R6 | [#87](https://github.com/kendur/ley-reach/issues/87), [#88](https://github.com/kendur/ley-reach/issues/88) |
| R2, R3, R4 | Phase B item 4, read-only queries and observable views |
| M1 | E21 Standing Orders and markers |
| M5 | E25 negotiated contracts and inquiries; Phase E |
| G1–G5 | Phase C; E27 security gates |

## 8 Open questions

1. **What does "the dial is very twitchy" (#95) mean?** It could be the *input*, which is a UI fix (R1). It could be the *needle's movement*, which is the dial's designed volatility and a balance decision.
2. **What should an order do when its inputs run out?** It could stall, as now, or fall back to study (M2). This touches the progression rulings.
3. **Is a persistent track past 99 (M3) the intended non-resetting return of the ladder?**
4. **Where should this document live?** It sits in `generalgaming` because this session was scoped there. If it belongs in ley-reach `docs/`, it should go through that repository's pull request process.

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

### Ley Reach (baseline)

All files are in `kendur/ley-reach` at `7e19c56`:

- Project documents: `Project-Setup.md`, `README.md`, `docs/DEVELOPMENT_PLAN.md`, `docs/PHASE_B.md`, `docs/PHASE0_BASELINE.md`
- Interface: `src/ui/app.js`, `src/ui/views.js`
- Standing Orders: `src/engine/rules.js`, `src/engine/ruleRunner.js`
- Resolution telemetry: `tools/engine-telemetry.js`
- Open issues: #87, #88, #93, #94, #95
