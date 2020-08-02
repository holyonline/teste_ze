<h1>Arquitetura do projeto</h1>

Configurando sua máquina
-------------------------
Necessário instalar:
-----------------------

*	Robot Framework: O Robot Framework é um framework genérico de automação de código aberto. Pode ser usado para automação de teste (Web, Mobile e API), e automação de processo robótico (RPA).
*	Python 3: linguagem de programação utilizada nos testes.
*   JDK: O Java Development Kit (JDK) é um dos três principais pacotes de tecnologia usados na programação Java, juntamente com a JVM (Java Virtual Machine) e o JRE (Java Runtime Environment).
*   Appium: O Appium é uma ferramenta de código-fonte aberto para automatizar aplicativos nativos, da Web para dispositivos móveis e híbridos em plataformas móveis iOS, Android e Windows.
*	Cmder for Windows: Sistema que trás as funcionalidades bash (Terminal) para o Windows.


Configurando o ambiente de automação de testes
------------------------------------------------------------

Para que sua automação possa ser realizada é necessário instalar alguns recursos, conforme será descrito abaixo:

Windows
--------

<h3>1. Instalando o Console do Cmder</h3>

*	Baixe em: <https://github.com/cmderdev/cmder/releases/download/v1.3.14/cmder.zip> .
*	Descompactar na pasta C:\Cmder.
*	Selecione o cmder.exe e arrastar até sua barra de ferramentas do Windows para criar um atalho.
*	Executar o cmder.exe.

<h3>2. Instalando o Python 3</h3>

*	Baixe em: <https://www.python.org/downloads/>.
*	Executar o arquivo baixado e seguir as instruções clicando em ‘next’.
* 	Selecionar os 3 checkbox exibidos e continuar a dar ‘next’ até o ‘finish’.
*	No Console do Cmder, digite o comando python --version , se a instalação estiver correta aparecerá a versão instalada.

<h3>3. Instalando o JDK</h3>

*	Baixe em: <https://www.oracle.com/br/java/technologies/javase/javase-jdk8-downloads.html>.
*	Executar o arquivo baixado e seguir as instruções clicando em ‘next’.
*	No Console do Cmder, digite o comando java - version, se a instalação estiver correta aparecerá a versão instalada.

<h3>4. Instalando o Robot Framework</h3>

*	Após a instalação do Python, dentro do Cmder digite: pip install robotframework.
*	No Console do Cmder, digite o comando robot --version, se a instalação estiver correta aparecerá a versão instalada.

<h3>5. Instalando o Appium</h3>

*	Baixe o Node JS em: <https://nodejs.org/en/download/>.
*	Após a instalação do Node JS, dentro do Cmder digite: npm install appium -g.
*	No Console do Cmder, digite o comando java - version, se a instalação estiver correta aparecerá a versão instalada.


E pronto, ambiente configurado.


Automação de Testes
--------------------

Para a automação de testes, utilizaremos o Robot Framework.

<h3>Aprendendo a usar a pasta resources</h3>

*	A pasta resources contém os métodos usados e caminhos seguidos com base em cada keyword utilizada.
*	O arquivo base.robot é onde a maioria das configurações são mantidas. O arquivo general_data.robot contém as variáveis que diversas chamadas utilizam.

<h3>Utilizando Tags</h3>

Utilizamos a tag para diferenciar os cenários por grupos, funcionalidades ou etapas de testes. As tags são inseridas na linha abaixo do nome da keyword.
No terminal, quando quisermos rodar os cenários que estão nomeados com tags, basta utilizarmos o seguinte comando:

````bash
robot -d -i tag
````

Esse comando rodará todos os cenários que tiverem a tag.

Executando os testes automatizados
-----------------------------------

Para executar o testes automatizados usaremos alguns comandos a partir da pasta raiz do nosso projeto.

*	Para execução de todos os cenários implementados com o navegador chrome padrão utilizamos o seguinte código:
````bash
robot -d
````

Todos os testes são executados.


*	Para execução de todos os cenários e gerar um report com screenshots, utilizamos o seguinte código:
````bash
robot -d ./logs tests\
````

Na pasta ./logs do projeto é gerado um arquivo HTML com o report dos cenários de testes.

Basta abrir no seu navegador e visualizar o resultado.

Considerações
-----------------------------------

Todos os testes foram considerados apenas cenários positivos, e também o teste para Entrar com o Facebook não foi efetuado. Foi detectado um bug no step de confirmação de endereço caso o teste clique muito rápido em VER PRODUTOS DISPONÍVEIS, após a digitação do endereço.

A montagem de keywords foi desenvolvida a partir do BDD. Por se tratar do app de produção, o último botão de confirmação de compra foi comentado. 

Foram criados dois e-mails fakes para utilização dos testes, tanto o teste da signup como o de login. Eles podem ser alterados dentro do arquivo ./resources/general_data.robot .

Obrigado pelo teste, estou à disposição para quaisquer esclarecimentos.
