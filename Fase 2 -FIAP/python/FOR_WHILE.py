# -*- coding: utf-8 -*-
"""for_while.ipynb

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/1pedvi4M82_9M6WtS9b1P1Tzid3clPWod
"""

# resposta = 0

# while(resposta != 10):
#   resposta = int(input("Informe o numero"))
#   if(resposta != 10):
#     print("Errou, tente denovo")
# print("parabens, acertou")


# //////

# i = 10

# while(i >= 0):
#   print("O numero é", i)

#   i = i - 1


# //////

# for i in range(0,12,3):
#   print(i)


# //////

# num = 0

# while(num != 4):
#   print("1 - Rodar Codigo 1:")
#   print("2 - Rodar Codigo 2:")
#   print("3 - Rodar Codigo 3:")
#   print("4 - Sair do programa")
#   num = int(input("Informe o numero que vc quer:"))

#   if num == 1:
#     print("Rodando codigo numero 1...")
#   elif num == 2:
#     print("Rodando codigo numero 2...")
#   elif num == 3:
#     print("Rodando codigo numero 3...")
#   elif num > 4 or num < 1:
#     print("Numero invalido")

# print("Ok, programa encerrando")


# /////

peso_total = 0.0

for x in range(1, 5):
  peso_atual = float(input(f"Informe a peso da caixa {x}:"))

  peso_total = peso_total + peso_atual


media = peso_total/4

print(f"O peso total das caixas é {peso_total}, e a media é {media}")