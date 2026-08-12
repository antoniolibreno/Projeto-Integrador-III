# Componentes de UI — NatyApp Training

> Base visual: [naty.app/pt](https://naty.app/pt/), analisada em 12/08/2026. As cores, tipografia e formas seguem [DESIGN_SYSTEM.md](./DESIGN_SYSTEM.md). Como o site não contém uma interface mobile de treinamento, todas as especificações funcionais abaixo são **Decisão proposta para o aplicativo**, embora preservem os traços observados da marca.

## Regras comuns

- Unidade: dp para layout e sp para texto.
- Alvo de toque mínimo: 48 × 48 dp; separação recomendada entre alvos: 8 dp.
- Estados mínimos de componentes interativos: default, pressed, focused, disabled e loading; quando aplicável, selected, completed, locked e error.
- Ripple, foco visível, contraste AA e labels semânticos são obrigatórios.
- Layout compacto: 16–20 dp de margem. Tablet: conteúdo limitado e/ou grade; navegação inferior torna-se rail.

## Navegação e ações

### AppBar

- **Objetivo:** orientar e oferecer ações contextuais.
- **Aparência/tamanho:** 56 dp simples ou 96–112 dp com large title; surface, título Gilroy/Lexend 20–32 sp, ícones 24 dp.
- **Espaçamento:** 16 dp laterais; 8 dp entre ações.
- **Estados/comportamento:** transparente sobre o topo, ganha surface/borda ao rolar; back somente em rotas filhas.
- **Responsividade:** em tablet integra NavigationRail e limita título; ações excedentes vão para menu.
- **Acessibilidade:** título como heading; labels em ícones; respeitar SafeArea e escala de texto.

### BottomNavigationBar

- **Objetivo:** acesso às áreas Home, Cursos, Progresso, Ranking e Perfil.
- **Aparência/tamanho:** Material 3 NavigationBar, 64–80 dp, surface elevada; item selecionado em container roxo suave e ícone preenchido.
- **Espaçamento:** cinco destinos no máximo; label 12 sp.
- **Estados/comportamento:** preserva pilha/scroll por aba; badge opcional em Perfil/Suporte.
- **Responsividade:** vira NavigationRail a partir de 600 dp.
- **Acessibilidade:** label sempre visível; ordem lógica; seleção anunciada.

### Botão primário

- **Objetivo:** ação principal, como “Continuar treinamento”.
- **Aparência/tamanho:** roxo, texto branco/contrastante, 48–56 dp, raio 12 dp ou pill; padding 16–24 dp.
- **Estados:** default, pressed roxo escuro, focused com anel, disabled neutro, loading com spinner.
- **Comportamento:** um CTA dominante por região; evitar dupla submissão.
- **Responsividade:** largura total em formulários compactos; ajustado ao conteúdo em tablet.
- **Acessibilidade:** verbo explícito, progresso anunciado e contraste AA.

### Botão secundário

- **Objetivo:** ação relevante alternativa.
- **Aparência/tamanho:** container roxo claro ou verde quando a ação significa confirmar/concluir; mesmas dimensões do primário.
- **Estados/comportamento:** equivalentes ao primário; menor ênfase visual.
- **Responsividade/acessibilidade:** não usar apenas cor para distingui-lo; manter label completo.

### Botão outlined

- **Objetivo:** cancelar, ver detalhes ou ação terciária.
- **Aparência/tamanho:** fundo transparente, borda 1 dp, texto roxo, altura 48 dp.
- **Estados:** pressed com tint roxo; disabled com borda/texto neutros.
- **Comportamento:** pode acompanhar o primário, abaixo no mobile.
- **Responsividade/acessibilidade:** empilhar quando labels não couberem; foco de 2 dp.

## Conteúdo e formulários

### Card base

- **Objetivo:** agrupar uma unidade de conteúdo/ação.
- **Aparência/tamanho:** surface, raio 16 dp, borda 1 dp, sombra leve; largura fluida, altura pelo conteúdo.
- **Espaçamento:** padding 16 dp; gaps 8/12 dp.
- **Estados:** default, pressed, selected, disabled; borda roxa para seleção.
- **Comportamento:** card inteiro clicável só quando há um destino único.
- **Responsividade:** uma coluna compacta; duas ou três colunas em telas maiores.
- **Acessibilidade:** ordem semântica; não aninhar múltiplos alvos ambíguos.

### Cards de treinamento

- **Objetivo:** resumir curso/aula e induzir continuidade.
- **Aparência/tamanho:** 160–220 dp de altura; thumbnail 16:9 ou faixa visual, título, duração, progresso e CTA.
- **Espaçamento:** 12–16 dp; metadados com gap 8 dp.
- **Estados:** não iniciado, em andamento, concluído, bloqueado e expirado.
- **Comportamento:** abre o último ponto válido; menu secundário para materiais.
- **Responsividade:** horizontal na home, vertical na grade de cursos.
- **Acessibilidade:** anunciar título, percentual, duração e bloqueio.

### Cards de módulos

- **Objetivo:** agrupar aulas e indicar desbloqueio.
- **Aparência/tamanho:** 88–120 dp; número/ícone, título, contagem de aulas e progresso.
- **Espaçamento:** padding 16 dp, gap 12 dp.
- **Estados:** locked, available, active, completed.
- **Comportamento:** expande ou navega para lista; prerequisito explicado.
- **Responsividade:** lista no celular, grid no tablet.
- **Acessibilidade:** cadeado acompanhado de texto e motivo.

### Cards de progresso

- **Objetivo:** comunicar avanço e próximo marco.
- **Aparência/tamanho:** 120–180 dp; percentual grande, barra/anel, resumo e CTA.
- **Espaçamento:** 16–24 dp.
- **Estados:** vazio, em curso, concluído e sincronização pendente.
- **Comportamento:** abre detalhamento; anima uma vez ao carregar.
- **Responsividade:** empilha métricas ou cria linha de 2–3 cards.
- **Acessibilidade:** valor textual além do gráfico.

### Progress bar

- **Objetivo:** progresso linear de aula/curso.
- **Aparência/tamanho:** 6–8 dp, pill; trilho neutro, preenchimento roxo e verde ao concluir.
- **Espaçamento:** 8 dp do label; largura total.
- **Estados:** indeterminado, parcial, concluído, erro de sincronização.
- **Comportamento:** anima 150–300 ms sem retroceder visualmente durante sync.
- **Responsividade:** fluida.
- **Acessibilidade:** semantics `value`, `min`, `max` e percentual.

### Progress indicator circular

- **Objetivo:** progresso compacto ou carregamento.
- **Aparência/tamanho:** 24 dp loading; 64–96 dp com percentual, stroke 6–8 dp.
- **Estados:** indeterminado/determinado/concluído.
- **Comportamento:** não girar indefinidamente sem mensagem após espera longa.
- **Responsividade:** mantém proporção.
- **Acessibilidade:** label “Carregando” ou percentual; reduzir movimento.

### Campo de pesquisa

- **Objetivo:** localizar cursos, aulas e artigos.
- **Aparência/tamanho:** 52–56 dp, raio 12/pill, ícone lupa, fundo surfaceVariant e botão limpar.
- **Espaçamento:** 16 dp horizontal; 8–12 dp entre ícones/texto.
- **Estados:** idle, focused, typing, results, no results, error.
- **Comportamento:** debounce; sugestões; limpar restaura lista.
- **Responsividade:** full width no celular, máximo 560 dp em tablet.
- **Acessibilidade:** label explícito e quantidade de resultados anunciada.

### Input

- **Objetivo:** entrada textual.
- **Aparência/tamanho:** 56 dp mínimo, label, helper/error, borda 1 dp e raio 8–12 dp.
- **Espaçamento:** 16 dp horizontal; 6–8 dp até helper.
- **Estados:** empty, focused, filled, disabled, read-only, error, success.
- **Comportamento:** teclado/autofill adequados e validação após interação.
- **Responsividade:** largura total; campos relacionados podem dividir linha em tablet.
- **Acessibilidade:** label não depende de placeholder; erro associado ao campo.

### Dropdown

- **Objetivo:** selecionar uma opção conhecida.
- **Aparência/tamanho:** input de 56 dp com chevron; menu com raio 12 dp e sombra nível 2.
- **Espaçamento:** itens de pelo menos 48 dp.
- **Estados:** closed, open, selected, disabled, error.
- **Comportamento:** bottom sheet para listas longas no celular; busca se >10 itens.
- **Responsividade:** menu ancorado em telas grandes.
- **Acessibilidade:** valor, expansão e seleção anunciados; teclado suportado.

### Chip

- **Objetivo:** filtro, categoria ou status curto.
- **Aparência/tamanho:** 32–40 dp, pill; label 13–14 sp; ícone opcional.
- **Espaçamento:** 8–12 dp horizontal; wrap com gap 8 dp.
- **Estados:** default, selected roxo suave, pressed, disabled.
- **Comportamento:** filter chip alterna; input chip remove explicitamente.
- **Responsividade:** rolagem horizontal só para filtros; preferir wrap.
- **Acessibilidade:** anunciar selecionado/não selecionado.

### Badge

- **Objetivo:** contagem ou status compacto.
- **Aparência/tamanho:** 18–24 dp, pill; roxo, verde ou semântico; texto 11–12 sp.
- **Estados:** count, dot, success, warning.
- **Comportamento:** `99+` para grandes números.
- **Responsividade:** preso ao ícone/card sem cobrir conteúdo.
- **Acessibilidade:** significado incluído no label do elemento pai.

### Avatar

- **Objetivo:** representar colaborador ou instrutor.
- **Aparência/tamanho:** 32, 40, 48 ou 72 dp; circular; foto ou iniciais sobre gradiente discreto.
- **Estados:** image, fallback, online opcional, loading.
- **Comportamento:** abre perfil apenas quando interativo.
- **Responsividade:** tamanho por contexto, não por viewport.
- **Acessibilidade:** nome como descrição; decorativo quando redundante.

### Lista

- **Objetivo:** apresentar itens escaneáveis.
- **Aparência/tamanho:** item mínimo 64 dp, leading 40–48 dp, título e apoio, trailing status/chevron.
- **Espaçamento:** 16 dp horizontal; divisores recuados opcionais.
- **Estados:** default, pressed, selected, disabled, swipe em casos seguros.
- **Comportamento:** paginação/lazy load; ações destrutivas exigem confirmação.
- **Responsividade:** largura de leitura limitada; master-detail em tablet.
- **Acessibilidade:** item agrupado e ação claramente anunciada.

### Accordion

- **Objetivo:** FAQ, materiais ou agrupamento de módulos.
- **Aparência/tamanho:** cabeçalho mínimo 56 dp, chevron, conteúdo com padding 16 dp.
- **Estados:** collapsed, expanded, focused, disabled.
- **Comportamento:** anima 200–300 ms; preservar expansão ao retornar.
- **Responsividade:** largura total.
- **Acessibilidade:** estado expandido e relação header/painel anunciados.

## Feedback e estados

### Modal

- **Objetivo:** decisão curta e bloqueante.
- **Aparência/tamanho:** raio 24 dp, largura compacta menos 32 dp (máx. 560 dp), padding 24 dp.
- **Estados:** opening, active, submitting, error.
- **Comportamento:** foco preso; fechar por back/scrim apenas quando seguro; tarefas longas usam bottom sheet/tela.
- **Responsividade:** dialog em tablet, modal bottom sheet no celular quando apropriado.
- **Acessibilidade:** título, foco inicial e retorno de foco; ações com verbos claros.

### Snackbar

- **Objetivo:** feedback temporário não bloqueante.
- **Aparência/tamanho:** grafite, texto claro, raio 8–12 dp; acima da navegação; ação roxa/verde contrastante.
- **Estados:** info, success, warning, error; máximo uma ação.
- **Comportamento:** 4–6 s; erros críticos persistem em banner/tela.
- **Responsividade:** margem 16 dp; max 560 dp.
- **Acessibilidade:** live region; tempo suficiente; não conter única forma de recuperar erro.

### Empty state

- **Objetivo:** explicar ausência e próximo passo.
- **Aparência/tamanho:** ilustração 120–180 dp, H3, texto e CTA; centralizado sem desperdiçar contexto.
- **Estados:** primeiro uso, sem resultados, conteúdo concluído.
- **Comportamento:** CTA resolve a causa quando possível.
- **Responsividade:** max 420 dp.
- **Acessibilidade:** ilustração decorativa; mensagem específica.

### Loading state

- **Objetivo:** indicar trabalho sem layout jump.
- **Aparência/tamanho:** skeleton com geometria real, shimmer sutil roxo/neutro; spinner para ação local.
- **Estados:** initial, pagination, refresh, button.
- **Comportamento:** skeleton após ~300 ms; mensagem e retry em espera longa.
- **Responsividade:** replica grid/lista do breakpoint.
- **Acessibilidade:** anunciar início/fim; respeitar reduzir movimento.

### Error state

- **Objetivo:** explicar falha e oferecer recuperação.
- **Aparência/tamanho:** ícone semântico, título, descrição curta, retry e suporte opcional.
- **Estados:** inline, section, full page, offline.
- **Comportamento:** preservar dados digitados; código técnico apenas em detalhes copiáveis.
- **Responsividade:** inline quando a falha é local.
- **Acessibilidade:** foco no resumo quando necessário; cor + ícone + texto.

## Componentes específicos de treinamento

### CourseCard

- **Objetivo:** descoberta e retomada de curso.
- **Aparência/tamanho:** vertical 280–340 dp ou horizontal 128–160 dp; thumbnail 16:9, categoria, título, duração, progresso e CTA.
- **Espaçamento:** 16 dp; gap 8–12 dp.
- **Estados:** not started, in progress, completed, locked, mandatory, overdue.
- **Comportamento:** toca para detalhes; CTA retoma última aula.
- **Responsividade:** carrossel horizontal na Home, grid 1/2/3 colunas em Cursos.
- **Acessibilidade:** leitura inclui obrigatoriedade, duração e progresso.

### ModuleCard

- **Objetivo:** representar etapa do curso.
- **Aparência/tamanho:** 96–128 dp; número em círculo roxo, título, `x aulas`, duração e progresso.
- **Espaçamento:** 16 dp, gap 12 dp.
- **Estados:** locked, available, active, completed.
- **Comportamento:** abre aulas; bloqueio explica pré-requisito.
- **Responsividade:** lista compacta; grid no tablet.
- **Acessibilidade:** ordem do módulo e estado por texto.

### LessonCard

- **Objetivo:** item navegável de aula.
- **Aparência/tamanho:** mínimo 72 dp; leading com número/check/play, título, duração e trailing.
- **Espaçamento:** 12–16 dp.
- **Estados:** unseen, current, completed, locked, download available/offline.
- **Comportamento:** abre aula; atual preserva posição.
- **Responsividade:** lista; master-detail em telas largas.
- **Acessibilidade:** tipo, duração, conclusão e bloqueio anunciados.

### VideoLessonCard

- **Objetivo:** destacar conteúdo em vídeo.
- **Aparência/tamanho:** thumbnail 16:9, play de 48 dp, duração em badge; 180–260 dp.
- **Espaçamento:** 12–16 dp.
- **Estados:** new, watched percentage, completed, offline, unavailable.
- **Comportamento:** play abre player; barra indica ponto assistido.
- **Responsividade:** largura total compacta, grade no tablet.
- **Acessibilidade:** label “Reproduzir”, duração e progresso; legendas indicadas.

### QuizCard

- **Objetivo:** iniciar/repetir avaliação.
- **Aparência/tamanho:** 120–160 dp; ícone, título, questões, tempo, melhor nota e CTA.
- **Espaçamento:** 16 dp.
- **Estados:** available, in progress, passed, failed, locked, attempts exhausted.
- **Comportamento:** confirma regras antes de iniciar quando houver limite.
- **Responsividade:** largura total; métrica em linha ampla.
- **Acessibilidade:** nota e tentativas em texto.

### QuizQuestion

- **Objetivo:** apresentar enunciado sem distração.
- **Aparência/tamanho:** contador/categoria, texto H3/body large e mídia opcional; altura variável.
- **Espaçamento:** 24 dp antes das alternativas; 16 dp lateral.
- **Estados:** unanswered, answered, validation error, reviewed.
- **Comportamento:** uma questão por viewport quando possível; resposta não enviada sem confirmação quando configurado.
- **Responsividade:** max 680 dp de leitura.
- **Acessibilidade:** heading, progresso “Questão 2 de 10” e instrução do tipo de seleção.

### QuizAlternative

- **Objetivo:** selecionar resposta.
- **Aparência/tamanho:** mínimo 56 dp, borda 1 dp, raio 12 dp, letra A/B/C/D e texto.
- **Espaçamento:** padding 16 dp; gap 12 dp entre alternativas.
- **Estados:** default, selected, correct, incorrect, disabled, focused.
- **Comportamento:** radio/checkbox conforme questão; após envio, explica resultado.
- **Responsividade:** largura total, texto quebra livremente.
- **Acessibilidade:** controle nativo semântico; correto/incorreto não depende de cor.

### CourseProgressCard

- **Objetivo:** visão consolidada e próximo passo.
- **Aparência/tamanho:** 160–220 dp; anel 72 dp, percentual, aulas, tempo e CTA.
- **Espaçamento:** 16–24 dp.
- **Estados:** zero, active, completed, delayed, sync pending.
- **Comportamento:** abre trilha detalhada.
- **Responsividade:** vertical compacto, horizontal/duas colunas em tablet.
- **Acessibilidade:** resumo completo em uma descrição.

### AchievementCard

- **Objetivo:** reconhecer marco conquistado.
- **Aparência/tamanho:** 140–190 dp; medalha adulta/geométrica, título, data e critério; brilho roxo discreto.
- **Espaçamento:** 16 dp.
- **Estados:** locked, near completion, unlocked, new.
- **Comportamento:** abre detalhes e compartilhamento permitido pela empresa.
- **Responsividade:** grid 2 colunas compacto, 3–4 amplo.
- **Acessibilidade:** critério e status; não ocultar conteúdo bloqueado apenas por blur.

### XPIndicator

- **Objetivo:** mostrar XP atual e ganho recente.
- **Aparência/tamanho:** chip 36–44 dp com ícone geométrico e `1.240 XP`; roxo/verde.
- **Espaçamento:** 12 dp horizontal, gap 6 dp.
- **Estados:** normal, gaining, maxed, offline pending.
- **Comportamento:** microanimação não bloqueante ao ganhar XP.
- **Responsividade:** abreviado apenas se houver label acessível.
- **Acessibilidade:** anunciar valor total e ganho.

### LevelIndicator

- **Objetivo:** comunicar nível e meta.
- **Aparência/tamanho:** selo 40–56 dp + label; pode integrar barra para próximo nível.
- **Espaçamento:** gap 8 dp.
- **Estados:** current, level-up, maximum.
- **Comportamento:** abre explicação dos níveis.
- **Responsividade:** versão compacta em AppBar, expandida no Perfil.
- **Acessibilidade:** “Nível 4 de 10”; ícone decorativo.

### TrainingStreak

- **Objetivo:** incentivar consistência sem pressão indevida.
- **Aparência/tamanho:** card 112–160 dp; sequência semanal, dias ativos e ícone de chama estilizada/raio, sem estética infantil.
- **Espaçamento:** 16 dp; dias com 32–36 dp.
- **Estados:** active, at risk, paused, personal best.
- **Comportamento:** usa calendário e fuso da empresa; não pune licença/folga.
- **Responsividade:** sete dias cabem em compact; resumo em acessibilidade.
- **Acessibilidade:** cada dia possui estado textual; não apenas cor.

### LeaderboardItem

- **Objetivo:** posição, pessoa, XP e movimento no ranking.
- **Aparência/tamanho:** 64–72 dp; posição, avatar 40 dp, nome/equipe, XP e variação.
- **Espaçamento:** 12–16 dp.
- **Estados:** normal, current user destacado, top 3, tied, privacy hidden.
- **Comportamento:** filtros por período/equipe; ranking opt-out conforme política.
- **Responsividade:** oculta metadados secundários, nunca nome/posição/XP.
- **Acessibilidade:** posição e variação narradas; privacidade respeitada.

### CertificateCard

- **Objetivo:** apresentar certificação concluída.
- **Aparência/tamanho:** 180–240 dp; surface com borda/gradiente de marca, selo, curso, emissão e validade.
- **Espaçamento:** 20–24 dp.
- **Estados:** available, generating, expired, revoked, download error.
- **Comportamento:** visualizar, baixar e compartilhar conforme permissão.
- **Responsividade:** largura total no celular, grid no tablet.
- **Acessibilidade:** status, datas e ações explícitas; PDF acessível quando possível.

