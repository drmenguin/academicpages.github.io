---
title: 'Partial Summation and a Probabilistic Example'
date: 2020-11-08
permalink: /posts/2020/11/partial-summation/
tags:
  - maths
  - number theory
---

A very useful result used often in analytic number theory is the so-called partial summation formula. It is a technique used to change sums into integrals, so that we can then use the nice results of calculus to attack the integral more effectively. We know that
\begin{equation\*}
    \sum\_{n=1}^N 1 = N, \qquad \sum_{n=1}^N n = \frac{n(n+1)}2,
\end{equation\*}
and we have similar results for $\sum\_{k\leqslant N} n^k$ where $k$ is a positive integer, but can we get a nice formula for sums like
\begin{equation\*}
    \sum\_{n=1}^N \frac 1n \qquad \text{or} \qquad \sum\_{n=1}^N \log n?
\end{equation\*}
What about
\begin{equation\*}
    \sum\_{n=1}^N \sqrt{n}?
\end{equation\*}
This is what partial summation will help us achieve.

## Big-Oh Notation
Here we introduce a tidy notation used throughout analysis to keep track of the error when estimating a quantity. We write $f(x) = O(g(x))$ if there exists a constant $C>0$ such that
\begin{equation\*}
    |f(x)|\leqslant C\, g(x)
\end{equation\*}
for all $x$ under consideration, usually for $x$ larger than some fixed constant. In this sense, $f(x) = O(g(x))$ intuitively means that "eventually, $f$ is no bigger than $g$ times some fixed constant".

Here are some examples.
 - $f(x)=3x^2 + 4x + 5 = O(x^2)$, since for all $x\geqslant 5$, we we have \begin{equation\*}3x^2 + 4x + 5 \leqslant 4 x^2.\end{equation\*}
 - $\sqrt x + \log x = O(x)$, indeed, $\sqrt x+\log x\leqslant 1\cdot x$ for all $x\geqslant 1$. We can also say that it is $O(\sqrt x)$, since $\sqrt x+\log x\leqslant 2\cdot \sqrt x$ for all $x\geqslant 0$.
 - $x\sqrt x + 2050 = x\sqrt x + O(1)$, we simply take $C=2050$.
 - $\log x = O(x^\epsilon)$ for all $\epsilon>0$. Indeed, since
   \begin{equation\*}
    \log x \leqslant x \implies \log(x^\epsilon) \leqslant x^\epsilon \implies \log x\leqslant \tfrac1\epsilon x^\epsilon,
   \end{equation\*}
 we take $C=\frac1\epsilon$.
 - $\sqrt{2x+3} = O(\sqrt x)$ since for $x\geqslant 3$, we have $\sqrt{2x+3} \leqslant \sqrt{2x+x} = \sqrt 3 \cdot \sqrt x$.

If $f(x) - g(x) = O(h(x))$, we also write $f(x) = g(x) + O(h(x))$. Some examples:
 - $3x^2 + 4x + 5 = 3x^2 + O(x)$.
 - $\sum\_{k=1}^n k = n^2 + O(n)$.
 - $n\log n+n\log(n^2) + 2\sqrt n + \log n = 3n\log n +O(\sqrt n)$.


## The Partial Summation Formula
As is customary when it comes to the kinds of sums we will be considering, we will let the upper limit of the sum be any real number $x$, and understand it to mean that we are summing over all positive integers less than that real number. For instance, we have that
\begin{equation\*}
    \sum\_{n\leqslant\pi} n^2 = 1^2 + 2^2 + 3^2.
\end{equation\*}
This convention will force us to rewriting some familiar results using the [floor function](https://en.wikipedia.org/wiki/Floor_and_ceiling_functions), e.g.,
\begin{equation\*}
    \sum\_{n\leqslant x}1 = \lfloor x\rfloor, \qquad
    \text{or} \qquad
    \sum\_{n\leqslant x} n = \frac{\lfloor x\rfloor(\lfloor x\rfloor +1)}2.
\end{equation\*}

Now we are ready to state the formula.


 **Theorem.** If $(a_n)$ is a sequence of complex numbers, $f$ is a continuously differentiable function on $[1,x]$, and $A(x)$ denotes the partial sums $\sum_{n\leqslant x}a_n$ of the sequence, then we have that
\begin{equation}
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
<figure>
    <img class="welcome" src="{{ site.url }}/images/euler-mascheroni.png" alt="Plot of log x and the xth Harmonic number">
    <figcaption class="caption">Plot of $\log x$ (blue) and $\sum_{n\leqslant x}\frac 1n$ (orange) for $1\leqslant x\leqslant10\,000$</figcaption>
</figure>


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
    \sum_{n\leqslant x} a_n\, f(n) = A(x)\,f(\lfloor x\rfloor) -  \int_1^{\lfloor x\rfloor}A(t)\,f'(t)\,dt.\label{eq:dagger}
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
    &= \sum_{a\leqslant n} \sqrt{n+a}-\sum_{a\leqslant n}\sqrt{1+a}+O(n), \tag{3} \label{eq:ddagger}
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
