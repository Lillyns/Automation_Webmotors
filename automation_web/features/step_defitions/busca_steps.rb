Dado('que o usuario acesse a rota de {string}') do |rota|
  visit(DATA[rota])
end

Quando('o usuario selecionar a {string}') do |marca|
  @busca.seleciona_item(marca, EL['navbar'], item:EL['marca'])
end

Entao('deve retornar os carros com a marca {string}') do |marca|
  @busca.verifica_filtro_carros(texto: marca)
end

Entao('habilitar o botao para pesquisa de modelos') do
  assert_selector(EL['modelo'], text: "Todos os modelos", obscured: false)
  assert_selector(EL['versao'], text: "Todas as versões", obscured: true)
end

Quando('o usuario selecionar o modelo {string}') do |modelo|
  find(EL['modelo']).click
  @busca.seleciona_item(modelo, EL['navbar'], item: EL['itens_modelos'])
end

Entao('deve retornar o carros com a marca {string} e modelo {string} selecionados') do |marca, modelo|
  @busca.verifica_filtro_carros(texto: marca)
  @busca.verifica_filtro_carros(texto: modelo)
end

Entao('habilitar o botao para pesquisa de versoes') do
  @busca.focus_elm(EL['versao'])
  assert_selector(EL['versao'], text: "Todas as versões", obscured: false)
end

Quando('o usuario selecionar a versao {string}') do |versao|
  find(EL['versao']).click
  @busca.seleciona_item(versao, EL['navbar'], item:EL['itens_modelos'])
end

Entao('deve retornar o carros com a marca {string}, modelo {string} e versao {string} selecionados') do |marca, modelo, versao|
  @busca.verifica_filtro_carros(texto: marca)
  @busca.verifica_filtro_carros(texto: modelo)
  @busca.verifica_filtro_carros(texto: versao)
end