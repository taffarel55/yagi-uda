# 1. Antena Yagi-Uda

**Autores**: [Breno Amin](https://github.com/brenoamin/) e [Maurício Taffarel](https://github.com/taffarel55/)

**Data**: 21/09/2021

[TOC]

<div style="page-break-after: always; break-after: page;"></div>

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

> Este gráfico foi exportado no formato TouchStone/S-Parameter para ser lido pelo software ADS. O arquivo pode ser encontrado [aqui](Smith.txt)

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

# 2. Rede de adaptação de impedâncias

### Introdução teórica simplifcada sobre casamento de impedâncias e stubs

> Os arquivos para o casamento no software ADS se encontram aqui: [casamentoImpedancia.zip](casamentoImpedancia.zip)

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

## Referências Bibliográficas

- Fundamentos de Telecomunicações: Teoria Eletromagnética e Aplicações; Antonio Cezar de Castro Lima.

- Antena Theory: Analysis and Design; Constantine A. Ballanis.

- Stutzman, Warren L., and Gary A. Thiele. antena theory and design.
