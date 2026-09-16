# Verification notes

## Reproduction

From `submissions/jsp-000301/`:

```text
lake exe cache get
lake build
```

The pinned environment is Lean 4.33.0 with Mathlib v4.33.0.

## What the Lean file proves

`PowerfulConsecutive.lean` proves:

1. `12167` is powerful.
2. `12168` is powerful.
3. `12167` is not a square.
4. `12168` is not a square.
5. Therefore the universal assertion that every consecutive powerful pair contains a square is false.

The prime-divisor steps use Mathlib's `Nat.Prime.dvd_mul` and `Nat.prime_eq_prime_of_dvd_pow`; the numerical equalities and square exclusions are discharged by arithmetic tactics.

## Local verification status

The repository submission was prepared against the pinned Lean/Mathlib versions above. A Lean compiler was not available in the execution environment used to prepare this contribution, so the author has **not** claimed a local compiler run in this file. The commands above are the intended clean reproduction; CI/maintainer review should perform the actual build before the catalog is changed to report a verified Lean proof.
