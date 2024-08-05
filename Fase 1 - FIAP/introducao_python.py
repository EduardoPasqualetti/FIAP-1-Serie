# peso = int(input("Peso da bagagem"))
# vip = input("É cliente vip ? S/N")

# if vip == 's':
#   if peso <= 32:
#     print("Cliente VIP com peso permitido")
#   else:
#     print('Cliente VIP com peso acima do permitido')
# elif vip == 'n':
#   if peso <= 28:
#     print("peso permitido")
#   else:
#     print('peso acima do permitido')
# else:
#     print("digite s ou n para dizer se é cliente vip ou nao")


#  /////

# print("Dia da semana")
# dia = int(input("Informe o numero de 1 a 7"))

# match dia:
#   case 1:
#     print("Domingo")
#   case 2:
#     print("Segunda")
#   case 3:
#     print("Terca")
#   case 4:
#     print("Quarta")
#   case 5:
#     print("Quinta")
#   case 6:
#     print("Sexta")
#   case 7:
#     print("Sabado")


#  /////

# valor_compra = input("Informe o valor da compra realizada ")
# cupom = input("Digite o cupom de desconto ")

# if cupom.nupper() == "NIVER10":
#   valor_final = float(valor_compra) * 0.9
# else:
#   valor_final = float(valor_compra)
#   print("cupom invalido")

# print(f"Valor final da compra é {valor_final}")


#  /////

import math
#solicitando os valores de A, B e C
a = float(input("Informe o valor de A"))
b = float(input("Informe o valor de B"))
c = float(input("Informe o valor de C"))
#cálculo do delta
delta = b * b - 4 * a *c
#verificação das condições com elif
if delta>0.0:
    #cálculo de 2 valores para x
    x1 = (-b + math.sqrt(delta)) / (2 * a)
    x2 = (-b - math.sqrt(delta)) / (2 * a)
    print(f"Para a equação {a}x² + {b}x + {c} = 0, obtivemos os seguintes valores: x1 = {x1} e x2 = {x2}")
elif delta == 0:
    #cálculo de 1 valor para x
    x = (-b + math.sqrt(delta)) / (2 * a)
    print(f"Para a equação {a}x² + {b}x + {c} = 0, obtivemos o seguinte valor: x = {x}")
else:
    #exibição da mensagem
    print(f"Para a equação {a}x² + {b}x + {c} = 0, não existem valores reais para x")