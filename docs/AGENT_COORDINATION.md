# Agent Coordination

This file coordinates PatiLife scheduled research/development tasks, long-running Work/Codex sessions, and human contributors. Repository state is authoritative; chat memory is not.

## Source-of-truth order
1. `docs/PRODUCT_MASTER_SPEC.md`
2. `docs/IMPLEMENTATION_HANDOFF.md`
3. `docs/AGENT_COORDINATION.md`
4. `docs/DESIGN_SYSTEM.md`
5. `docs/LOCALIZATION.md`
6. `docs/ADS_POLICY.md`
7. `docs/APP_SIZE_BUDGET.md`
8. Accepted findings in `docs/PRODUCT_RESEARCH_LOG.md` and dated `research/` snapshots
9. Current code, tests, and CI

## Work lanes
### Hourly product research
- Research only. No product code.
- Writes durable evidence and accepted/rejected handoffs to GitHub.
- Must not silently redesign the approved visual system.

### Hourly product development
- Owns product implementation from the current roadmap/handoff.
- Must read the latest accepted research handoff before selecting work.
- Keeps Android+iOS one-product architecture and 10-locale contract.

### Long Work/Codex session
- Use a dedicated branch with prefix `work/patilife-`.
- Never overwrite the hourly developer's active changes.
- Before starting, fetch current main, read `IMPLEMENTATION_HANDOFF.md`, accepted research handoffs, and recent coordination issue comments.
- Pick a non-overlapping vertical slice. If another agent is active in the same model/screen/storage area, move to another roadmap item unless the owner assigns a takeover.

## Coordination protocol
Before meaningful work:
1. Record base SHA, branch, chosen vertical slice, and expected modules/files in the development coordination issue.
2. Check whether research has produced a newer accepted handoff.
3. Do not re-implement completed milestones.

During work:
- Prefer complete vertical slices: model -> persistence -> state/service -> UI/navigation -> accessibility -> tests.
- Re-check current HEAD before commits/landing.
- Persistent user-owned data must preserve migration, export/recovery, and backup compatibility as the architecture grows.
- Keep the approved design reference and four-tab shell unless the owner explicitly changes direction or strong recorded evidence justifies a documented handoff.
- Keep the 10 launch locales: en, tr, es-419, pt-BR, zh-CN, hi, id, ja, de, fr.

At every meaningful handoff:
- Update `docs/IMPLEMENTATION_HANDOFF.md` with completed work, exact blocker, validation status, and next concrete slice.
- Leave a concise coordination comment with commit SHA(s), tests/CI, files/modules touched, and ownership status.
- A new agent must be able to continue from GitHub alone.

## Pause / quota / interruption rule
If a long Work/Codex session stops because of usage limits, approval, network/tooling failure, or user interruption:
1. Do not claim completion.
2. Preserve coherent work on the dedicated branch when safe.
3. Update `IMPLEMENTATION_HANDOFF.md` with the exact partial state and next executable step.
4. Mark the coordination entry as PAUSED, not DONE.
5. On resume, re-fetch main and re-read this file plus the handoff. Never resume from stale chat state alone.

## Conflict rule
No force overwrite. If another agent has moved the target area, compare/rebase/reapply or abandon the stale implementation. If the overlap cannot be safely reconciled, document it and continue with a non-overlapping backlog item.

## Completion rule
A milestone is not final completion. Continue until the applicable master-spec roadmap, 10-locale parity, accessibility common-task matrix, Android+iOS behavior, export/recovery, tests, and release quality gates are satisfied.
