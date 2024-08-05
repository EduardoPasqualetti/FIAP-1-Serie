# def CalcularMediaKm(dist, temp):
    
#     velocidade_media = dist/temp
#     return f'velocidade maxima é {velocidade_media}'   
    
# distancia = float(input("Informe a distancia da viagem: "))
# tempo = float(input("Informe o tempo levado na viagem: "))

# print(CalcularMediaKm(distancia,tempo))


# ///////////
# o * significa q podem ter varios desse parametro
def fSaudacao(pPeriodo, *pNome):
 for i in pNome:
    if pPeriodo.lower() in ('manha', 'm'):
      print(f'Bom dia, {i}! Como vai?')
    elif pPeriodo.lower() in ('tarde', 't'):
      print(f'Boa tarde, {i}! Como vai?')
    else:
      print(f'Boa noite, {i}! Como vai?')

fSaudacao('t', 'João', 'Maria', 'Pedrinho')