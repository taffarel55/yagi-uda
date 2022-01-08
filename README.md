# Projeto 1

**Alunos**: Breno Amin e Maurício Taffarel

**Data**: 21/09/2021

[TOC]

<div style="page-break-after: always; break-after: page;"></div>

## 1. Antena Yagi-Uda

### Introdução (Motivação)

As antenas constituem a parte essencial de todo sistema de comunicação uma vez que são responsáveis por receber e transmitir ondas eletromagnéticas (BALANIS, 1938). Uma antena é um dispositivo que atua como transdutor a partir de uma onda guiada que se propaga numa linha de transmissão, por exemplo, e uma onda que se propaga em um meio qualquer. As antenas também podem ser caracterizadas como elementos recíprocos, isto é, a sua atuação como receptor e emissor é idêntica, de modo que em uma determinada direção, a antena recebe a mesma potência que emite.

As antenas direcionais, foco do nosso presente trabalho, são largamente utilizadas em rádio-enlace, uma vez que estas possuem características de radiação fundamentais, como alta diretividade ou ganho, feixe de meia potência estreito e uma elevada relação de frente-costas. Essas características citadas possibilitam concentração de potência em uma dada região.

A antena yagi em sua forma mais conhecida é constituída de dipolos espaçados paralelamente sobre um eixo. Nesse tipo de antena um único elemento é excitado enquanto os outros elementos são caracterizados como parasitas. Os elementos na frente ao radiador são chamados de elementos diretores enquanto os na parte de trás são chamados de refletores. E apesar de sua forma mais basal, a antena yagi udade ter apenas um elemento refletor e um radiador, a antena da presente pesquisa é uma Yagi-Uda de N elementos.

### Projeto numérico usando RFWave

O primeiro passo no desenvolvimento do projeto foi a análise detalhada do gabarito esperado para a antena Yagi-Uda desenvolvida. Elucidado na Figura 01, a seguir:

<center>

![](https://i.imgur.com/g5OYt0d.png)

###### Figura 1 - Especificações de projeto

</center>

Portanto, observa-se que para uma frequência de 300 MHz e utilizando a equação que relaciona frequência, velocidade de propagação no meio livre e comprimento de onda, consegue-se determinar o comprimento de onda trabalhado ${\lambda}=1m$

Após a identificação das condições de funcionamento da Yagi-Uda, fez-se necessário, através da função RFWave, dimensionar a antena projetada de acordo com os padrões já estabelecidos. O resultado da função yagi, exportada do RFWAve especificamente para auxiliar no desenvolvimento do projeto apresenta as seguintes entradas e saídas:

Entradas:

- $d$ = espaçamento entre os elementos [m/m].
- $l_d$ = comprimento dos elementos (o segundo elemento sempre é o radiador) [m/m].
- $a$ = raio dos elementos [m/m].

Saídas:

- $u_e$ = intensidade de radiação (watss/esferoradianos) normalizada no plano do campo elétrico.
- $u_h$ = intensidade de radiação normalizada no plano do campo magnético.
- $g_a$ = ganho da antena [dBi].
- $Z_in$ = impedância de entrada da antena Zant (o segundo valor é a impedância do elemento radiador) [Ohms].
- fbr = relação frente-costas[dB].

O script realizado, via ad hocus, pode ser visualizado a seguir:

```matlab=1
clc;
close all;
addpath('./RFWave/');

d=[0.20,0.18,0.24,0.20];
ld=[0.50,0.42,0.40,0.38,0.41];
a=0.005;

[ue,uh,ga,zin,fbr] = yagi(d,ld,a);
radpat(ue,21);
figure; radpat(uh,22);

ga
fbr
gama=abs((zin(2)-50)/(zin(2)+50))
```

O retorno da função yagi observado abaixo, nos fornece um ganho, uma relação de frente-costas e um gama que respeitam o gabarito do projeto.

```python
ga = 9.0048
fbr = 22.748
gama = 0.5790
```

> Como podemos ver, as saídas do script estão atendendo os requisitos de projeto.

<div style="page-break-after: always; break-after: page;"></div>

### Resultados Obtidos

Dessa forma, o próximo passo definido pela equipe foi avaliar e comparar os aspectos construtivos obtidos no RFWave (teórico-numéricos), com a antena equivalente no 4nec2. Dessa forma, pode-se avaliar os seguintes aspectos:

#### Aspectos construtivos

Como evidenciado na seção anterior, a distância entre, comprimento e raio dos elementos que compõem a antena está explícito a seguir:

```matlab=1
d=[0.20,0.18,0.24,0.20];
ld=[0.50,0.42,0.40,0.38,0.41];
a=0.005;
```

Em posse dos respectivos aspectos construtivos obtidos através de uma simulação teórica numérica, exportou-se as informações para o 4nec2, fazendo as respectivas adaptações que o 4nec2 requer.

#### Parâmetros da antena

|                       4NEC2                       |
| :-----------------------------------------------: |
|       ![](https://i.imgur.com/O8P1fHt.png)        |
|       ![](https://i.imgur.com/Ug7cG9s.png)        |
| Figura 2 - Parâmetros construtivos e de simulação |

Além disso, como se pode visualizar acima, na figura 02, simulou-se o funcionamento da Yagi-Uda de 5 elementos na frequência de 300 Mhz, com o objetivo de identificar o seu respectivo padrão de radiação.

#### Geometria da antena

O resultado do protótipo do projeto em 3 dimensões pode ser visualizado na figura a seguir:

|                 4NEC2                 |                 Xnec2c                 |
| :-----------------------------------: | :------------------------------------: |
| ![](https://i.imgur.com/skjgwpw.png)  |  ![](https://i.imgur.com/o0Ftxlm.png)  |
| Figura 3a - Geometria da antena 4nec2 | Figura 3b - Geometria da antena Xnec2x |

<div style="page-break-after: always; break-after: page;"></div>

### Simulações

A seguir, realizamos algumas simulações.

#### Diagrama de irradiação

O diagrama de radiação obtido via 4nec2, como se visualiza a seguir, apresenta uma sutil diferença com a obtida via MATLAB/Octave. Entre as discrepâncias, de forma qualitativa (a quantitativa será feita em um outro momento da pesquisa), avalia-se uma nítida relação de frente costas menor.

|                 4NEC2                 |             MATLAB/Octave              |
| :-----------------------------------: | :------------------------------------: |
| ![](https://i.imgur.com/kjiOZf2.png)  |  ![](https://i.imgur.com/ZQl4HO4.png)  |
|                                       |  ![](https://i.imgur.com/s8UW2k4.png)  |
| Figura 4a - Simualção obtida no 4NEC2 | Figura 4b - Simualção obtida no RFWAVE |

#### Figuras 3D 4NEC2

Em outra perspectiva, pode-se visualizar a geometria da antena, bem como o projeto em 3D e seu respectivo padrão de radiação, de forma multi-color.

|              Geometric               |                   3D viewer                   |
| :----------------------------------: | :-------------------------------------------: |
| ![](https://i.imgur.com/T5VMjNy.png) |     ![](https://i.imgur.com/md7WZAX.png)      |
|  Figura 5a - Diagrama de irradiação  | Figura 5b - Diagrama de irradiação multicolor |

<div style="page-break-after: always; break-after: page;"></div>

#### Outra simulações 3D

Objetivando-se visualizar o mesmo padrão de radiação em 3D em outras perspectivas, simulou-se a antena via Xnec2c e 4NEC2, a comparação pode-se visualizada nas imagens dispostas abaixo:

|                              4NEC2                               |                              Xnec2c                              |
| :--------------------------------------------------------------: | :--------------------------------------------------------------: |
| <img src="https://i.imgur.com/md7WZAX.png" style="zoom: 40%;" /> | <img src="https://i.imgur.com/pRxJCzW.png" style="zoom: 67%;" /> |
| <img src="https://i.imgur.com/RWPosFy.png" style="zoom:40%;" />  |               ![](https://i.imgur.com/MiHep6A.png)               |
| <img src="https://i.imgur.com/LAH3UMW.png" style="zoom:40%;" />  |               ![](https://i.imgur.com/6oUfFaw.png)               |
|                                                                  |               ![](https://i.imgur.com/KBf3Z8T.png)               |
| Figura 6a - Simulações 3D em diferentes pontos de vista no 4nec2 | Figura 6b - Simulações 3D em diferentes pontos de vista no xnec2 |

#### Gráfico de Smith

Via 4NEC2 e Xnec2c, montou-se a carta de smith da antena, percorrendo frequências de 250MHz a 350MHz. Nota-se que, apesar de parecer fotografias diferentes, nos dois softwares, as curvas que formam o gráfico de smith são idênticos, mudando a perspectiva do eixo imaginário.

|                4NEC2                 |                Xnec2c                |
| :----------------------------------: | :----------------------------------: |
| ![](https://i.imgur.com/ayEGmrU.png) | ![](https://i.imgur.com/25Fn6FY.png) |
| Figura 7a - Carta de Smith no 4NEC2  | Figura 7b - Carta de Smith no XNEC2C |

#### Impedância

Outro parâmetro avaliado foi a impedância ao longo da frequência, na figura a seguir, avalia-se a parte real da impedância, bem como a sua respectiva magnitude. Nota-se uma grande equivalência dos resultados nos softwares diferentes.

|                4NEC2                 |                Xnec2c                |
| :----------------------------------: | :----------------------------------: |
| ![](https://i.imgur.com/2kSGiV4.png) | ![](https://i.imgur.com/VVhtFHg.png) |
|   Figura 8a - Impedância no 4NEC2    |   Figura 8b - Impedância no xnec2c   |

<div style="page-break-after: always; break-after: page;"></div>

#### Ganho e FBR

O ganho obtido para a Antena na frequência de 300MHz, bem como a variação do ganho ao percorrer frequências diferentes da respectiva de operação, pode ser visualizado na figura a seguir:

|                4NEC2                 |                Xnec2c                |
| :----------------------------------: | :----------------------------------: |
| ![](https://i.imgur.com/v1fS59Y.png) | ![](https://i.imgur.com/t7rMZX0.png) |
|   Figura 9a - Ganho e FBR no 4NEC2   |   Figura 9b - Ganho e FBR no xNEC2   |

#### VSWR

Outra grandeza importante que pode sr avaliada no projeto da antena é o S (razão ou coeficiente de onda estacionária), e indica a relação entre Vmáx e Vmin, ou, em outras palavras, permite avaliar uma medida do casamento de impedância entre a carga e a linha. Nota-se que: o S idela é 1 (coeficiente de reflexão é 0)

|                4NEC2                 |                Xnec2c                |
| :----------------------------------: | :----------------------------------: |
| ![](https://i.imgur.com/cA7nzLI.png) | ![](https://i.imgur.com/hEmq7U8.png) |
|      Figura 10a - VSWR no 4NEC2      |      Figura 10b - VSWR no 4NEC2      |

<div style="page-break-after: always; break-after: page;"></div>

### Simulações com plano de terra

Após as simulações iniciais, fez-se simulações análogas, considerando a atuação e influência do plano de terra sobre o projeto

#### Simulações 4NEC2:

|                         Pattern                          |                               3D                                |
| :------------------------------------------------------: | :-------------------------------------------------------------: |
|           ![](https://i.imgur.com/KpgHfI1.png)           |              ![](https://i.imgur.com/IE6rFXr.png)               |
| Figura 11a - Simulações usando o plano de terra no 4NEC2 | Figura 11b - Simulações usando o plano de terra na janela Build |

<div style="page-break-after: always; break-after: page;"></div>

#### Outra simulações 3D

|                               4NEC2                               |                               Xnec2c                               |
| :---------------------------------------------------------------: | :----------------------------------------------------------------: |
| <img src="https://i.imgur.com/md7WZAX.png" style="zoom: 40%;" />  |                ![](https://i.imgur.com/u3oiZNV.png)                |
|  <img src="https://i.imgur.com/KD7YKVh.png" style="zoom:35%;" />  |                ![](https://i.imgur.com/9fLC8O4.png)                |
|  <img src="https://i.imgur.com/rAXA12b.png" style="zoom:40%;" />  |                ![](https://i.imgur.com/PoQEoIi.png)                |
|                                                                   |                ![](https://i.imgur.com/kDuGFVi.png)                |
| Figura 12a - Simulações 3D em diferentes pontos de vista no 4nec2 | Figura 12b - Simulações 3D em diferentes pontos de vista no xnec2c |

### Conclusões

Através do projeto da antena Yagi Uda, pode-se compreender a importância e a capacidade técnica de softwares matemáticos para a correta concepção de antenas. Além disso, por meio da pesquisa técnica avaliada, conseguiu-se relacionar a teoria de eletromagnetismo aplicado com a concepção de dispositivos.

Por fim, mas não menos importante, avaliou-se parâmetros muito importantes, como ganho, relação de frente-costas, impedância e gama e a respectiva influência para o projeto.

<div style="page-break-after: always; break-after: page;"></div>

## 2. Rede de adaptação de impedâncias

### Introdução teórica simplifcada sobre casamento de impedâncias e stubs

Como avaliou-se na figura 10a do trabalho, o coeficiente de onda estacionária obtido para a antena sem rede de adaptação é igual a 3.5795 com um coeficiente de reflexão equivalente a -5 dB. Dessa forma, se faz necessário o uso de uma rede de adaptação de impedências para garantir a máxima transferência de potência. Nota-se que o valor ideal para o S é 1, onde o coeficiente de reflexão é 0.

$$
S=\frac{1+\Gamma}{1-\Gamma}
$$

O coeficiente de reflexão $\Gamma$, pode ser determinado por:

$$
\Gamma = \frac{Z_{L}-Z_0}{Z_{L}+Z_0}
$$

Para consertar esses parâmetros, preza-se pela utilização de uma rede de adaptação. Dessa forma, utiliza-se os valores de impedância obtidos na carta de smith da figura 7, exportados para o formato TouchStone e o software Advanced Design System (ADS) para obter a representação do circuito em modelo S.

O circuito montado para avaliar essas grandezas no ADS pode ser visualizado na figura a seguir:

<center>

![](https://i.imgur.com/CqkIqR3.png)

###### Figura 13 - Obtenção dos parâmetros do circuito.

</center>

Como citado anteriormente, o coeficiente de reflexão, representado a seguir por S(1,1), está igual a -4.986 dB na frequência de operação.

<center>

![](https://i.imgur.com/JCgvLS6.png)

###### Figura 14 - Coeficiente de reflexão S11 obtidos no ADS

![](https://i.imgur.com/D5YS4we.png)

###### Figura 15 - Carta de Smith obtida no ADS.

</center>

<div style="page-break-after: always; break-after: page;"></div>

Via simulação, também obteve-se uma lista de impedâncias de entrada, para uma gama de frequências, incluindo a de operação. O resultado, pode ser verificado na figura a seguir e na tabela extraída do Advanced Design System. Como já avaliado em uma etapa anterior, a impedância de entrada se encontra em um valor insatisfatório.

<center>

![](https://i.imgur.com/PPRUBXX.png)

###### Figura 16 - Impedância de entrada obtida no ADS

</center>

<div style="page-break-after: always; break-after: page;"></div>

### Projeto utilizando a Carta de Smith no ADS

Portanto, através do stub (toco), uma seção de linha de transmissão em circuito-aberto ou curto-circuito, posicionada em paralelo ou em série na linha de transmissão principal, permeia-se o casamento de impedâncias.

Entre os parâmetros importantes para esse processo, define-se a distância do stub para a carga, bem como o seu comprimento. Dessa forma, por meio da escolha adequada, consegue-se fazer com que a impedância vista seja igual a $Z_0$. Uma vez que a impedância vista é $Z_0$, cancela-se a reflexão.

Para realizar o casamento de impedâncias, definiu-se que a topologia escolhida era de um toco em paralelo. Ajustou-se, a priori, a distância de modo que a admitância vista olhando para a carga fosse igual $Y=Y_0+jB$, sendo $Y_0=\frac{1}{Z_0}$ onde $Z_0$ é a impedância característica da linha.

Observa-se contudo que com a escolha da distância, não se resolve o problema devido a presença da parte imaginária (susceptância), portanto, através do comprimento, escolhe-se um comprimento de modo que a susceptância seja igual a -$jB$ e portanto, a impedância vista seja igual a $Z_0$

Para realizar a ação descrita acima, fez-se necessário realizar alguns passos específicos no Advanced Design System (ADS). Configurou-se a frequência para 300 MHz, definiu-se no campo $Z_L$ o $gama_{antena}$ da antena na respectiva frequência e por fim, como visualizado na figura abaixo. Moveu-se o cursor na Carta de Smith, de maneira a fazer a admitância vista olhando para a carga seja igual a $Y=Y_0+jB$. Por fim, nesse mesmo passo, anotou-se o valor do comprimento elétrico (parâmetro utilizado para determinar d) no Network Schematic

<center>

<img src="https://i.imgur.com/XbHCV05.png" style="zoom:80%;" />

###### Figura 17 - Carta de Smith a uma distância d da antena

<img src="https://i.imgur.com/lzbYH7r.png" style="zoom:80%;" />

###### Figura 18 - Valores obtidos para distância do toco

</center>

Valor = $\theta = 18.566 ^\circ$

<div style="page-break-after: always; break-after: page;"></div>

Para converter o valor da distância em graus para valores físicos reais, utilizar as equações abaixo, além de se utilizar o valor da permissividade do meio que é conhecido:

$$
\theta=\beta l\tag{1}
$$

$$
\beta = \frac{2\pi f_0}{v_p}\tag{2}
$$

$$
v_p = \frac{2c}{3}\tag{3}
$$

O valor $\theta$ obtido foi de 18.566, o que, via cálculo, utilizando as equações acima, obtemos uma distância físcia de 1.9699m

O próximo passo foi realizar novas configurações no Advanced Design System e mover o cursor sobre a carta de smith, de modo que a impedância vista olhando para carga seja igual a $Z_0$, ou seja, casamento de impedâncias. Ademais, anotou-se o valor do comprimento elétrico dessa etapa, que será utilizado para determinar o tamanho de $l_s$ do toco.

<center>

<img src="https://i.imgur.com/YPaBdg2.png" style="zoom:80%;" />

###### Figura 19 - Carta de Smith a uma distância d da antena, com um toco de tamanho l

![](https://i.imgur.com/UFTIAOn.png)

###### Figura 20 - Valores obtidos para tamanho do toco

</center>

$\theta = 126.431^\circ$

Utilizando o mesmo procedimento realizado anteriormente com as equações $(1)\space(2)\space e \space(3)$, obtermos o valor real de $l$:

$$
13.4147m\tag{4}
$$

<div style="page-break-after: always; break-after: page;"></div>

### Simulação da rede de casamento com a antena

Após todos os procedimentos e cálculos efetuados, faz-se necessário avaliar de forma gráfica quais foram os impactos obtidos após o casamento de impedância. Na figura comparativa a seguir, visualiza-se que houve uma mudança significativa no coeficiente de reflexão, assumindo-se um valor de -46.626 na frequência de operação.

<center>

![](https://i.imgur.com/gDmNGTx.png)

###### Figura 21 - Comparativo entre os coeficientes de reflexão antes e depois do casamento

</center>

Além do coeficiente de reflexão, pode-se avaliar a impedância vista olhando para a carga. Como se visualiza a seguir, a impedância vista, pós casamento de impedância é aproximadamente $Z_0$.

<center>

![](https://i.imgur.com/mT3Gtke.png)

###### Figura 22 - Carta de Smith, entre os coeficientes de reflexão antes e depois do casamento

</center>

### Sensibilidade

#### Simulações em 300MHz

Buscou-se avaliar também, como escopo do trabalho, a influência do comprimento elétrico do cabo. O resultado é visto de formas distintas nas figuras a seguir:

<center>

![](https://i.imgur.com/ecnjOwk.png)

###### Figura 23 - Sensibilidade do comprimento do cabo à 300MHz

![](https://i.imgur.com/MqJ7xwj.png)

###### Figura 24 - Impedância de entrada em função do comprimento do cabo

![](https://i.imgur.com/0R9gDbj.png)

</center>

###### Figura 25 - Carta de Smith na frequência de 300MHz

#### Varreduras de comprimento elétrico

##### Stub

Buscando-se entender sobre as variações do comprimento elétrico do open stub, fez-se uma varredura via Parameter Sweep de ±10º em torno do valor encontrado no projeto com a carta de Smith. O resultado está deposto nas imagens abaixo:

<center>

![](https://i.imgur.com/rundy6V.png)

###### Figura 26 - Variação do coeficiente de reflexão para diferentes comprimentos elétricos de stub

![](https://i.imgur.com/EC7T8el.png)

###### Figura 27 - Variação do coeficiente de reflexão na Carta de Smith

![](https://i.imgur.com/XdKjh17.png)

###### Figura 28 - Variação do valores de impedância para diferentes valores de comprimento de stub

</center>

<div style="page-break-after: always; break-after: page;"></div>

##### Linha

Similar ao que foi feito na seção anterior, buscando-se entender sobre as variações do comprimento elétrico, só que dessa vez para o line lenght, fez-se uma varredura via Parameter Sweep de ±10º em torno do valor encontrado no projeto com a carta de Smith. O resultado está deposto nas imagens abaixo:

<center>

![](https://i.imgur.com/JlHC3zl.png)

###### Figura 29 - Variação do coeficiente de reflexão para diferentes comprimentos elétricos de linha

![](https://i.imgur.com/4VkGLFc.png)

###### Figura 30 - Variação do coeficiente de reflexão na Carta de Smith para diferentes comprimentos elétricos de linha

![](https://i.imgur.com/vORPTm3.png)

###### Figura 31 - Variação do valores de impedância para diferentes valores de comprimento da linha

</center>

### Conclusões

A partir da segunda etapa do primeiro trabalho, pode-se realizar e avaliar a importância do casamento de impedâncias para o satisfatório funcionamento de uma antena. Além disso, pode-se utilizar e compreender adequadamente sobre uma ferramenta extremamente poderosa capaz de resolver problemas complexos de linha de transmissão e casamento de impedância.

<div style="page-break-after: always; break-after: page;"></div>

## 3. Antena dipolo de microfita

### Introdução teórica simplifcada sobre a antena dipolo de microfita

As antenas de microfritas representam linhas de transmissão formada por um conjunto de elementos, dentre eles: condutor, substrato ou dielétrico e um plano de terra. Ideais para operarem em aplicações na banda ISM (2.4 GHz e 2.5 GHz) para Wi-Fi, Bluetooth, etc. Dentre suas principais características, cita-se perdas elevadas, baixa potência, baixo custo, compactas e leves.

Para os dipólos, fez-se as seguintes considerações descritas no relatório. Para o comprimento das dimensões $L$ do comprimento de cada braço e $W$ largura dos braços, fez-se a estimativa das dimensões a partir do cálculo da permissividade efetiva ($ε_e$) de uma microfita e de $λ$

$$
\epsilon_{e}=\frac{\epsilon_{r}+1}{2}+\frac{\epsilon_{r}-1}{2}\left(\frac{1}{\sqrt{1+12\left(H/W\right)}}\right)\tag{5}
$$

Onde $H$ é a espessura e $ε_r$ é a permissividade relativa do substrato, f é a frequência de operação e $c \approx 3\cdot10^8 m/s$.

### Projetos numéricos e layout da antena

- Frequência de ressonância: $f_0=2450 MHz$
- Coeficiente de reflexão (em $f_0$) $\Gamma_{ant (dB)}  < -10 dB$
- Espaçamento entre braços do dipolo $G = 0,9 mm$
- Largura dos braços do dipolo (L1) $3 mm ≤ W1 ≤ 7 mm$
- Comprimento da linha de alimentação L2 = W1
- Largura da linha de alimentação (W2) W2 = 0,5 mm
- Substrato FR4 (H = 1,6 mm, $\epsilon_r$ = 4,7, tan δ = 0,02,
  espessura do cobre = 35 μm)

Diante das especificações verificadas acima, definiu-se os principais parâmetros para a modelagem da antena:

$$
e_{e}=\frac{e_{r}+1}{2}+\frac{e_{r}-1}{2}\left(\frac{1}{\sqrt{1+12\left(\frac{H}{W}\right)}}\right)=3.75270756748\tag{6}
$$

$$
\lambda=\frac{3\cdot10^{8}}{2450\cdot10^{6}\cdot\sqrt{e_{e}}}=0.063209566058m\tag{7}
$$

$$
L=\frac{\lambda}{4}=0.0158023915145m\tag{8}
$$

Após a definição, começou-se a realizar o seu respectivo layout e as simulações:

As configurações iniciais via ADS nos forneceu as seguintes imagens que representam a estrutura da antena de microfita.

| Estutura da antena                            | Material e dimensões                                  |
| --------------------------------------------- | ----------------------------------------------------- |
| ![](https://i.imgur.com/VD7prej.png)          | ![](https://i.imgur.com/EvDycvx.png)                  |
| Figura 32a - Estrutura da antena de microfita | Figura 32b - Zoom da estrutura da antena de microfita |

Buscando-se realizar o desenho da antena, selecionou-se a camada (cond) e posteriormente, inseriu-se um pino/porta em cada braço do dipolo, no centro da linha de alimentação. O resultado pode-ser visualizado a seguir:

![](https://i.imgur.com/Fq5vz5c.png)

###### Figura 33 - Antena dipolo de microfita

<div style="page-break-after: always; break-after: page;"></div>

### Descrição das simulações e análise dos resultados

A antena final, obtida após uma série de simulações, apresenta um $L=17,500mm$ e $W_2= 6mm$. Posteriormente configurou-se a simulação eletromagnética para a antena, fazendo-se uma varredura de frequência (entre 1GHz e 4GHz) e simulando via parâmetros S.

| Magnitude (dB)                                                   | Legenda                              |
| ---------------------------------------------------------------- | ------------------------------------ |
| ![](https://i.imgur.com/1T2Oy3W.png)                             | ![](https://i.imgur.com/MgIoz2L.png) |
| Figura 34 - Varredura de frequência para coeficiente de reflexão |                                      |

Pode-se identificar o $S(1,1) = \Gamma$ em 2.450 MHz e a faixa de operação da antena, isto é, onde $S(1,1)< -10 dB)$ e a impedância da antena em 2.450MHz.

Utilizando os valores obtidos na figura 34, podemos calcular a largura de banda em relação a frequencia de operação:

$$
\Delta f = 100\cdot\frac{f_{max}-f_{min}}{f_0} = 12.24\%
\tag{9}
$$

Verifica-se abaixo também, a fase do coeficiente de reflexão da antena:

<center><img src="https://i.imgur.com/XPmHVwc.png" style="zoom:60%;" /></center>

###### Figura 35 - Fase do coeficiente de reflexão da antena

<div style="page-break-after: always; break-after: page;"></div>

Via carta de smith abaixo, pode-se visualizar ainda, a impedância da antena:

![](https://i.imgur.com/kyGcdYy.png)

###### Figura 36 - Carta de Smith da antena de microfita

Ademais, uma outa grandeza importante que merece destaque na criação das antenas é o diagrama de radiação da antena:

![](https://i.imgur.com/JKLvA2R.png)

###### Figura 37 - Diagrama de radiação da antena - Ganho

![](https://i.imgur.com/cREOs6k.png)

###### Figura 38 - Diagrama de radiação da antena - Campo magnético

Aliado ao diagrama de radiação, pode-se verificar outros parâmetros indispensáveis da antena como ganho, diretividade, potência radiada, frequência de operação, e potência:

![](https://i.imgur.com/2fOxot4.png)

###### Figura 39 - Informações gerais da antena

Assim, podemos obter também, os planos de corte da antena:
![](https://i.imgur.com/odJdu5g.png)

![](https://i.imgur.com/GIFacKr.png)

![](https://i.imgur.com/0vpUIJV.png)

###### Figura 40 - Planos de corte antena de microfita

### Conclusões

Através deste projeto, foi possível realizar, via software, uma antena dipolo de microfita, antena extremamente frequente nos circuitos dos diversos dispositivos de comunicação de hoje em dia que utilizam o Wi-Fi, Bluetooth, dentre outras. Portanto, entende-se que este tipo de habilidade é de suma importância para o projetista de circuito integrado.

<div style="page-break-after: always; break-after: page;"></div>

## 4. Modelo Indutor

### Introdução teórica simplifcada sobre modelos para o indutores e parâmetros S

Através de um modelo de um indutor discreto pode-se estudar e prever comportamentos de um componente, inclusive, as não idealidades inerentes ao componente, como as perdas no condutor e a capacitância distribuída entre espiras. Dessa forma, a partir presente pesquisa busca-se compreender o modelo de duas portas a parâmetros concentrados para um indutor discreto a partir de medições da matriz de espalhamento S.

Para avaliar o modelo realiza-se medições do indutor via dispositivo teste no Vector Network Analyzer (VNA) para gerar uma representação em quadripolo. Posteriormente, monta-se uma matriz S representativa do quadripolo e através dessa representação obtém-se uma representação de circuitos e valores de componentes. Ao final, monta-se o circuito equivalente aos parâmetros, com sua respectiva indutância, capacitância e resistência.

### Cálculos dos valores dos componentes do modelo.

Escolheu-se avaliar o modelo a parâmetros concentrados, ideal para análises em baixa frequência. O esquema do indutor escolhido pode ser visto na figura (41)

![](https://i.imgur.com/x3zcnuu.png)

###### Figura 41 - Modelo utilizado para modelagem do indutor.

Considerando-se $Z_{eq}$ como a impedância equivalente do modelo do indutor acima, pode-se determiná-la e verificar os parâmetros S associados a essa rede:

$$
Z_{eq}=\frac{\left(\frac{-j}{wC_{p}}\right)\left(j\cdot wL+R_{s}\right)}{\left(-\frac{j}{wC_{p}}\right)+\left(j\cdot wL+R_{s}\right)}\tag{10}
$$

$$
Z_{eq}=\frac{-j\left(j\cdot wL+R_{s}\right)}{-j+\left(j\cdot wL\right)\left(wC_{p}\right)+R_{s}\left(wC_{p}\right)}\tag{11}
$$

$$
Z_{eq}=\frac{wL-jR_{s}}{wR_{s}C_{p}+j\left(w^{2}LC_{p}-1\right)}\tag{12}
$$

Após a verificação da impedância equivalente. Determinou-se o coeficiente de reflexão de entrada com a saída casada ($S_{11}$) e o ganho de transmissão direta com a saída casada ($S_{21}$):

$$
S_{11}=\frac{Z}{Z+2Z_{0}}=\frac{wL-jR_{s}}{wL+2Z_{0}wR_{s}C_{p}+j\left(2Z_{0}w^{2}LC_{p}-2Z_{0}-R_{s}\right)}\tag{13}
$$

$$
S_{21}=\frac{2Z_{0}}{Z+2Z_{0}}=\frac{2Z_{0}wR_{s}C_{p}+j\left(2Z_{0}w^{2}LC_{p}-2Z_{0}\right)}{wL+2Z_{0}wR_{s}C_{p}+j\left(2Z_{0}w^{2}LC_{p}-2Z_{0}-R_{s}\right)}\tag{14}
$$

Além disso, com o objetivo de se determinar a frequência de ressonância, determinou-se a parte imaginária de $S_{21}$:

$$
Im\left\{S_{21}\right\}=\frac{2Z_{0}w\left(R_{s}^{2}C_{p}+w^{2}L^{2}C_{p}-L\right)}{\left(wL+2Z_{0}wR_{s}C_{p}\right)^{2}+\left(2Z_{0}w^{2}LC_{p}-2Z_{0}-R_{s}\right)^{2}}
$$

Sabendo que a frequência de ressonância é a frequência cuja parte imaginária de $S_{21}=0$. Fazendo $Im\left\{S_{21}\right\}=0$, podemos determinar a frequência de ressonância trivial desta equação se dá por:

$$
w_{0}=\sqrt{\frac{L-R_{s}^{2}C_{p}}{L^{2}C_{p}}}\tag{15}
$$

Analisa-se ainda que, no arquivo disponibilizado (medições do indutor), não há a frequência de ressonância, de modo que se fez necessário realizar uma interpolação objetivando-se encontrar a frequência de ressonância $w_0$ e resolver o sistema de equações. O circuito montado para extrair as medidas está evidenciado a seguir. Escolheu-se interpolar as medidas até 2300 MHz com um passo de 1MHz.
![](https://i.imgur.com/vRQDhex.png)

###### Figura 41 - Esquemático do circuito para o modelo do indutor fornecido pelo fabricante

Os pontos utilizados para se obter os valores de $S_{11}$,$S_{21}$ e $\omega_{0}$ estão representados nos marcadores dos gráficos da figura (42)
![](https://i.imgur.com/xDLr0qC.png)

###### Figura 42 - Gráficos de S11 e S21

Para cada marcador, temos:

- **m5**: $f_0 = 10MHz$, $S_{11} = 0.023 + j0.124$;
- **m1**: $f_0 = 100MHz$, $S_{21} = 0.341 - j0.474$;
- **m2**: $S_{21}=0 \rightarrow f_0 = \omega_0 =2.089GHz$.

Após a determinação dos parâmetros, utilizou-se o MATLAB e as equações verificadas para determinar os parâmetros (R L C) do componente. O código responsável por fornecer esses parâmetros está elucidado a seguir:

```c=1
clc
syms R L C
% Definicao dos pontos
S11 = 0.023377112 + i*0.134261902;
S21 = 0.341179116 - i*0.474487294;
w1 = 2*pi*10e6;
w2 = 2*pi*100e6;
f0 = 2.089e9;
w0 = 2*pi*f0;
Z0=50;

% Definicao das equacoes
Zeq1=((1/ (i*w1*C))*(i*w1*L+R)/((1/(i*w1*C)) + i*w1*L + R));
Zeq2=((1/(i*w2*C))*(i*w2*L+R)/((1/(i*w2*C)) + i*w2*L + R));

Eq1 = (L-R*R*C)/(L*L*c) == w0^2;
Eq2 = S11 == (Zeq1)/(Zeq1 + 2*Z0);
Eq3 = S21 == (2*Z0)/(2*Z0+Zeq2);

% Obtencao do resultado
resp = solve([Eq1,Eq2,Eq3],[R,L,C]);
Rsolve = double(resp.R)
Lsolve = double(resp.L)
Csolve = double(resp.C)
```

<div style="page-break-after: always; break-after: page;"></div>

Os valores obtidos pelo script foram:

```python
R = 0.5612
L = 2.2068e-7
C = 2.6302e-14
```

Com os valores R, L e C obtidos via MATLAB montou-se o seguinte circuito em que se busca comparar a medição inicial com o modelo obtido via parâmetros S:

![](https://i.imgur.com/FEpnyvK.png)

###### Figura 43 - Esquemático do modelo do indutor obtido

### Descrição das simulações solicitadas e seus resultados

Após a simulaão do circuito da figura 43 e o da figura 41, vê-se que para determinada faixa de frequência, as curvas $S_{11}$ e $S_{21}$ obtidas via medição do indutor e as curvas colhidas por meio dos parâmetros S são relativamente idênticas, o que nos permite inferir que a modelagem efetuada se aproxima da medição.
![](https://i.imgur.com/W690yuP.png)

###### Figura 43 - Esquemático do modelo do indutor obtido

Ademais, utilizando a equação que relaciona a impedância de entrada com a indutância e o cálculo do fator de qualidade Q, compara-se o modelo com o resultado obtido:

![](https://i.imgur.com/0z74NCS.png)

###### Figura 44 - Indutância e Fator de qualidade do modelo obtido.

Avalia-se claramente que a partir de uma determinada frequência os modelos apresentam discrepâncias significativas, o que já era esperado, uma vez que a modelagem escolhida é ideal para baixas frequências.

### Conclusões

Por meio da presente pesquisa pode-se realizar a modelagem de indutores através de um modelo a parâmetros concentrados, ideal para baixas frequẽncias. Conseguiu-se ainda, utilizar a medição do dispostivo, obter uma representação em circuitos, bem como o valor de seus componentes, adequando-se ao modelo de quadripolos.

Por fim, mas não menos importante, observou-se a precisão para com o método a partir da comparação entre o obtido por medição do dispositivo e a obtida via parâmetros S, além da determinação do indutor e o seu respectivo fator de qualidade.

<div style="page-break-after: always; break-after: page;"></div>

## Referências Bibliográficas

- Fundamentos de Telecomunicações: Teoria Eletromagnética e Aplicações; Antonio Cezar de Castro Lima.

- Antena Theory: Analysis and Design; Constantine A. Ballanis.

- Stutzman, Warren L., and Gary A. Thiele. antena theory and design.
