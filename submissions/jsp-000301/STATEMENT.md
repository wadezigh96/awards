# JSP-000301 statement correspondence

## Cataloged problem

JSP-000301 asks whether, when two consecutive positive integers are both powerful, at least one must be a perfect square.

The recorded answer is **no**. A published counterexample is

- `12167 = 23^3`, and
- `12168 = 2^3 · 3^2 · 13^2`.

Both integers are powerful, they are consecutive, and neither is a square. This is the counterexample recorded for Erdős Problem 365.

Sources:

- Erdős Problems, Problem 365: https://www.erdosproblems.com/365
- OEIS A227297 (consecutive powerful pairs with neither member square): https://oeis.org/A227297
- S. W. Golomb, “Powerful numbers”, American Mathematical Monthly 77 (1970), 848–852.

## Formal statement used here

The Lean file defines

```text
Powerful n := ∀ p, Nat.Prime p → p ∣ n → p^2 ∣ n
IsSquare n := ∃ k, k^2 = n
```

and proves the concrete counterexample at `n = 12167`, followed by the equivalent negation of the universal claim.

The definition of `Powerful` is the standard 2-full/powerful-number definition appearing in the cited problem statement.
