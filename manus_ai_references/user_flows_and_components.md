## Detalhamento de Fluxos de Usuário e Componentes Visuais (Foco em Flutter)

Este documento detalha os fluxos de usuário e os componentes visuais para as telas prioritárias do aplicativo de catalogação, com considerações para implementação em Flutter. O objetivo é fornecer um guia prático para o desenvolvimento.

### Fluxos de Usuário Prioritários e Componentes

#### 1. Acesso via Gmail (Login/Cadastro)

*   **Fluxo (Mobile e Web - Similar, adaptando para convenções de cada plataforma):**
    1.  **Tela Inicial/Login:** Usuário visualiza a opção "Entrar com Gmail".
        *   **Componente (Flutter):** `ElevatedButton` ou `TextButton` com o logo do Gmail e texto "Entrar com Gmail".
    2.  **Interação:** Usuário clica no botão "Entrar com Gmail".
    3.  **Ação do Sistema:**
        *   Inicia o fluxo de autenticação OAuth2 do Google.
        *   (Mobile) Pode abrir um `WebView` ou usar um plugin Flutter específico para login social (ex: `google_sign_in`).
        *   (Web) Redireciona para a página de login do Google ou abre um pop-up.
    4.  **Autenticação Google:** Usuário insere credenciais do Gmail e autoriza o aplicativo.
    5.  **Retorno ao App:**
        *   **Sucesso:** Usuário é redirecionado para a tela principal do app (Home). Se for o primeiro acesso, o perfil básico é criado automaticamente com informações do Gmail (nome, e-mail, foto de perfil, se disponível).
        *   **Falha:** Exibe mensagem de erro apropriada (ex: `SnackBar` ou `AlertDialog` em Flutter) com opção de tentar novamente.
*   **Componentes Visuais Chave:**
    *   **Botão "Entrar com Gmail":** Ícone do Gmail, texto claro. Estilo consistente com a identidade visual do app.
    *   **Indicadores de Carregamento:** `CircularProgressIndicator` durante a autenticação.
    *   **Mensagens de Feedback:** `SnackBar` ou `AlertDialog` para sucesso/erro.

#### 2. Edição de Perfil

*   **Fluxo (Mobile e Web):**
    1.  **Acesso:** Usuário navega para a Tela de Perfil (via barra de abas no mobile ou menu no web) e clica no botão "Editar Perfil".
    2.  **Tela de Edição de Perfil:** Apresenta campos para editar informações.
        *   **Campos:**
            *   Foto de Perfil (Avatar): Opção de carregar nova imagem.
                *   **Componente (Flutter):** `CircleAvatar` para exibir, `GestureDetector` para ação de mudar, plugin `image_picker` para selecionar imagem.
            *   Nome de Usuário (não editável ou com restrições).
            *   Nome (para exibição).
                *   **Componente (Flutter):** `TextFormField` com `InputDecoration`.
            *   Biografia (campo de texto multilinhas).
                *   **Componente (Flutter):** `TextFormField` com `maxLines` > 1.
            *   Links para redes sociais (opcional).
        *   **Ações:**
            *   Botão "Salvar Alterações".
                *   **Componente (Flutter):** `ElevatedButton`.
            *   Botão "Cancelar".
                *   **Componente (Flutter):** `TextButton` ou `OutlinedButton`.
    3.  **Interação:** Usuário modifica os campos desejados e clica em "Salvar Alterações".
    4.  **Ação do Sistema:**
        *   Valida os dados inseridos.
        *   Envia as atualizações para o backend.
        *   **Sucesso:** Exibe mensagem de confirmação (`SnackBar`) e retorna para a Tela de Perfil com as informações atualizadas.
        *   **Falha:** Exibe mensagem de erro (`SnackBar` ou `AlertDialog`) indicando o problema (ex: nome de usuário já existe, formato de e-mail inválido).
*   **Componentes Visuais Chave:**
    *   **Formulário:** `Form` widget em Flutter para agrupar `TextFormField`s e gerenciar validação e estado.
    *   **Campos de Texto:** `TextFormField` com labels, hints e validação.
    *   **Seletores de Imagem:** Interface para escolher imagem da galeria ou câmera.
    *   **Botões de Ação:** Claros e com feedback visual ao toque/clique.

#### 3. Pesquisar pela Obra (Filme, Série, Anime)

*   **Fluxo (Mobile e Web):**
    1.  **Acesso:** Usuário clica no ícone/campo de Busca na navegação principal.
    2.  **Tela de Busca:**
        *   Campo de texto para inserir o termo de pesquisa.
            *   **Componente (Flutter):** `TextField` ou `TextFormField` com `InputDecoration` (hint text, ícone de busca).
        *   (Opcional) Filtros rápidos visíveis (Ex: botões para "Filmes", "Séries", "Animes").
            *   **Componente (Flutter):** `ToggleButtons` ou `ChoiceChip`s.
    3.  **Interação (Ao Digitar - Debounced):**
        *   Sistema envia a query para o backend (com debounce para evitar requisições excessivas).
        *   Exibe resultados parciais/sugestões em tempo real abaixo do campo de busca.
            *   **Componente (Flutter):** `ListView` de `ListTile`s (Pôster miniatura, Título, Ano, Tipo).
    4.  **Interação (Submeter Busca):** Usuário pressiona "Enter" ou botão de busca.
    5.  **Tela de Resultados da Busca:**
        *   Exibe lista completa de resultados correspondentes ao termo e filtros aplicados.
        *   **Layout:** Grade (`GridView` em Flutter) ou Lista (`ListView`) de cards de obras.
        *   **Card da Obra (Componente Reutilizável):**
            *   Pôster.
                *   **Componente (Flutter):** `Image.network` com placeholder e tratamento de erro, dentro de um `AspectRatio` ou `SizedBox`.
            *   Título.
            *   Ano.
            *   Tipo (Filme/Série/Anime).
            *   Avaliação média (estrelas).
        *   Opções de Filtro Avançado (botão que abre modal/drawer).
            *   **Componente (Flutter):** `FilterChip`s, `DropdownButton`s dentro de um `BottomSheet` ou `Dialog`.
    6.  **Interação:** Usuário clica em um resultado da busca.
    7.  **Ação do Sistema:** Navega para a Tela de Informações da Obra selecionada.
*   **Componentes Visuais Chave:**
    *   **Campo de Busca Interativo:** Com sugestões e feedback de carregamento.
    *   **Cards de Obra:** Design consistente e informativo, otimizado para toque/clique.
    *   **Filtros:** Intuitivos e fáceis de usar.

#### 4. Tela com Informações da Obra

*   **Fluxo (Mobile e Web - Layout adaptável):**
    1.  **Acesso:** Usuário chega a esta tela após clicar em uma obra (da busca, do feed, de uma lista, etc.).
    2.  **Layout da Tela:**
        *   **Área de Destaque (Topo):**
            *   Pôster/Imagem de Capa Grande.
                *   **Componente (Flutter):** `Stack` com `Image.network` e talvez um `Gradient` sobreposto.
            *   Título da Obra (grande).
            *   Informações Chave: Ano, Duração/Nº Eps, Classificação, Gêneros (como `Chip`s).
            *   Avaliação Média da Comunidade (estrelas).
                *   **Componente (Flutter):** Widget de estrelas customizado ou de um pacote.
        *   **Botões de Ação Principais:**
            *   "Marcar como Assistido" (ícone de olho).
            *   "Avaliar" (ícone de estrela).
            *   "Adicionar à Lista" (ícone de lista/bookmark).
            *   "Quero Assistir" (ícone de coração/bookmark).
            *   **Componente (Flutter):** `ElevatedButton`, `IconButton` ou `TextButton` com ícones, agrupados em um `Row` ou `Wrap`.
        *   **Seções de Conteúdo (Abas ou Scroll Vertical com Cabeçalhos):**
            *   **Sobre/Sinopse:** Texto da sinopse (com "Ler mais").
                *   **Componente (Flutter):** `Text` com `overflow: TextOverflow.ellipsis` e um `TextButton` para expandir.
            *   **Elenco/Equipe:** Carrossel (`ListView horizontal`) ou lista de atores/diretores com fotos e nomes.
                *   **Componente (Flutter):** `ListTile` com `CircleAvatar` e `Text`.
            *   **Temporadas/Episódios (para Séries/Animes):** Lista expansível.
                *   **Componente (Flutter):** `ExpansionPanelList` ou `ListView` de `ExpansionTile`s.
            *   **Reviews de Usuários:** Lista de reviews com avatar, nome, avaliação, trecho do review.
                *   **Componente (Flutter):** `ListView` de cards customizados.
            *   **Listas que Contêm esta Obra:** Carrossel ou lista de listas.
*   **Componentes Visuais Chave:**
    *   **Layout Responsivo:** `Column`, `Row`, `Expanded`, `Flexible` para adaptar o conteúdo.
    *   **Abas (se usadas):** `TabBar` e `TabBarView`.
    *   **Carrosséis:** `ListView.builder` com `scrollDirection: Axis.horizontal`.
    *   **Botões de Ação Claros:** Com feedback visual.

#### 5. Tela de Adição da Obra que foi Assistida

*   **Fluxo (Mobile e Web):**
    1.  **Acesso:** Geralmente a partir da Tela de Informações da Obra, clicando em "Marcar como Assistido". Pode também haver um botão "+" global que leva a uma busca para adicionar rapidamente.
    2.  **Modal/Tela de Registro de Visualização:**
        *   Exibe o Título e Pôster da obra (para confirmação).
        *   **Opções:**
            *   **Data da Visualização:** Seletor de data (default: hoje).
                *   **Componente (Flutter):** `showDatePicker`.
            *   **Avaliação (Estrelas):** Seletor de 0.5 a 5 estrelas.
                *   **Componente (Flutter):** Widget de estrelas interativo.
            *   **Escrever um Review Rápido (Opcional):** Campo de texto pequeno.
                *   **Componente (Flutter):** `TextFormField`.
            *   **Marcar como Re-assistido (Checkbox/Toggle).**
                *   **Componente (Flutter):** `Checkbox` ou `Switch`.
            *   **Adicionar a uma Lista (Opcional):** Dropdown ou seletor de listas existentes.
        *   **Botões:** "Salvar", "Cancelar".
    3.  **Interação:** Usuário preenche as informações e clica em "Salvar".
    4.  **Ação do Sistema:**
        *   Salva o registro de visualização, avaliação e review (se houver) no backend.
        *   Atualiza o estado da obra na interface (ex: ícone de "Assistido" fica marcado na tela de detalhes).
        *   **Sucesso:** Exibe `SnackBar` de confirmação. Fecha o modal/tela.
        *   **Falha:** Exibe mensagem de erro.
*   **Componentes Visuais Chave:**
    *   **Modal/Dialog:** `showDialog` ou `showModalBottomSheet` em Flutter.
    *   **Seletores:** `DatePicker`, widget de estrelas, `Checkbox`.
    *   **Formulário Conciso:** Para entrada rápida de dados.

#### 6. Tela com os Seus Assistidos (com Filtragem)

*   **Fluxo (Mobile e Web):**
    1.  **Acesso:** A partir do Perfil do Usuário, em uma aba/seção "Assistidos" ou "Histórico".
    2.  **Layout da Tela:**
        *   **Título da Seção:** "Meus Assistidos".
        *   **Filtros Rápidos (Visíveis):** "Todos", "Filmes", "Séries", "Animes".
            *   **Componente (Flutter):** `ToggleButtons`, `SegmentedButton` (novo no Flutter), ou `Chip`s em um `Row`.
        *   **(Opcional) Opções de Ordenação:** Por data de adição, por avaliação, por título.
            *   **Componente (Flutter):** `DropdownButton`.
        *   **Lista/Grade de Obras Assistidas:**
            *   Exibe as obras que o usuário marcou como assistidas, aplicando os filtros selecionados.
            *   Usa o mesmo **Card da Obra** reutilizável da tela de busca, possivelmente com informações adicionais como "Sua Avaliação" ou "Data Assistida".
            *   **Componente (Flutter):** `GridView.builder` ou `ListView.builder`.
    3.  **Interação:**
        *   Usuário clica nos filtros para mudar a visualização.
        *   Usuário clica em uma obra para ver seus detalhes.
*   **Componentes Visuais Chave:**
    *   **Controles de Filtro Claros e Responsivos.**
    *   **Lista/Grade Performática:** Especialmente se o usuário tiver muitas obras assistidas (usar `builder` construtores).
    *   **Feedback Visual:** Indicando o filtro ativo.

#### 7. Tela com Sua Lista Pessoal "Desejo Assistir"

*   **Fluxo (Mobile e Web):**
    1.  **Acesso:** A partir do Perfil do Usuário (aba "Listas" e seleciona a lista "Desejo Assistir") ou um atalho direto na navegação (se for uma funcionalidade muito usada).
    2.  **Layout da Tela:**
        *   **Título da Lista:** "Minha Lista de Desejos" ou "Quero Assistir".
        *   **(Opcional) Botão "Adicionar à Lista" (abre busca).**
        *   **(Opcional) Opções de Ordenação:** Por data de adição, por popularidade do item.
        *   **Lista/Grade de Obras na Lista:**
            *   Exibe as obras adicionadas à lista "Desejo Assistir".
            *   Usa o **Card da Obra** reutilizável.
            *   Cada item pode ter um botão "Remover da Lista" ou "Marcar como Assistido" (que iniciaria o fluxo 5).
            *   **Componente (Flutter):** `ListView.builder` ou `GridView.builder` com `ListTile`s ou Cards customizados que incluem botões de ação contextuais (`IconButton`).
    3.  **Interação:**
        *   Usuário clica em uma obra para ver detalhes.
        *   Usuário remove um item da lista.
*   **Componentes Visuais Chave:**
    *   **Gerenciamento de Lista:** Ações claras para adicionar/remover itens.
    *   **Visualização Consistente:** Com as outras listagens de obras.

### Considerações Gerais para Flutter:

*   **Gerenciamento de Estado:** Escolher uma solução de gerenciamento de estado (Provider, Riverpod, BLoC, GetX) para lidar com os dados do app, estado da UI e lógica de negócios.
*   **Navegação:** Usar `Navigator` 2.0 (Router) para navegação mais complexa e URLs web, ou `Navigator` 1.0 para apps mais simples. Pacotes como `go_router` podem simplificar.
*   **Componentização:** Criar widgets reutilizáveis para elementos comuns (Card de Obra, Botões de Ação, Campos de Formulário customizados) para manter o código limpo e consistente.
*   **Tema:** Definir um `ThemeData` centralizado para cores, tipografia, estilos de botões, etc., garantindo consistência visual e facilitando o modo escuro/claro.
*   **Responsividade:** Usar `MediaQuery`, `LayoutBuilder`, `FittedBox`, e widgets como `Wrap`, `Row`, `Column` com `Expanded` e `Flexible` para criar interfaces que se adaptem a diferentes tamanhos de tela (mobile e web).
*   **Testes:** Escrever testes unitários, de widget e de integração.

Este detalhamento serve como um ponto de partida. Cada tela e fluxo pode ser expandido com mais estados (carregamento, erro, vazio), microinterações e casos de uso específicos durante o desenvolvimento.
