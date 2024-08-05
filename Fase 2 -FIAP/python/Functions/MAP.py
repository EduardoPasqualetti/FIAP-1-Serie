
numbers = [1,2,3,4]

# Expressao lambida
dobro = lambda x: x * 2

print(list(map(dobro, numbers)))




verificar_atmosfera = lambda planeta: "Ufa, pode respirar a vontade" if planeta != "Hoth" else "Cuidado! Não ouse retirar a vestimenta"
print(list(map(verificar_atmosfera, ["Tatooine", "Hoth", "Endor", "Alderaan", "Naboo"])))