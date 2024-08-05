import csv

print("\n")
print("\033[92mBem vindo ao nosso sistema!!\033[0m")
print("\n")
class Produto:
    def __init__(self, nome, preco, descricao, embalagem):
        self.nome = nome
        self.preco = preco
        self.descricao = descricao
        self.embalagem = embalagem

listaProdutos = []
resposta = ''

while resposta.lower() != 'sim' and resposta.lower() != 'nao':
 resposta = input("Deseja cadastrar um produto? (sim)/(nao)")

while resposta.lower() == "sim":
        try:
            nome = input("Informe o produto: ")
            preco = float(input("Informe o Preço do produto: "))
            if preco < 0:
                raise ValueError()
                print("\n")

            descricao = input("Informe a descricao do produto: ")
            embalagem = input("Informe o tipo de embalagem: ")

            novo_produto = Produto(nome, preco, descricao, embalagem)
            listaProdutos.append(novo_produto)

            while True:  
                resposta = input("Deseja cadastrar outro produto? (sim)/(nao) ")
                if resposta.lower() == "sim" or resposta.lower() == "nao":
                    break  

                print("\033[91mResposta inválida, digite (sim) ou (nao)\033[0m")
                print("\n")

            if len(listaProdutos) < 5 and resposta.lower() != "sim":
                print("\n")
                print("\033[91mÉ necessário cadastrar no mínimo 5 produtos\033[0m")
                resposta = "sim"

        except ValueError:
            print("\033[91mErro: voce deve digitar um valor valido\033[0m")
            print("\n")

print("\033[93mFinalizando... Obrigado por utilizar nosso sistema!\033[0m")

if len(listaProdutos) >= 5:
    with open('1_5_arquivo_produto.csv', 'a') as arquivo_csv:

        escritor_csv = csv.writer(arquivo_csv)

        escritor_csv.writerow(['Produto', 'Preço', 'Descrição', 'Embalagem'])

        for produto in listaProdutos:
            
            linha = [produto.nome, produto.preco, produto.descricao, produto.embalagem]
            
            escritor_csv.writerow(linha)
            
    print("\n")
    print("\033[92mArquivo CSV criado com sucesso.!\033[0m")

