# Experiência das telas — NatyApp Training

> Direção visual baseada em [naty.app/pt](https://naty.app/pt/), analisada em 12/08/2026, e nos tokens de [DESIGN_SYSTEM.md](./DESIGN_SYSTEM.md). A arquitetura mobile descrita aqui é **Decisão proposta para o aplicativo**, pois não foi observada no site institucional.

## Arquitetura e navegação global

Após autenticação, cinco destinos principais: **Home**, **Cursos**, **Progresso**, **Ranking** e **Perfil**. Conquistas pode ser acessada pela Home/Perfil; Suporte e Central de ajuda ficam em Perfil. Rotas de curso, módulo, aula, quiz e resultado são filhas e usam navegação de retorno. Deep links devem abrir curso/aula preservando autenticação e destino.

Em celular, usar NavigationBar inferior. A partir de 600 dp, usar NavigationRail e conteúdo com largura máxima. Preservar estado e posição de rolagem por aba. Toda tela suporta pull-to-refresh quando houver conteúdo remoto, offline quando aplicável e tema do sistema.

## Padrões de estado

- **Loading:** skeleton que replica o layout; spinner apenas para ações locais.
- **Vazio:** ilustração Naty discreta, mensagem contextual e CTA possível.
- **Erro:** manter conteúdo em cache, indicar falha inline e oferecer “Tentar novamente”; tela cheia só quando nada pode ser exibido.
- **Offline:** banner persistente e status de sincronização; vídeos/materiais baixados continuam disponíveis.
- **Acessibilidade:** headings, ordem de foco, labels de ícone, contraste AA, texto escalável, legendas/transcrições e redução de movimento.

## 1. Splash Screen

- **Objetivo:** comunicar marca enquanto restaura sessão/configuração.
- **Estrutura visual:** fundo grafite `#0D1017`; símbolo Naty central em gradiente verde–roxo; wordmark abaixo; indicador discreto no terço inferior.
- **Componentes:** logo, CircularProgressIndicator e versão opcional.
- **Hierarquia:** símbolo → nome → estado de carregamento.
- **Comportamento:** duração mínima apenas para evitar flash; decide Login ou Home; respeita deep link.
- **Navegação:** automática, sem botão back.
- **Vazio:** não aplicável.
- **Loading:** animação curta do gradiente, desativada com reduzir movimento.
- **Erro:** se bootstrap falhar, mostrar marca + mensagem, “Tentar novamente” e acesso ao suporte.

## 2. Login

- **Objetivo:** autenticar com Google e validar que a conta já existe na NatyApp.
- **Estrutura visual:** topo com logo e headline curta; ilustração tecnológica discreta; card/formulário na metade inferior; links legais/suporte no rodapé.
- **Componentes:** logo, botão “Continuar com Google”, mensagem de segurança, checkbox/links legais quando exigidos.
- **Hierarquia:** “Acesse seu treinamento” → explicação da conta corporativa → Google → ajuda.
- **Comportamento:** OAuth em fluxo seguro; após Google, backend verifica e-mail/tenant existente. Não criar conta automaticamente sem regra explícita.
- **Navegação:** sucesso → Home/deep link; suporte → rota pública; back fecha fluxo externo.
- **Vazio:** conta Google sem cadastro: explicar que o acesso depende da empresa e oferecer trocar conta/contatar administrador.
- **Loading:** botão conserva largura e mostra “Validando conta…”.
- **Erro:** distinguir cancelamento, conexão, conta inexistente, conta suspensa e erro de servidor; nunca expor detalhes sensíveis.

## 3. Home

- **Objetivo:** responder “onde estou e o que faço agora?”.
- **Estrutura visual:** AppBar com avatar/notificações; saudação; card de progresso geral; destaque “Continuar treinamento”; módulos em carrossel/lista; conquistas recentes; bloco nível/XP.
- **Componentes:** CourseProgressCard, CourseCard, ModuleCard, AchievementCard, XPIndicator, LevelIndicator, TrainingStreak.
- **Hierarquia:** próxima ação → progresso → módulos → motivadores.
- **Comportamento:** CTA retoma ponto exato; módulos ordenados por obrigatoriedade/prazo; animação de XP apenas quando houve ganho.
- **Navegação:** cards abrem seus detalhes; “Ver todos” abre Cursos/Conquistas; tabs globais permanecem.
- **Vazio:** sem treinamentos atribuídos, confirmar que está tudo em dia e orientar contato com gestor.
- **Loading:** skeleton por seção; carregar conteúdo crítico primeiro.
- **Erro:** cache da última visão e retry por seção; sync pendente indicado sem apagar progresso local.

## 4. Cursos

- **Objetivo:** descobrir, filtrar e retomar cursos.
- **Estrutura visual:** AppBar “Cursos”; pesquisa; chips (Todos, Obrigatórios, Em andamento, Concluídos); seção/grade de CourseCards.
- **Componentes:** SearchField, FilterChip, Dropdown de ordenação, CourseCard e paginação.
- **Hierarquia:** busca/filtros → cursos prioritários → catálogo.
- **Comportamento:** filtros combináveis e persistidos na sessão; ordenação por prioridade, prazo ou progresso.
- **Navegação:** card → Detalhes do curso; bottom nav preservada.
- **Vazio:** diferenciar catálogo vazio de busca sem resultados; oferecer limpar filtros.
- **Loading:** skeleton de cards no layout atual.
- **Erro:** lista em cache + banner; retry de paginação inline.

## 5. Detalhes do curso

- **Objetivo:** contextualizar curso e iniciar/continuar.
- **Estrutura visual:** capa 16:9 com overlay; título, categoria/obrigatoriedade, duração e autor; progresso; descrição; objetivos; módulos; CTA fixo inferior.
- **Componentes:** AppBar, chips, ProgressBar, CourseProgressCard, accordion e ModuleCard.
- **Hierarquia:** título/status → CTA → progresso → objetivos → currículo.
- **Comportamento:** CTA muda entre Iniciar, Continuar e Revisar; conclusão exibe certificado quando elegível.
- **Navegação:** CTA → aula atual/lista de módulos; módulo → aulas; certificado → visualização.
- **Vazio:** curso sem módulos informa indisponibilidade e contato de suporte.
- **Loading:** skeleton de capa e blocos.
- **Erro:** retry; curso removido explica indisponibilidade e retorna ao catálogo.

## 6. Lista de módulos

- **Objetivo:** visualizar a trilha, dependências e avanço.
- **Estrutura visual:** resumo do curso/progresso no topo; lista numerada de ModuleCards; módulos podem expandir LessonCards.
- **Componentes:** ProgressBar, ModuleCard, Accordion, LessonCard, badges de status.
- **Hierarquia:** progresso total → módulo atual → próximos/bloqueados → concluídos.
- **Comportamento:** abre automaticamente o módulo atual; bloqueios mostram pré-requisito; conclusão atualiza progresso.
- **Navegação:** aula → Vídeo/Quiz; voltar → curso.
- **Vazio:** sem módulos publicados, orientar retorno posterior.
- **Loading:** skeleton de 4–6 módulos.
- **Erro:** manter módulos carregados e sinalizar falha de atualização.

## 7. Aula em vídeo

- **Objetivo:** assistir, compreender e avançar com continuidade confiável.
- **Estrutura visual:** player 16:9 no topo; título e status; descrição; progresso; CTA próxima aula; materiais relacionados abaixo.
- **Componentes:** player, controles, seletor de velocidade/qualidade, legendas, ProgressBar, LessonCard e lista de materiais.
- **Hierarquia:** vídeo → título/progresso → próxima ação → descrição/materiais.
- **Comportamento:** salvar posição periodicamente; concluir conforme regra definida; picture-in-picture e rotação; downloads conforme permissão. Autoplay da próxima aula deve ser opt-in/ter contagem cancelável.
- **Navegação:** back preserva posição; próxima aula ou quiz; material abre viewer seguro.
- **Vazio:** sem materiais, ocultar seção; vídeo indisponível oferece transcrição se houver.
- **Loading:** poster + spinner apenas no player; restante pode carregar independentemente.
- **Erro:** diferenciar rede, mídia removida e DRM; retry, qualidade menor e suporte. Controles continuam acessíveis.

## 8. Quiz

- **Objetivo:** avaliar compreensão com foco e feedback justo.
- **Estrutura visual:** AppBar com sair; barra e “Questão x de y”; QuizQuestion; alternativas; CTA “Confirmar”/“Próxima” fixo seguro acima do teclado.
- **Componentes:** ProgressBar, QuizQuestion, QuizAlternative, modal de saída.
- **Hierarquia:** progresso → enunciado → alternativas → ação.
- **Comportamento:** preservar respostas; feedback imediato somente conforme regra pedagógica; confirmar saída se houver mudanças; impedir envio vazio com mensagem acessível.
- **Navegação:** próxima questão; última → processamento/resultado; back confirma saída.
- **Vazio:** quiz sem questões informa indisponibilidade, sem contar tentativa.
- **Loading:** skeleton da questão; prefetch da próxima.
- **Erro:** salvar resposta local e repetir envio; falha nunca consome tentativa sem confirmação do servidor.

## 9. Resultado do quiz

- **Objetivo:** explicar desempenho e próximo passo.
- **Estrutura visual:** score/estado no topo; mensagem; XP ganho; acertos/erros; revisão por questão; CTAs continuar ou refazer.
- **Componentes:** circular progress, XPIndicator, cards de métricas, accordion de revisão e AchievementCard quando desbloqueado.
- **Hierarquia:** aprovado/revisar → nota → feedback → ação → detalhes.
- **Comportamento:** celebração curta e sóbria ao aprovar; explicar nota mínima e tentativas; revisão respeita política do curso.
- **Navegação:** continuar → próxima aula/módulo; refazer → introdução do quiz; voltar → curso.
- **Vazio:** resultado sem detalhes ainda mostra nota e orientação.
- **Loading:** estado “Calculando resultado…” com progresso.
- **Erro:** não pedir nova tentativa; consultar resultado novamente e oferecer suporte com ID copiável.

## 10. Progresso do treinamento

- **Objetivo:** visão consolidada de avanço, tempo, competências e pendências.
- **Estrutura visual:** período/filtro; progresso geral; métricas; trilhas/cursos; histórico; certificados.
- **Componentes:** CourseProgressCard, barras/anel, chips, lista, CertificateCard e gráfico simples.
- **Hierarquia:** conclusão geral → pendências/prazos → cursos → histórico.
- **Comportamento:** filtros por status/período; gráficos têm tabela/descrição equivalente; sync visível.
- **Navegação:** curso → detalhe; certificado → viewer; bottom nav.
- **Vazio:** novo colaborador vê explicação e CTA para cursos.
- **Loading:** skeleton das métricas sem números falsos.
- **Erro:** cache + timestamp da última atualização e retry.

## 11. Conquistas

- **Objetivo:** reconhecer marcos e mostrar metas alcançáveis.
- **Estrutura visual:** resumo de desbloqueadas; filtros; grid de AchievementCards; detalhe em bottom sheet.
- **Componentes:** AchievementCard, chips, XPIndicator e modal sheet.
- **Hierarquia:** novas → quase concluídas → desbloqueadas → bloqueadas.
- **Comportamento:** “nova” perde badge após visualização; critério transparente; compartilhar somente conforme política corporativa.
- **Navegação:** acessível por Home/Perfil; conquista relacionada pode abrir curso.
- **Vazio:** explicar como conquistar a primeira, sem tom infantil.
- **Loading:** skeleton de medalhas/cards.
- **Erro:** conquistas em cache; erro de sync discreto.

## 12. Ranking / gamificação

- **Objetivo:** comparação saudável e contextualizada.
- **Estrutura visual:** AppBar; período (semana/mês); escopo (equipe/empresa); posição pessoal destacada; top 3; lista restante; explicação das regras.
- **Componentes:** chips/dropdown, XPIndicator, LeaderboardItem, card de posição pessoal.
- **Hierarquia:** minha posição → top 3 → ranking → regras/privacidade.
- **Comportamento:** atualização com timestamp; empates consistentes; opt-out/anonimização conforme empresa; não expor dados além do autorizado.
- **Navegação:** bottom nav; perfil alheio só se permitido.
- **Vazio:** ranking desativado ou período sem atividade são mensagens distintas.
- **Loading:** skeleton com posição pessoal separada.
- **Erro:** última classificação com timestamp; retry.

## 13. Perfil

- **Objetivo:** identidade, preferências, histórico e acesso a suporte.
- **Estrutura visual:** avatar/nome/empresa; nível e XP; resumo; preferências; notificações; tema; privacidade; suporte; sair.
- **Componentes:** Avatar, LevelIndicator, XPIndicator, ListTiles, switches, dropdown de idioma/tema e modal de logout.
- **Hierarquia:** identidade → progresso → preferências → ajuda → conta.
- **Comportamento:** dados corporativos bloqueados ou encaminhados ao administrador; tema sistema/claro/escuro; logout confirmado.
- **Navegação:** itens para Conquistas, Certificados, Suporte e Central de ajuda.
- **Vazio:** foto ausente usa iniciais; métricas ausentes não exibem zeros enganosos.
- **Loading:** skeleton do header e listas.
- **Erro:** preferências locais continuam editáveis; falha de salvamento inline e reversível.

## 14. Suporte

- **Objetivo:** resolver problema ou abrir atendimento com contexto.
- **Estrutura visual:** pesquisa de ajuda; atalhos de problemas comuns; canais disponíveis; histórico de chamados; CTA “Falar com suporte”.
- **Componentes:** SearchField, cards de canal, lista de tickets, accordion e formulário/modal.
- **Hierarquia:** autoatendimento → contato → histórico.
- **Comportamento:** anexar diagnóstico com consentimento; pré-preencher usuário/empresa; exibir SLA/horário sem prometer disponibilidade não confirmada.
- **Navegação:** artigo → Central; ticket → detalhe; contato externo com confirmação.
- **Vazio:** sem chamados, mensagem positiva e CTA.
- **Loading:** skeleton dos canais/histórico.
- **Erro:** preservar rascunho; fornecer canal alternativo e ID técnico copiável.

## 15. Central de ajuda

- **Objetivo:** encontrar documentação e respostas sem sair do app.
- **Estrutura visual:** AppBar; busca dominante; categorias; artigos populares/recentes; FAQ em accordion; CTA de suporte ao final.
- **Componentes:** SearchField, category cards, ListTiles, Accordion, chips e snackbar de feedback.
- **Hierarquia:** busca → categorias → populares → suporte.
- **Comportamento:** busca com destaque de termo; artigos legíveis, links seguros e feedback “Foi útil?”; cache dos recentes.
- **Navegação:** artigo em rota interna; links externos identificados; suporte como fallback.
- **Vazio:** sem resultado oferece correção, limpar filtros e suporte.
- **Loading:** skeleton de categorias/resultados.
- **Erro:** artigos em cache permanecem; retry da busca e estado offline claro.

## Notas de adaptação mobile

- O hero fotográfico e a navegação extensa do site institucional não devem ser reproduzidos. No app, a marca aparece por cor, tipografia, forma, ilustração e microinterações.
- O roxo conduz ações e progresso; o verde confirma conclusão. Áreas escuras podem destacar splash, player, certificado e marcos, sem tornar todas as telas pesadas.
- Gamificação mede progresso real e deve explicar regras. Evitar moedas caricatas, rankings coercitivos e punição por ausência legítima.
- Dados de aprendizagem e ranking são corporativos: aplicar minimização, consentimento/aviso e regras do tenant.

