#language: pt

            @busca
            Funcionalidade: Busca de Marca, Modelo e Versão

            Contexto:
            Dado que o usuario acesse a rota de 'rota_estoque'

            Cenario: Pesquisar a Marca do Carro
            Quando o usuario selecionar a "honda"
            Entao deve retornar os carros com a marca "HONDA"
            E habilitar o botao para pesquisa de modelos 

            Cenario: Pesquisar o Modelo do Carro
            Dado que a marca do carro esteja selecionada
            Quando o usuario selecionar o modelo "city"
            Entao deve retornar o carros com a marca "HONDA" e modelo "CITY" selecionados
            E habilitar o botao para pesquisa de versoes

            Cenario: Pesquisar a Versao do Carro
            Dado que a marca e modelo do carro estejam selecionados
            Quando o usuario selecionar a versao "15-lx-16v-flex-4p-manual"
            Entao deve retornar o carros com a marca "HONDA", modelo "CITY" e versao "1.5 LX 16V FLEX 4P MANUAL" selecionados