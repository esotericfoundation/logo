# Plan

![[Plan.excalidraw|center]]

$$
\begin{align}
\tan{60 \degree} &= \frac{h}{\frac{s}{2}} \\
\implies \frac{s}{2} &= \frac{h}{\tan{60 \degree}} \\
\implies s &= \frac{2h}{\tan{60 \degree}} \\
 \\
-\sqrt{ 3 }(x - 256) + 384 &= (x - 256) + 256 \\
\implies -\sqrt{ 3 }(x - 256) + 384 &= x \\
\implies -\sqrt{ 3 }x + \sqrt{ 3 } \times 256 + 384 &= x \\
\implies \sqrt{ 3 } \times 256 + 384 &= x(1 + \sqrt{ 3 }) \\
\implies x &= \frac{{\sqrt{ 3 } \times 256 + 384}}{1 + \sqrt{ 3 }} \\
 \\
\sqrt{ 3 }(x - 256) + 384 &= -(x - 256) + 256 \\
\implies \sqrt{ 3 }x - \sqrt{ 3 } \times 256 + 384 &= -x + 256 + 256 \\
\implies \sqrt{ 3 }x - \sqrt{ 3 } \times 256 + 384 &= 512 - x \\
\implies x(1  + \sqrt{ 3 }) &= 512 - 384 + \sqrt{ 3 } \times 256 \\
\implies x &= \frac{{128 + \sqrt{ 3 } \times 256}}{1 + \sqrt{ 3 }}
\end{align}
$$

```math
w = 512
r =  w/2

C_x = w/2
C_y = w/2

C = [C_x, C_y]

T_h = 256

T_C = C + [0, T_h / 2]

s = (2 * T_h)/(tan(pi / 3))

T_A = round(C - [0, T_h / 2] + [s/2, 0])
T_B = round(C - [0, T_h / 2] - [s/2, 0])

d_S_d = 10
w_S = 45

d_S_v = d_S_d * sqrt(2)
d_S = w_S * sqrt(2)

S_A = round(C - [0, d_S_v])

S_c = S_A - round([0, d_S / 2])

S_B = round(S_c + [d_S/2, 0])
S_D = round(S_c - [d_S/2, 0])

S_C = round(S_c - [0, d_S / 2])

l_R(x) = (x - 256) + 256
l_L(x) = -(x - 256) + 256

m_T = sqrt(3) # -T_h / (s / 2)

t_L(x) = m_T * (x - 256) + 384
t_R(x) = -m_T * (x - 256) + 384

I_R_x = (sqrt(3) * 256 + 384)/(1 + sqrt(3))
I_R_y = l_R(I_R_x)

abs(I_R_y - t_R(I_R_x)) < 0.0001

I_L_x = (sqrt(3) * 256 + 128)/(1 + sqrt(3))
I_L_y = l_L(I_L_x)

abs(I_L_y - t_L(I_L_x)) < 0.0001
```
