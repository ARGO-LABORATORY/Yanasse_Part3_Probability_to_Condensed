# Yanasse Part 3: Probability Theory &rarr; Condensed Mathematics

New Lean 4 proofs in condensed mathematics (Clausen--Scholze sheaf-theoretic framework), discovered by transferring tactic invocation patterns from Probability Theory via GPU-accelerated relational analogy matching.

> **Method.** GPU-accelerated NP-hard relational analogy (Deep Vision, running on a MacBook Air via Apple MPS) identifies structurally similar proof states across 217,133 Mathlib-extracted entries; an AI reasoning agent semantically adapts the source tactic pattern to the target theorem. The matching engine is entirely domain-independent.

## Repository contents

| File | Description |
|------|-------------|
| `yanasse_part3.tex` | Paper (LaTeX source) |
| `yanasse_part3.pdf` | Compiled paper |
| `proofs/item_21_congr_with_*.lean` | New proof: `congr with` schema &rarr; **strictly better** proof (no `set_option` needed) |
| `proofs/item_22_ext1_*.lean` | New proof: `ext1` schema &rarr; 3 proof variants with named binder |

## Results

2 new Lean-verified proofs from 2 successful schema transfers out of 10 attempts (20% schema success rate). Zero `sorry` declarations. Both proofs target the same theorem: the triangle identity of the adjunction between condensed sets and topological spaces (`topCatAdjunction.left_triangle_components`).

| Item | Source schema | Target theorem | Adaptation |
|------|--------------|----------------|------------|
| 21 | `congr with i` | `left_triangle_components` | `congr with x` replaces `ext` **without** requiring `set_option backward.isDefEq.respectTransparency false` &mdash; a strictly better proof |
| 22 | `ext1 x` | `left_triangle_components` | Named binder `ext1 x` + `change` + `simp`; 3 variant proofs (simp, simp only, rw+rfl) |

## Key findings

1. **Strictly better proof via cross-area transfer.** The transferred `congr with x` tactic works *without* the `set_option backward.isDefEq.respectTransparency false` workaround that the existing Mathlib `ext`-based proof requires. This is not a paraphrase but a genuine improvement.

2. **Maximum structural distance.** Condensed mathematics was designed to *eliminate* the filter-based and sigma-algebra-based vocabulary that probability-theory tactics depend on. At 20%, this is the lowest transfer rate in the series &mdash; yet the transfers that succeed produce a higher-quality proof than the original.

3. **Type-gated vs. architecture-gated schemas.** The 8 schemas that fail all interact with measure-theoretic *types* (filters, sigma-algebras, `CanLift` instances). The 2 that succeed operate on *proof architecture* (congruence, extensionality). This confirms the sharp dichotomy observed across all three target areas.

## Building

Requires Lean 4 (v4.29.0+) and Mathlib (v4.29.0+). Each proof file is self-contained:

```lean
import Mathlib
```

## Citation

```bibtex
@article{linhares2026yanasse3,
  title   = {Yanasse: Finding New Proofs from Deep Vision's Analogies --- Part~3:
             Probability Theory to Condensed Mathematics},
  author  = {Linhares, Alexandre},
  year    = {2026},
  month   = {April},
  publication = {Argolab.org Report for Dissemination}
}
```

## Authors

- **Alexandre Linhares** (alexandre@linhares.ltd)

## License

MIT. See [LICENSE](LICENSE).
