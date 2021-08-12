
Dado('que a marca do carro esteja selecionada') do
    steps %{
      Quando o usuario selecionar a "honda"
    }
end

Dado('que a marca e modelo do carro estejam selecionados') do
    steps %{
      Quando o usuario selecionar a "honda"
      Quando o usuario selecionar o modelo "city"
    }
end