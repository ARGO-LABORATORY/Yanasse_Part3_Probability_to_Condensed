/-
  Yanasse item 21: B_reprove — SUCCESSFUL TRANSFER
  Source: Mathlib.Probability (congr with i in HasGaussianLaw.iIndepFun)
  Target: Mathlib.Condensed (topCatAdjunction, left_triangle_components)

  Schema 138: congr (arity 0, has_with=true, uses_lemma=false)

  Result: `congr with x` successfully replaces `ext` as the opening tactic
  in the left_triangle_components proof. The transferred tactic works WITHOUT
  `set_option backward.isDefEq.respectTransparency false`, which the original
  `ext`-based proof in Mathlib requires.
-/

import Mathlib.Condensed.TopCatAdjunction
import Mathlib.Topology.Category.CompactlyGenerated

open Condensed CondensedSet CategoryTheory CompHaus

universe u

-- Transferred proof using schema 138 (congr with <var>) from Mathlib.Probability:
-- No `set_option backward.isDefEq.respectTransparency false` needed!
example (Y : CondensedSet.{u}) :
    condensedSetToTopCat.map (topCatAdjunctionUnit Y) ≫
      topCatAdjunctionCounit (condensedSetToTopCat.obj Y) = 𝟙 _ := by
  congr with x
  change Y.obj.map (𝟙 _) x = x
  simp

-- NOTE: The original `ext`-based proof FAILS without the set_option:
-- example (Y : CondensedSet.{u}) :
--     condensedSetToTopCat.map (topCatAdjunctionUnit Y) ≫
--       topCatAdjunctionCounit (condensedSetToTopCat.obj Y) = 𝟙 _ := by
--   ext
--   change Y.obj.map (𝟙 _) _ = _
--   simp
-- Error: unsolved goals (the change/simp sequence can't close the goal)
-- The Mathlib version requires `set_option backward.isDefEq.respectTransparency false`.
