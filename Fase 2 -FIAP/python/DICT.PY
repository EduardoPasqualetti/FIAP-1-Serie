#criando um dicionário com dados
dicionario = {"X1":"BMW", "M2": "BMW", "A4":"Audi", "C250":"Mercedes", "Compass":"Jeep"}
#exibindo o valor associado a uma chave específica
print(dicionario["M2"])
#ou alternativamente
print(dicionario.get("Jeep"))


for chave, valor in dicionario.items():
    print(chave+"="+valor)
    
    
novo_carro = input("Informe o novo carro: ")
nova_marca = input("Informe a marca do carro")

dicionario[novo_carro] = nova_marca


dicionario.update({"C250": "Mercedes-Benz"})
print(dicionario)