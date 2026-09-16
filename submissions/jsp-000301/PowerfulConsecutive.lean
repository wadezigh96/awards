import Mathlib

namespace JSP000301

/-- A positive integer is powerful (2-full) when every prime divisor occurs
with exponent at least two. -/
def Powerful (n : ℕ) : Prop :=
  ∀ p : ℕ, Nat.Prime p → p ∣ n → p ^ 2 ∣ n

/-- `IsSquare n` means that `n` is the square of a natural number. -/
def IsSquare (n : ℕ) : Prop :=
  ∃ k : ℕ, k ^ 2 = n

lemma powerful_12167 : Powerful 12167 := by
  intro p hp hpd
  have hpd' : p ∣ 23 ^ 3 := by
    norm_num at hpd ⊢
    exact hpd
  have hpeq : p = 23 :=
    Nat.prime_eq_prime_of_dvd_pow hp (by norm_num) hpd'
  subst p
  norm_num

lemma powerful_12168 : Powerful 12168 := by
  intro p hp hpd
  have hfactor : p ∣ 2 ^ 3 * 3 ^ 2 * 13 ^ 2 := by
    norm_num at hpd ⊢
    exact hpd
  rcases (hp.dvd_mul).mp hfactor with hleft | h13
  · rcases (hp.dvd_mul).mp hleft with h2 | h3
    · have hpeq : p = 2 :=
        Nat.prime_eq_prime_of_dvd_pow hp (by norm_num) h2
      subst p
      norm_num
    · have hpeq : p = 3 :=
        Nat.prime_eq_prime_of_dvd_pow hp (by norm_num) h3
      subst p
      norm_num
  · have hpeq : p = 13 :=
      Nat.prime_eq_prime_of_dvd_pow hp (by norm_num) h13
    subst p
    norm_num

lemma not_square_12167 : ¬ IsSquare 12167 := by
  rintro ⟨k, hk⟩
  have h : k ≤ 110 ∨ 111 ≤ k := by omega
  rcases h with h | h <;> nlinarith

lemma not_square_12168 : ¬ IsSquare 12168 := by
  rintro ⟨k, hk⟩
  have h : k ≤ 110 ∨ 111 ≤ k := by omega
  rcases h with h | h <;> nlinarith

/-- The first part of JSP-000301 has a negative answer: there are consecutive
powerful integers for which neither integer is a perfect square. -/
theorem jsp_000301_counterexample :
    ∃ n : ℕ,
      Powerful n ∧ Powerful (n + 1) ∧
        ¬ IsSquare n ∧ ¬ IsSquare (n + 1) := by
  refine ⟨12167, powerful_12167, ?_, not_square_12167, ?_⟩
  · norm_num
    exact powerful_12168
  · norm_num
    exact not_square_12168

/-- Equivalently, the universal claim that one of two consecutive powerful
integers must be a square is false. -/
theorem jsp_000301_answer :
    ¬ (∀ n : ℕ, Powerful n → Powerful (n + 1) →
      IsSquare n ∨ IsSquare (n + 1)) := by
  intro h
  have hs : IsSquare 12167 ∨ IsSquare (12167 + 1) := by
    apply h 12167 powerful_12167
    norm_num
    exact powerful_12168
  rcases hs with hs | hs
  · exact not_square_12167 hs
  · norm_num at hs
    exact not_square_12168 hs

end JSP000301
