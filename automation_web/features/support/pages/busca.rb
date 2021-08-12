class Busca
    include Capybara::DSL

    def seleciona_item(btn,elm,item:)
        @btn =  btn
        elemento = ERB.new(item).result(binding)
        focus_elm(elm)
        first(elemento).click
    end

    def focus_elm(elm)
        find(EL['navbar']).hover
        find(elm).hover
    end

    def verifica_filtros(*filtro,elm:)
        filtro.each do |f|
            assert_selector(elm, text: f, count: all(elm).length)
        end
    end

    def verifica_filtro_carros(elemento: nil, texto:)
        elemento = elemento.nil? ? EL['lista_carros'] : EL[elemento]
        assert_selector(elemento, text: texto, count: all(elemento).length)
    end
end