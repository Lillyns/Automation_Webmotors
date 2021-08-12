# Automação Front
---
## Depêndencias
- [Ruby](https://www.ruby-lang.org/pt/downloads/)
- Bundler
```
gem install bundler
```
---
## Instalação

Após baixar e instalar todas as depêndencias, basta executar o seguinte comando:
```
bundle install
```
E em seguida todas as depêndencias do projeto serão baixadas.

---
## Execução dos Testes
Para execução dos testes, basta executar:
```
cucumber
```
Ao final da execução do mesmo, um link para o relatório será exibido no terminal.

---
## Execução dos Testes em modo headless
Para execução dos testes, basta executar:
```
cucumber -p headless
```
Ao final da execução do mesmo, um link para o relatório será exibido no terminal.

# Automação Api
---
## Depêndencias
- [Newman](https://www.npmjs.com/package/newman)
- [Htmlextra](https://www.npmjs.com/package/newman-reporter-htmlextra)

## Instalação

Para instalar o newman
```
sudo npm install -g newman
```
Para instalar o Htmlextra
```
sudo npm install -g newman-reporter-htmlextra
```
---
## Execução dos Testes
Para execução dos testes, basta executar:
```
newman run Webmotors.postman_collection.json \
                                    -r htmlextra 
```
Ao final da execução do mesmo, uma pasta será gerada com report.