![Logo](https://github.com/AdrianoJunior/Dentista/blob/master/assets/logo/readme_logo.png?raw=true)


# Dentista

O prejeto do app Dentista consiste em uma lista de produtos relevantes para dentistas, onde é possível selecionar e consultar os dados do produto cadastrados dentro de um arquivo json no aplicativo.
Também é possível buscar por um item especifico dentro da lista ou até mesmo fazer buscas mais genéricas por informações contidas no nome, preço, descrição ou categoria dos produtos.
Além disto, o app conta com uma página que contem uma lista de categorias, onde é possível selecionar a categoria desejada e visualizar os produtos desta categoria específica.
## Referência

Este é um desafio da [Corelab](https://www.corelab.com.br/pt/).

As tecnologias utilizadas no desenvolvimento do app foram:

- [Dart](https://dart.dev/): Dart é uma linguagem de programação desenvolvida pela Google, projetada para criar aplicativos web, mobile e desktop de forma eficiente e escalável. Com sua sintaxe simples e concisa, o Dart oferece recursos como tipagem estática, coleta de lixo automatizada e suporte a programação orientada a objetos, tornando-se uma escolha popular para o desenvolvimento de aplicativos Flutter.

- [Flutter](https://flutter.dev/): Flutter é um framework de desenvolvimento de aplicativos móveis criado pela Google que permite criar interfaces de usuário nativas para iOS e Android usando uma única base de código. Ele oferece alta performance, rapidez de desenvolvimento e uma ampla gama de widgets personalizáveis.


## Documentação

### Processo de desenvolvimento

Para desenvolver este aplicativo, separei algumas etapas a serem desenvolvidas:

- Definição do gerenciamento de estado (MobX) e do uso do padrão Modular para facilitar a leitura, entendimento e separação do código caso necessário.
- Desenvolvimento do layout da tela inicial (PageView + Tabs), utilizando uma BottomNavigationBar.
- Criação do arquivo com a lista de produtos (utilizando json salvo localmente na pasta assets/json).
- Desenvolvimento da tela de listagem dos produtos.
- Desenvolvimento da funcionalidade de pesquisa.
- Atualização dos layouts e funcionalidade de pesquisa para ser mais coerente com o projeto e o protótipo do figma.
- Desenvolvimento da tela de detalhes do produto.
- Criação do arquivo com as categorias (utilizando json salvo localmente na pasta assets/json).
- Desenvolvimento da tela de categorias.
- Atualização do código da tela de listagem de produtos para ser possível verificar uma categoria específica.
- Revisão do código e comentários adicionais onde necessário.
- Upload para o GitHub.
- Atualização do README.md e commit final.
## Funcionalidades

- Página Inicial com navegação por tabs.
- Listagem de produtos com busca e seleção.
- Armazenamento na memória interna dos termos buscados.
- Página de detalhes do produto selecionado.
- Página com listagem e seleção de categorias.
- Filtragem dos produtos por categoria selecionada.
- Multiplataforma.


## Instalação
Para instalar e utilizar o projeto em seu computador, siga os seguintes passos:

### Instalação do Flutter

Para configurar o Flutter em seu computador, siga estes passos:

- Faça o download e a instalação do Flutter SDK no site oficial do [Flutter](https://flutter.dev/), de acordo com o seu sistema operacional.
- Extraia o arquivo baixado e adicione o diretório bin do Flutter ao seu PATH de sistema.
- Abra um terminal ou prompt de comando e execute o comando flutter doctor para verificar se há alguma dependência faltando ou configuração adicional necessária.
- Caso haja alguma dependência faltando, siga as instruções fornecidas pelo flutter doctor para instalá-las corretamente.
- Após a instalação das dependências, execute novamente o comando flutter doctor para verificar se tudo está configurado corretamente.
- Configure um editor de código compatível com o Flutter, como o [Visual Studio Code](https://code.visualstudio.com/), instalando as extensões recomendadas para desenvolvimento Flutter.
- Certifique-se de consultar a documentação oficial do Flutter para obter instruções mais detalhadas e atualizadas de acordo com seu sistema operacional.

### Execução do projeto

Para executar o projeto basta clonar o repositório para uma pasta do seu computador e abrir o projeto em uma IDE compátivel, devidamente configurada seguindo o passo-a-passo acima ou a documentação oficial do flutter.

Ao abrir o projeto pela primeira vez, no terminal acesse o diretório raiz do projeto e utilize o comando:

```
flutter pub get
```

Caso sejam apresentados erros, verifique se as configurações do Flutter no sistema estão corretas e se as versões são compatíveis.
OBS: O projeto foi desenvolvido em um ambiente com as seguintes configurações do Flutter:

- Flutter version 3.10.5
- Dart version 3.0.5
- DevTools version 2.23.1

Após executar o comando "flutter pub get" para obter as dependências do seu projeto Flutter, siga os seguintes passos para executar o aplicativo:

- Certifique-se de ter um dispositivo virtual ou físico configurado e conectado ao seu computador. Você pode verificar os dispositivos disponíveis usando o comando ```flutter devices``` no terminal.

- No terminal, navegue até a pasta raiz do seu projeto Flutter usando o comando ```cd caminho/do/seu/projeto```.

- Execute o comando ```flutter run``` para iniciar o aplicativo no dispositivo selecionado. Se houver mais de um dispositivo conectado, você precisará especificar o dispositivo de destino com a flag "-d" seguida pelo ID do dispositivo. Por exemplo, ```flutter run -d deviceID```.

- Aguarde alguns instantes enquanto o Flutter compila o aplicativo e o instala no dispositivo.

- O aplicativo será iniciado automaticamente no dispositivo selecionado, e você poderá ver as saídas do aplicativo no terminal.

- Para fazer alterações no código e visualizar as atualizações em tempo real, salve os arquivos modificados e o Flutter Hot Reload será acionado automaticamente, refletindo as alterações no aplicativo em execução.

- Lembre-se de que essas são apenas etapas básicas e podem variar dependendo da configuração do seu projeto ou ambiente de desenvolvimento. Consulte a documentação oficial do Flutter para obter mais detalhes e opções avançadas de execução e depuração de aplicativos Flutter.
## Stack utilizada

**Mobile:** Flutter
## Autor

- [@AdrianoJunior](https://www.github.com/AdrianoJunior)

