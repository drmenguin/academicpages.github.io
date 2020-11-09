---
title: 'Arithmetic Functions and Dirichlet Convolution'
date: 2020-11-10
permalink: /posts/2020/11/arithmetic-functions/
tags:
  - maths
  - number theory
---
\\(\def\bb{\mathbb}\\)An _arithmetic function_ is a sequence $f\colon\bb N\to\bb C$. Some of the important arithmetic functions we study in number theory are:

 - $\omega(n)$: the number of distinct prime divisors of $n$.
 - $\mu(n)$: the _Möbius function_, defined by
   \\begin{align\*}
        \mu(n) = \\begin{cases}
            (-1)^{\omega(n)} & \text{if $n$ is square-free},\\\\[.5em]
            \hfil 0 \hfil & \text{otherwise}.
        \\end{cases}
   \\end{align\*}
   (An integer $n$ is square-free if it has no square factors other than $1$.)
  - $\varphi(n)$: the (_Euler_) totient function, which counts the number of integers between $1$ and $n$ that have no common divisors with $n$, i.e.,
    \begin{equation\*}
    \varphi(n) = \sum_{\substack{k\leqslant n\\\\\\operatorname{hcf}(k,n)=1}}1.
    \end{equation\*}
  - $\Lambda(n)$: the (von) Mangoldt function, which outputs $\log p$ if $n$ is a prime power $p^k$, and is zero otherwise, i.e.,
    \\begin{align\*}
        \Lambda(n) = \\begin{cases}
            \log p & \text{if $n=p^k$ for some prime $p$ and integer $k\geqslant 1$},\\\\[.5em]
            \hfil 0 \hfil & \text{otherwise}.
        \\end{cases}
   \\end{align\*}

   Here is a table of the first few values of these functions.

| $n$ | $\texttt 1$ | $\texttt 2$ | $\texttt 3$ | $\texttt 4$ | $\texttt 5$ | $\texttt 6$ | $\texttt 7$ | $\texttt 8$ | $\texttt 9$ | $\texttt{10}$ |
|:---:|:-----------:|:-----------:|:-----------:|:-----------:|:-----------:|:-----------:|:-----------:|:-----------:|:-----------:|:-------------:|
| $\omega(n)$ | $\texttt 0$ | $\texttt 1$ | $\texttt 1$ | $\texttt 1$ | $\texttt 1$ | $\texttt 2$ | $\texttt 1$ | $\texttt 1$ | $\texttt 1$ | $\texttt 2$ |
| $\mu(n)$ | $\texttt 1$ | $\texttt{-1}$ | $\texttt{-1}$ | $\texttt 0$ | $\texttt{-1}$ | $\texttt 1$ | $\texttt {-1}$ | $\texttt 0$ | $\texttt 0$ | $\texttt 1$ |
| $\varphi(n)$ | $\texttt 1$ | $\texttt 1$ | $\texttt 2$ | $\texttt 2$ | $\texttt 4$ | $\texttt 2$ | $\texttt 6$ | $\texttt 4$ | $\texttt 6$ | $\texttt 4$ |
| $\Lambda(n)$ | $\texttt 0$ | $\texttt{log 2}$ | $\texttt{log 3}$ | $\texttt {log 2}$ | $\texttt {log 5}$ | $\texttt 0$ | $\texttt {log 7}$ | $\texttt{log 2}$ | $\texttt {log 3}$ | $\texttt 0$ |

## Some divisor sums
The only non-zero values the Möbius function takes on are $\pm1$. It might be informative to study the cancellation which we obtain when we sum over its values. Intuitively, we might try to study the sum
\begin{equation\*}
    M(x) = \sum_{n\leqslant x} \mu(n)
\end{equation\*}
of its consecutive values, but this turns out to be a difficult sum to understand. In fact, it was conjectured that $|M(x)|<\sqrt x$, which seems reasonable if we plot $M(x)$ and $\pm\sqrt x$ on the same axes, but it's actually false, i.e., there exists a large value of $x$ for which $M(x) > \sqrt x$.
<figure>
    <img class="welcome" src="{{ site.url }}/images/mertens-conjecture.png" alt="Plot of M(x) and sqrt(x)">
    <figcaption class="caption">Plot of $M(x)$ and $\pm\sqrt x$ for $1\leqslant x\leqslant10\,000$</figcaption>
</figure>

It turns out the sum we should study is that over the _divisors_ of a given $n$. Let $\varepsilon(n)$ denote the arithmetic function which is $1$ when $n=1$, and $0$ everywhere else. It turns out that
\begin{equation}
    \label{eq:muDivisorSum}
    \sum_{d\mid n} \mu(d) = \varepsilon(n),
\end{equation}
where the sum is over all divisors $d$ of $n$. For example, we see that for $n=6$, we have
\begin{equation\*}
    \mu(1) + \mu(2) + \mu(3) + \mu(6)  = 1 -1 -1 + 1 = 0 = \varepsilon(6).
\end{equation\*}

The proof of this fact is quite straightforward.

_Proof of \eqref{eq:muDivisorSum}:_ In the case when $n=1$, we clearly have $\sum_{d\mid 1}\mu(d)=\mu(1)=1$. For $n\geqslant 2$, factorise $n=\prod_{i=1}^{k}p_i^{n_i}$ by the fundamental theorem of arithmetic, where $k=\omega(n)$. Observe that the sum has non-zero contributions from square-free divisors only, i.e.,
        \\begin{align\*}
            \sum_{d\mid n}\mu(d) &= \mu(1)+\mu(p_1)+\cdots+\mu(p_k) + \mu(p_1p_2) + \cdots  + \mu(p_1\cdots p_k)\\\\[-7pt]
            &= 1+(-1)^1 + \cdots + (-1)^1 + (-1)^2 + \cdots + (-1)^k\\\\[1pt]
            &= 1+ \binom k1 (-1)^1 + \binom k2(-1)^2 + \cdots + \binom kk (-1)^k
            = (1-1)^k = 0,
        \\end{align\*}
        by the binomial theorem, which completes the proof. $$\tag*{$\Box$}$$

We have a similarly nice result for the divisor sum of the totient function. For any integer $n\geqslant 1$,
\begin{equation}
    \label{eq:phiDivisorSum}
    \sum_{d\mid n} \varphi(d) = n.
\end{equation}
To prove this formally, one would partition $\bb Z/n\bb Z$ according to the value of $\operatorname{hcf}(n,r)$ for each residue $r$, obtaining $n=\#(\bb Z/n\bb Z)=\sum\_{d\mid n}\varphi(d)$. But we can do it in a more informal way which conveys the essential idea behind the proof.

_Proof of \eqref{eq:phiDivisorSum}:_ Consider the $n$ fractions $1/n, \dots, n/n$, and simplify them so that they are in reduced form. Each fraction, when reduced, will have a denominator which is a divisor of $n$. But for each divisor $d$ of $n$, there are precisely $\varphi(d)$ fractions with denominator $d$. Thus the total number of fractions is $\sum_{d\mid n}\varphi(d)$. $$\tag*{$\Box$}$$

Finally, a result which relates the two functions $\mu$ and $\varphi$ is the following.
\begin{equation}
    \label{eq:phiMuDivisorSum}
    \varphi(n) = \sum_{d\mid n}\mu (d)\,\frac nd,
\end{equation}
or written differently, $\varphi(n)= \sum_{ab = n} \mu(a)\,b$.

_Proof of \eqref{eq:phiMuDivisorSum}:_ Let the symbol $\boldsymbol 1\_{\mathcal P}$ be equal to $1$ if $\mathcal P$ is true, and $0$ otherwise. By definition of $\varphi$ and \eqref{eq:muDivisorSum}, we have
\\begin{align\*}
    \varphi(n) = \sum_{\substack{k\leqslant n\\\\\operatorname{hcf}(k,n)=1}}1=\sum_{k=1}^n \varepsilon(\operatorname{hcf}(k,n)) &= \sum_{k=1}^n\sum_{d\mid(k,n)}\mu(d)\\\\[0pt]
    &= \sum_{k=1}^n\sum_{\substack{d\mid n\\\\d\mid k}}\mu(d)\\\\[0pt]
    &= \sum_{k=1}^n\sum_{\substack{d\mid n}}\mu(d)\, \boldsymbol 1_{d\mid k}\\\\[0pt]
    &= \sum\_{d\mid n}\mu(d)\sum\_{k=1}^n \boldsymbol 1\_{d\mid k} = \sum\_{d\mid n}\mu(d)\,\frac nd,
\end{align\*}
which completes the proof. $$\tag*{$\Box$}$$

## Dirichlet Convolution
In general, sums of the form
\begin{equation\*}
    \sum_{d\mid n} f(d)\,g\Big(\frac nd\Big) \qquad \text{or, written differently,} \qquad \sum_{ab=n} f(a)\,g(b),
\end{equation\*}
are quite common in number theory. This leads to the following definition.

**Definition.** Let $f,g\colon\bb N\to\bb C$ be two arithmetic functions. Their (_Dirichlet_) _convolution_, denoted by $f\*g$, is the function defined by
\begin{equation\*}
    (f\*g)(n) = \sum_{d\mid n} f(d)\,g\Big(\frac nd\Big)
\end{equation\*}
for all $n\in\bb N$.

In terms of this notation, we may express \eqref{eq:phiMuDivisorSum} as
\begin{equation\*}
    \varphi = \mu \* \operatorname{id},
\end{equation\*}
where $\operatorname{id}$ denotes the identity function $\operatorname{id}(n) = n$ for all $n$.

It turns out that the set of arithmetic functions with $f(1)\neq 0$ forms an Abelian group under the operation of Dirichlet convolution. Indeed, if $f,g, h\colon\bb N\to\bb C$ are arithmetical functions with $f(1),g(1), h(1) \neq 0$, then:
 1. $f\* g$ is an arithmetical function,
 2. $f\*(g\*h) = (f\*g)\* h$,
 3. $f\*\varepsilon = \varepsilon\* f = f$,
 4. there exists $f^{-1}$ such that $f^{-1}\* f = f\* f^{-1} = \varepsilon$,
 5. $f\*g = g\*f$.

 The proofs of these properties are very straightforward, the only interesting one is the fourth one.  It turns out the inverse $f^{-1}$ is given by the recursive formula
\begin{equation}
    \label{eq:inverse}
    f^{-1}(1) = \frac 1{f(1)} \qquad \text{and} \qquad f^{-1}(n) = -\frac{1}{f(1)}\sum\_{\substack{d\mid n\\\\d\neq n}}f\Big(\frac nd\Big) f^{-1}(d),
\end{equation}
and we can prove this by induction. Clearly for the base case, we want $f^{-1}$ to satisfy $(f\*f^{-1})(1) = \varepsilon(1)$, which expands to $f(1)f^{-1}(1) = 1$, and this forces us to take $f^{-1}(1)$ as above.

Now for the inductive step, let $n\geqslant 2$, and suppose $f^{-1}$ is well-defined for all values less than $n$. Then we want to ensure that $(f\*f^{-1})(n) = \varepsilon(n) = 0$, i.e.,
\begin{equation\*}
    \sum\_{d\mid n}f\Big(\frac nd\Big)f^{-1}(d)=0,
\end{equation\*}
or, taking out the term where $d=n$,
\begin{equation\*}
    f(1)f^{-1}(n) + \sum\_{\substack{d\mid n\\\\d\neq n}}f\Big(\frac nd\Big)f^{-1}(d) = 0.
\end{equation\*}
Since we assumed that $f^{-1}(d)$ is defined for all $d<n$, we can solve this to get a unique value for $f^{-1}(n)$ as defined in \eqref{eq:inverse} above, this establishes the existence and uniqueness of $f^{-1}$. $$\tag*{$\Box$}$$

By \eqref{eq:muDivisorSum}, we have that $\mu\*\boldsymbol 1=\varepsilon$, so $\mu$ and $\boldsymbol 1$ are Dirichlet inverses of each other, i.e., $\mu^{-1} = \boldsymbol 1$ and $\boldsymbol 1^{-1} = \mu$. This fact, together with the group structure of arithmetic functions under convolutions, gives us a one line proof of the famous result known as the Möbius inversion formula:
 \begin{equation}
    \label{eq:mobiusInversion}
    g = f \* \boldsymbol 1 \iff f = g\* \mu.
 \end{equation}
 This follows by convolving the equation on the left with $\mu$ on both sides.


## An Application to $\Lambda(n)$ and Cyclotomic Polynomials
We haven't said much about $\Lambda(n)$ yet. Notice that
\begin{equation}
    \label{eq:LambdaSum}
    \sum\_{d\mid n} \Lambda(d) = \log n,
\end{equation}
or in terms of convolutions, $\boldsymbol 1\*\Lambda = \log$. To see why this holds, simply factorise $n = \prod\_{i=1}^k p_i^{n_i}$ using the fundamental theorem of arithmetic, to get
\begin{equation\*}
    \sum_{d\mid n}\Lambda(d) = \sum_{i=1}^k \sum_{\substack{\ell \geqslant 1\\\\p_i^\ell \mid n}} \log p_i = \sum_{i=1}^k n_i \log p_i = \log n,
\end{equation\*}
as required. Now by Möbius inversion, we get a formula for $\Lambda(n)$ for free:
\begin{equation\*}
    \Lambda(n) = - \sum_{d\mid n}\mu(d)\,\log d.
\end{equation\*}
Indeed, \eqref{eq:mobiusInversion} gives us $\bb 1*\Lambda = {\log} \implies \Lambda = {\log} * \mu,$ i.e.,
\begin{equation\*}
    \Lambda(n) = \sum_{d\mid n}\mu(d)\log\Big(\frac nd\Big) = \log n \sum_{d\mid n}\mu (d) - \sum_{d\mid n}\mu(d)\,\log d,
\end{equation\*}
and by \eqref{eq:muDivisorSum} the first sum is $\varepsilon(n)\log n$ which equals 0 for all $n$.

Now let's see another application of Möbius inversion, this time to cyclotomic polynomials. The $n$th cyclotomic polynomial $\Phi_n$ is the unique monic irreducible polynomial that divides $x^n-1$ and does _not_ divide $x^k-1$ for any $k<n$. Its roots are precisely the primitive $n$th roots of unity, i.e.,
\begin{equation}
    \Phi_n(x) = \prod\_{\substack{k\leqslant n\\\\\operatorname{hcf}(k,n)=1}}\big(x - e^{2\pi i\,k/n}\big).
\end{equation}
First, observe that
\begin{equation}
    \label{eq:cyclotomicFactorisation}
    x^n - 1 = \prod\_{d\mid n}\Phi_d(x).
\end{equation}
Indeed, the roots of the left-hand side are precisely the $n$th roots of unity. Any root $\zeta$ of the left-hand side must have order $d\mid n$, i.e., $\zeta^d = 1$ for some $d\mid n$ (and $d$ is the smallest $d\geqslant 1$ which does this). Thus $\zeta$ is a root of $\Phi_d$, which appears on the right-hand side. Conversely, any root of the right-hand side clearly satisfies $\zeta^n = 1$. Thus the two polynomials have the same roots, and are therefore equal.

We will now prove the formula
\begin{equation}
    \label{eq:cyclotomicFormula}
    \Phi_n(x) = \prod_{ab=n} (x^a-1)^{\mu(b)}.
\end{equation}
Indeed, taking logs of \eqref{eq:cyclotomicFactorisation}, we see that
\begin{equation\*}
    \log(x^n-1) = \sum_{d\mid n}\log(\Phi_d(x)),
\end{equation\*}
and so by Möbius inversion,
\\begin{align\*}
    \log(\Phi_n(x)) &= \sum_{ab=n} \mu(b)\,\log(x^a-1)
    = \log\Big(\prod_{ab=n}(x^a-1)^{\mu(b)}\Big).
\\end{align\*}
Taking exponentials of both sides yields \eqref{eq:cyclotomicFormula}.
