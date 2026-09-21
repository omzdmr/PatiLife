# PatiLife Automation Coordination

## Roles

### Product Research
- Does not write product code.
- Reads PRODUCT_MASTER_SPEC, DESIGN_SYSTEM and prior PRODUCT_RESEARCH_LOG entries first.
- Searches current external evidence.
- Writes durable findings to PRODUCT_RESEARCH_LOG.
- Strong new requirements become RESEARCH HANDOFFs.
- Never treats one review or one competitor feature as sufficient proof.

### Product Development
- Reads current repo HEAD, PRODUCT_MASTER_SPEC, DESIGN_SYSTEM and latest RESEARCH HANDOFFs before selecting work.
- Works on Android and iOS as one product; platform-specific behavior may differ when appropriate.
- The first product-development milestone is the approved visual shell and design system implementation.
- After the design foundation, advance the roadmap using meaningful vertical slices.
- Research handoffs are inputs, not automatic orders.

## Work-size rule
A development run must not finish normally before **25 minutes of real active development**.

Active work includes:
- targeted code/diff analysis tied to the selected feature
- implementation
- tests
- persistence/state/service integration
- accessibility work
- platform integration
- useful refactoring required by the active feature

Not active work:
- waiting for CI/build/tool results
- idle time
- rereading unchanged docs
- writing status prose
- artificial “busy work”

If the selected task blocks, switch to another non-conflicting meaningful backlog item. Do not spend the run polishing a single string, icon, TODO or tiny helper and call that product development.

A real hard blocker is inability to read the repository **and** inability to write/commit meaningful changes, or truly having no applicable product backlog left. A failed issue comment or one unavailable tool action is not by itself a hard blocker.

## GitHub audit trail
Research and development must leave durable GitHub evidence.
- Research: PRODUCT_RESEARCH_LOG entries + optional research coordination issue comments.
- Development: commits plus START/DONE/HANDOFF comments when the coordination issue is available.
- START comment: current HEAD + selected medium/large user-value goal.
- DONE/HANDOFF: work completed, commits, test/build status, active development duration, remaining risk and next meaningful step.
- If issue comments fail, keep the real work and commits; report the audit failure separately.

## Concurrency
- Before writing, refresh HEAD.
- Before committing, refresh HEAD again.
- Never force-overwrite another run.
- Prefer coherent commits.
- If concurrent changes touch the same area, choose a different non-conflicting backlog item.

## Design priority
The initial development runs should establish:
1. design tokens/theme
2. light/dark surfaces
3. navigation shell
4. onboarding visual direction
5. Home/Today hero + timeline
6. Health shell
7. Diary shell
8. Profile shell
9. bottom-sheet quick logging pattern
10. motion/accessibility foundations

Only then should visual language be allowed to drift into feature-by-feature improvisation.
