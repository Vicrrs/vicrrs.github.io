---
title: Da lousa à Visão Computacional
date: 2026-08-21 00:00:00
categories:
  - Carreira / Estudos
tags:
  - Trajetória
  - Visão Computacional
  - SIBGRAPI
---

Antes de treinar redes neurais, eu treinava alunos para o vestibular.

Comecei minha trajetória profissional dando aulas particulares de Física e Matemática em domicílio, em Manaus, enquanto cursava Licenciatura em Física na Universidade Federal do Amazonas. Não foi um desvio de percurso — foi a base de tudo o que vim a fazer depois. Explicar cinemática ou funções trigonométricas para um aluno de 16 anos, na mesa da cozinha da casa dele, me obrigou a desenvolver uma habilidade que uso todos os dias como engenheiro de ML: pegar algo complexo e torná-lo simples sem perder o essencial.

## Da física teórica ao código

Em paralelo às aulas, entrei na pesquisa científica em transporte quântico eletrônico. Era um trabalho de simulação, modelagem matemática e muito código para resolver numericamente o que não dava para resolver no papel. Foi ali que percebi que o que mais me atraía não era a Física em si, mas o processo de transformar um fenômeno do mundo real em um modelo computacional capaz de prever comportamento. Isso é, essencialmente, o que Machine Learning faz — só que em vez de elétrons, os dados são imagens, texto ou séries temporais.

Essa migração não foi abrupta. Aconteceu por sobreposição: enquanto ainda lecionava e pesquisava, comecei a estudar Visão Computacional por conta própria, e logo depois entrei no CEIA e no LAMIA, onde trabalhei com detecção, classificação e rastreamento de objetos, reconhecimento facial e processamento de vídeo em tempo real. Foi meu primeiro contato sério com o tipo de problema que hoje define minha carreira: como fazer uma máquina enxergar o mundo com robustez suficiente para funcionar fora do notebook de pesquisa.

## O paper que me levou a Salvador

Um dos frutos diretos desse período foi um artigo que submeti e tive aceito no **SIBGRAPI 2025**, o principal congresso brasileiro de Computação Gráfica, Processamento de Imagens e Visão Computacional: *"Automated Synthetic Data for Computer Vision: Blender-COCO Pipeline Enhancing YOLOv8"*, em coautoria com pesquisadores da UFAM, UTFPR e UFG, sob o guarda-chuva do CEIA e do AKCIT.

O trabalho propõe um pipeline totalmente automatizado para gerar dados sintéticos de treinamento com anotações no formato COCO, sem depender de rotulagem manual — que hoje consome de 60% a 80% do esforço em projetos de IA. A ideia, resumida: gravamos um objeto real com um smartphone em um gimbal, reconstruímos a geometria em 3D usando o algoritmo SVRaster, limpamos a malha em Blender via script Python headless, e então um add-on que desenvolvemos (o YOLO FOTO) posiciona câmeras virtuais, varia iluminação e fundos HDRI automaticamente e exporta milhares de imagens já anotadas. Com apenas 942 imagens sintéticas geradas desse jeito, treinamos um YOLOv8n do zero e validamos em fotos e vídeos reais — o mAP@0.5 saltou de 82% para 99.5%, e o mAP@[0.5:0.95] foi de 55% para 97.7%, sem nenhum falso positivo nos testes com câmeras ao vivo.

Ter esse trabalho aceito significou mais do que uma linha a mais no currículo: foi o motivo da minha primeira viagem de avião, para apresentar o paper em Salvador. Saí de Manaus sem nunca ter voado antes e voltei com a sensação clara de que os anos de aulas particulares, pesquisa em Física e noites estudando Visão Computacional por conta própria finalmente tinham se encontrado em um ponto concreto.

## O que fica

Hoje trabalho com sistemas de recomendação, ranking e engenharia de ML em produção, mas carrego comigo o que aprendi dando aula de Física numa mesa de cozinha: todo problema complicado tem uma explicação simples esperando para ser encontrada — o trabalho é ter paciência para chegar até ela.
