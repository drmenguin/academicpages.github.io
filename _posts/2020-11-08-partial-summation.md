---
title: 'Partial Summation and a Probabilistic Example'
date: 2020-11-08
permalink: /posts/2020/11/partial-summation/
tags:
  - maths
  - number theory
---

A very useful result used often in analytic number theory is the so-called partial summation formula. If $(a_n)$ is a sequence of complex numbers, $f$ is a continuously differentiable function on $[1,x]$, and $A(x)$ denotes the partial sums $\sum_{n\leqslant x}a_n$ of the sequence, then we have that
\begin{equation}
    \tag{$*$}
    \label{eq:partialSummation}
    \sum_{n\leqslant x} a_n\,f(n) = A(x)f(x) - \int_1^x A(t)\,f'(t)\,dt.
\end{equation}
To illustrate how to apply this result, we determine a formula for the harmonic number $\sum_{n\leqslant x}\frac 1n$. Notice that to apply \eqref{eq:partialSummation}, we need to pick an $a_n$ and an $f(n)$. It makes no sense to take $a_n$ to be $\frac 1n$, since then we'd need information about $A(x)$, which is exactly what we're trying to find. Thus we take $a_n = 1$ and $f(n) = \frac1n$ in the theorem, to get
\\begin{align\*}
   \sum_{n\leqslant x}\frac 1n &= \frac{\lfloor x\rfloor}x + \int_1^x \frac{\lfloor t\rfloor}{t^2}\,dt,
\\end{align\*}
which is already an interesting fact in and of itself. Now since $\lfloor x\rfloor$ and $x$ differ by at most $1$, we have that $\lfloor x\rfloor = x + O(1)$, so
\\begin{align\*}
    \sum_{n\leqslant x}\frac 1n &= \frac{x+O(1)}x + \int_1^x \frac{t+O(1)}{t^2}\,dt\\\\[3pt]
            &= 1 + O\Big(\frac1x\Big) + \int_1^x \frac{dt}{t} + O\Big(\int_1^x \frac{dt}{t^2}\Big)\\\\[3pt]
            &= 1 + O\Big(\frac1x\Big) + \log x + O(1)\\\\[3pt]
            &= \log x + O(1),
\\end{align\*}
which is a nice estimate for $\sum_{n\leqslant x}\frac 1n$. From this estimate, it is clear why $\sum_n\frac1n$ diverges (since $\log x\to\infty$ as $x\to\infty$). It turns out that
\begin{equation\*}
    \gamma=\lim_{x\to\infty}\Big(\sum_{n\leq x}\frac1n-\log x\Big)
\end{equation\*}
        exists, and is known as the [Euler--Mascheroni constant](https://en.wikipedia.org/wiki/Euler%E2%80%93Mascheroni_constant) ($\gamma\approx 0.577$).

## Proof of the Formula
The proof of the formula is really quite straightforward. Notice that $a_n = A(n)-A(n-1)$, so
\\begin{align\*}
    \sum_{n\leqslant x} a_n\, f(n) &= \sum_{n\leqslant x}\big(A(n)-A(n-1)\big) f(n)\\\\[3pt]
    &= \sum_{n\leqslant x} A(n)\,f(n) - \sum_{n\leqslant x-1} A(n)\,f(n+1)\\\\[3pt]
    &= A(x)\,f(\lfloor x\rfloor)+\sum_{n\leqslant x-1} A(n)\,f(n) - \sum_{n\leqslant x-1} A(n)\,f(n+1)\\\\[3pt]
    &= A(x)\,f(\lfloor x\rfloor) - \sum_{n\leqslant x-1} A(n)\int_n^{n+1}f'(t)\,dt\\\\[3pt]
    &= A(x)\,f(\lfloor x\rfloor) - \sum_{n\leqslant x-1} \int_n^{n+1}A(t)\,f'(t)\,dt,
\\end{align\*}
since $A(t)$ is constant ($=A(n)$) over $n<t<n+1$. Now the integrals are over contiguous unit intervals, so we can combine them to get
\begin{equation}
    \sum_{n\leqslant x} a_n\, f(n) = A(x)\,f(\lfloor x\rfloor) -  \int_1^{\lfloor x\rfloor}A(t)\,f'(t)\,dt.\tag{$\dagger$}\label{eq:dagger}
\end{equation}
Finally, observe that
\begin{equation\*}
    \int_{\lfloor x\rfloor}^x A(t)\,f'(t)\,dt = A(x)f(x) - A(x)f(\lfloor x\rfloor),
 \end{equation\*}
 so adding $0 = A(x)f(x) - A(x)f(\lfloor x\rfloor) - \int_{\lfloor x\rfloor}^x A(t)\,f'(t)\,dt$ to the RHS of \eqref{eq:dagger} completes the proof. $$\tag*{$\Box$}$$

### Exercise
Show that
\begin{equation\*}
    \sum_{n\leq x}\log n = x\log x - x + O(\log x).
\end{equation*}

## A Nice Probabilistic Example
We show that the probability that two randomly chosen numbers from $\\{1,\dots,n\\}$ add up to a perfect square is
\begin{equation\*}
\frac{4\sqrt 2-4}{3\sqrt n} + O\Big(\frac1n\Big).
\end{equation\*}
Clearly the probability is $s_n / n^2$, where
\begin{equation\*}
    s_n = \\#\\{(a,b)\in\{1,\dots,n\}^2 : \text{$a + b = k^2$ for some $k$}\\}.
\end{equation*}
We can construct all valid pairs $(a,b)$ which contribute to the total $s_k$ as follows. First, we pick $a$ in the range $1\leqslant a\leqslant n$, and then choose $k$ such that $b=a-k^2$ lies in the range $1\leqslant k^2 - a\leqslant n$, i.e., such that
\begin{equation\*}
    1+a\leqslant k^2 \leqslant n+a,
\end{equation\*}
i.e.,
\begin{equation\*}
    \lceil\sqrt{1+a}\rceil \leqslant k \leqslant \lfloor \sqrt{n+a}\rfloor.
\end{equation\*}
For each $1\leqslant a\leqslant n$, there are precisely $\lfloor \sqrt{n+a}\rfloor-\lceil\sqrt{1+a}\rceil+1$ choices of $k$, and therefore precisely this number of corresponding choices for $b$. Thus we have
\\begin{align\*}
    s_n &= \sum_{a\leqslant n}\big(\lfloor \sqrt{n+a}\rfloor-\lceil\sqrt{1+a}\rceil+1\big) \\\\[3pt]
    &= \sum_{a\leqslant n}\big( \sqrt{n+a}-\sqrt{1+a}+O(1)\big) \\\\[3pt]
    &= \sum_{a\leqslant n} \sqrt{n+a}-\sum_{a\leqslant n}\sqrt{1+a}+O(n), \tag{$\ddagger$}\label{eq:ddagger}
\\end{align\*}
and we are led to estimating a pair of sums of the form $\sum_{a\leq n}\sqrt{X+a}$. Summing by parts, we see that
\\begin{align\*}
    \sum_{a\leqslant n}\sqrt{X+a} &= n\sqrt{X+n} - \frac12\int_1^n\frac{\lfloor t\rfloor}{\sqrt{X+t}}\,dt\\\\[3pt]
        &= n\sqrt{X+n} - \frac12\int_1^n\frac{t}{\sqrt{X+t}}\,dt + O\Big(\int_1^n\frac{dt}{\sqrt{X+t}}\Big)\\\\[3pt]
        &=n\sqrt{X+n} +\frac{2X(\sqrt{X+n}-\sqrt{X+1})-n\sqrt{X+n}}{3} + O(\sqrt{X+n}),
\\end{align\*}
and so by \eqref{eq:ddagger},
\\begin{align\*}
    s_n &=\left(n\sqrt{2n} + \frac{2n(\sqrt{2n}-\sqrt{n+1})-n\sqrt{2n}}{3}\right) \\\\[3pt]
    &\hspace{2cm} - \left(n\sqrt{1+n}+\frac{2(\sqrt{1+n}-\sqrt2)-n\sqrt{1+n}}{3}\right) + O(n)\\\\[3pt]
    &= \frac{4(n\sqrt{2n}-n\sqrt{1+n})}3 + O(n) = \frac{4(\sqrt 2-1)}{3}\,n\sqrt n + O(n),
\\end{align\*}
thus the probability is
\begin{equation\*}
    \frac{4\sqrt 2-4}{3\sqrt n} + O\Big(\frac1n\Big),
\end{equation\*}
as required.  $$\tag*{$\Box$}$$
