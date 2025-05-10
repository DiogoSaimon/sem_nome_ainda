## Esboços das Telas Principais – Versão Mobile

Este documento descreve os esboços conceituais para as telas principais da versão mobile (Android/iOS) do aplicativo de catalogação de filmes, séries e animes. O design priorizará a navegação intuitiva por toque e a clareza da informação em telas menores.

### Navegação Principal (Barra de Abas Inferior)
1.  **Início (Home):** Feed de atividades e descobertas.
2.  **Buscar:** Acesso à funcionalidade de pesquisa.
3.  **Adicionar (+):** Ação rápida para registrar um novo item assistido (abre busca ou sugestões).
4.  **Listas:** Acesso às listas do usuário e listas seguidas.
5.  **Perfil:** Acesso ao perfil do usuário.

--- 

### 1. Tela Inicial (Home/Feed)
*   **Cabeçalho:**
    *   Logo do App (ou nome).
    *   Ícone de Notificações.
*   **Seção de Destaques (Carrossel Horizontal):**
    *   "Para Você" (Recomendações personalizadas: pôsteres pequenos, título).
    *   "Populares Esta Semana" (Filmes, Séries, Animes com mais atividade: pôsteres, título).
    *   "Lançamentos Recentes" (Pôsteres, título).
*   **Feed de Atividades (Scroll Vertical Infinito):**
    *   **Tipo de Card 1: Amigo Assistiu/Avaliou:**
        *   Avatar do Amigo, Nome do Amigo "avaliou/assistiu [Nome do Filme/Série/Anime]".
        *   Pôster do Título.
        *   Avaliação (estrelas) se houver.
        *   Trecho do review (se houver).
        *   Ações: Curtir, Comentar, Ver Título.
    *   **Tipo de Card 2: Amigo Criou/Atualizou Lista:**
        *   Avatar do Amigo, Nome do Amigo "criou/atualizou a lista [Nome da Lista]".
        *   Preview de pôsteres da lista.
        *   Ações: Ver Lista, Salvar Lista.
    *   **Tipo de Card 3: Novo Review Popular (de não amigos):**
        *   Pôster do Título.
        *   "Review de [Nome do Usuário] para [Nome do Filme/Série/Anime]".
        *   Trecho do review.
        *   Ações: Curtir, Comentar, Ver Review Completo, Ver Título.

### 2. Tela de Busca
*   **Barra de Busca (Topo):**
    *   Campo de texto "Buscar filmes, séries, animes, atores...".
    *   Ícone de Filtro (ao lado ou dentro da barra).
*   **Ao Digitar (Resultados Instantâneos):**
    *   Lista vertical de sugestões (Pôster miniatura, Título, Tipo - Filme/Série/Anime).
*   **Tela de Resultados da Busca (Após submeter a busca ou selecionar "Ver todos")**
    *   Abas/Filtros Rápidos: Tudo, Filmes, Séries, Animes, Pessoas, Listas.
    *   Listagem de Resultados (Scroll Vertical):
        *   Card de Título: Pôster, Título, Ano, Avaliação Média.
        *   Card de Pessoa: Foto, Nome, Função Principal (Ator, Diretor).
        *   Card de Lista: Nome da Lista, Criador, Número de Itens.
*   **Opções de Filtro Avançado (Abre modal/nova tela):**
    *   Gênero, Ano de Lançamento, País, Estúdio (para animes), Ordenar por (Popularidade, Avaliação, Data).

### 3. Tela de Detalhes do Título (Filme/Série/Anime)
*   **Imagem de Capa (Background/Topo):** Pôster ou imagem promocional em destaque.
*   **Informações Principais (Sobreposto ou abaixo da capa):**
    *   Pôster do Título (menor, se a capa for diferente).
    *   Título Grande.
    *   Ano, Duração/Nº de Episódios, Classificação Indicativa.
    *   Avaliação Média da Comunidade (estrelas).
    *   Botões de Ação Primários:
        *   **[Ícone Olho] Assistido:** (Tocar abre opções: Marcar como assistido, Registrar data, Re-assistido).
        *   **[Ícone Coração/Estrela] Avaliar:** (Tocar abre seletor de estrelas).
        *   **[Ícone Lista] Adicionar à Lista:** (Tocar abre seletor de listas ou opção de criar nova).
        *   **[Ícone Bookmark] Quero Assistir.**
*   **Abas de Conteúdo (Navegação horizontal por swipe ou abas fixas):**
    *   **Sobre:**
        *   Sinopse (com opção "Ler Mais").
        *   Gêneros (tags clicáveis).
        *   Elenco Principal (Carrossel horizontal: Foto, Nome do Ator, Personagem).
        *   Diretor(es), Roteirista(s), Estúdio (para animes).
        *   Onde Assistir (se disponível, ícones de serviços de streaming).
        *   Para Séries/Animes: Lista de Temporadas/Episódios (expansível, com opção de marcar episódios individualmente).
    *   **Reviews:**
        *   Seu Review (se houver, com botão "Editar").
        *   Botão "Escrever Review".
        *   Filtro/Ordenação de Reviews (Populares, Recentes, Amigos).
        *   Lista de Reviews (Scroll Vertical): Avatar, Nome do Usuário, Avaliação, Trecho do Review, Ações (Curtir, Comentar, Ver Completo).
    *   **Listas:**
        *   Listas populares que contêm este título.
*   **Botão Flutuante (+) (Opcional):** Ações rápidas contextuais (ex: Log Rápido, Adicionar à Lista X).

### 4. Tela de Perfil do Usuário (Próprio ou de Outro Usuário)
*   **Cabeçalho do Perfil:**
    *   Foto de Capa (personalizável).
    *   Avatar do Usuário.
    *   Nome de Usuário, Nome Real (opcional).
    *   Botão "Editar Perfil" (se próprio) ou "Seguir/Deixar de Seguir" e "Mensagem" (se de outro).
    *   Estatísticas Chave (em linha ou grade): Filmes Assistidos, Séries Assistidas, Animes Assistidos, Total de Reviews, Seguidores, Seguindo.
*   **Abas de Conteúdo:**
    *   **Atividade:** Feed de atividades recentes do usuário (similar ao feed principal, mas focado neste usuário).
    *   **Filmes:**
        *   Sub-abas: Assistidos, Avaliados, Quero Assistir.
        *   Grid de Pôsteres.
        *   Opções de filtro/ordenação.
    *   **Séries:** (Similar a Filmes)
    *   **Animes:** (Similar a Filmes)
    *   **Reviews:** Lista dos reviews escritos pelo usuário (Card: Pôster, Título, Sua Avaliação, Trecho do Review).
    *   **Listas:** Lista das listas criadas pelo usuário (Card: Nome da Lista, Descrição, Preview de Pôsteres).

### 5. Tela de Login / Cadastro
*   **Login:**
    *   Logo do App.
    *   Campo "E-mail".
    *   Campo "Senha".
    *   Botão "Entrar".
    *   Link "Esqueceu a senha?".
    *   Opções de Login Social (Botões: Google, Apple, etc.).
    *   Link "Não tem uma conta? Cadastre-se".
*   **Cadastro:**
    *   Logo do App.
    *   Campo "Nome de Usuário".
    *   Campo "E-mail".
    *   Campo "Senha".
    *   Campo "Confirmar Senha".
    *   Checkbox "Aceito os Termos e Condições".
    *   Botão "Cadastrar".
    *   Link "Já tem uma conta? Faça login".

### 6. Tela de Listas (Visualização e Criação/Edição)
*   **Visualização de uma Lista:**
    *   Nome da Lista (Grande).
    *   Criador da Lista (Avatar, Nome) - se não for sua.
    *   Descrição da Lista.
    *   Estatísticas (Nº de itens, Nº de seguidores/curtidas da lista).
    *   Botões de Ação (Seguir Lista/Salvar, Compartilhar) - se não for sua.
    *   Botão "Editar Lista" - se for sua.
    *   Lista de Itens (Scroll Vertical): Pôster, Título, Ano, (opcionalmente, breve comentário do criador da lista sobre o item).
*   **Criação/Edição de Lista (Modal ou Nova Tela):**
    *   Campo "Nome da Lista".
    *   Campo "Descrição da Lista" (multilinhas).
    *   Toggle "Lista Pública/Privada".
    *   Botão "Adicionar Itens" (abre busca de títulos).
    *   Lista de Itens Adicionados (com opção de reordenar e remover).
    *   Botão "Salvar Lista".

### 7. Tela de Escrever/Editar Review
*   **Cabeçalho:** "Escrever Review para [Nome do Título]" ou "Editar Review".
*   **Informações do Título (Topo, não editável):** Pôster Pequeno, Título.
*   **Campo de Avaliação (Estrelas):** Seletor de 0.5 a 5 estrelas.
*   **Campo de Data Assistida:** Seletor de data (opcional).
*   **Checkbox "Contém Spoilers".**
*   **Campo de Texto do Review (Grande, multilinhas, com formatação básica - negrito, itálico).**
*   **Botões:** "Publicar Review" / "Salvar Alterações", "Cancelar".

--- 

Estes esboços são iniciais e servirão de base para um design mais detalhado e wireframes. A paleta de cores, tipografia e iconografia serão definidas posteriormente, inspiradas no Letterboxd mas com identidade própria.
