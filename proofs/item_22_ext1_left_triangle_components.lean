import Mathlib

/-!
  B_reprove: item_id=22, schema_id=95 (ext1, arity 1)
  Source: Mathlib.Probability (map_prod_map, ext1 x for kernel extensionality)
  Target: Mathlib.Condensed (topCatAdjunction, left_triangle_components)

  Transfer result: CLOSED. Three valid proofs using `ext1 x` (the source
  pattern) instead of bare `ext` (the original target pattern).
-/

open CategoryTheory Condensed CondensedSet CompHaus

universe u

-- Proof A: ext1 x + change + simp (closest to original, with named variable)
set_option backward.isDefEq.respectTransparency false in
theorem topCatAdjunction_left_triangle_ext1_A (Y : CondensedSet.{u}) :
    condensedSetToTopCat.map (topCatAdjunctionUnit Y) ≫
      topCatAdjunctionCounit Y.toTopCat = 𝟙 _ := by
  ext1 x
  change Y.obj.map (𝟙 _) x = _
  simp

-- Proof B: ext1 x + change + simp only (fully explicit lemma list)
set_option backward.isDefEq.respectTransparency false in
theorem topCatAdjunction_left_triangle_ext1_B (Y : CondensedSet.{u}) :
    condensedSetToTopCat.map (topCatAdjunctionUnit Y) ≫
      topCatAdjunctionCounit Y.toTopCat = 𝟙 _ := by
  ext1 x
  change Y.obj.map (𝟙 _) x = _
  simp only [FunctorToTypes.map_id_apply, condensedSetToTopCat_obj_carrier, TopCat.hom_id,
    ContinuousMap.id_apply]

-- Proof C: ext1 x + change + rw + rfl (source-inspired rewrite chain)
set_option backward.isDefEq.respectTransparency false in
theorem topCatAdjunction_left_triangle_ext1_C (Y : CondensedSet.{u}) :
    condensedSetToTopCat.map (topCatAdjunctionUnit Y) ≫
      topCatAdjunctionCounit Y.toTopCat = 𝟙 _ := by
  ext1 x
  change Y.obj.map (𝟙 _) x = _
  rw [FunctorToTypes.map_id_apply]
  rfl

