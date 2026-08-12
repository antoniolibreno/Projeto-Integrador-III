# Design System — NatyApp Training

> Referência analisada em 12/08/2026: [naty.app/pt](https://naty.app/pt/). Este documento descreve a linguagem visual observada no site e sua tradução para um aplicativo Flutter de treinamento. Valores identificados nas folhas de estilo são marcados como **Observado no site**. Extensões não verificáveis são marcadas como **Decisão proposta para o aplicativo**.

## Princípios de produto

- **Clareza operacional:** hierarquia forte, ações inequívocas e leitura rápida.
- **Tecnologia confiável:** visual SaaS enterprise, superfícies limpas e dados bem estruturados.
- **Progresso motivador:** gamificação adulta, baseada em domínio, constância e reconhecimento — sem excesso de confetes ou estética infantil.
- **Humanidade controlada:** cantos arredondados, ilustrações amigáveis e linguagem positiva equilibram o caráter técnico.
- **Acessibilidade primeiro:** contraste AA, alvos de toque de pelo menos 48 × 48 dp, texto escalável e estados nunca indicados apenas por cor.

## Identidade visual geral da NatyApp

**Observado no site:** a marca combina roxo vivo e verde com fundos claros ou grafite muito escuro. O símbolo é um balão circular com sorriso; o logotipo usa um gradiente de `#15C291` a `#6243E9`. Grandes títulos em branco/roxo ou texto grafite criam uma presença forte. Fotografias corporativas recebem overlays escuros; cards e painéis remetem a software B2B, governança e automação.

A identidade transmite tecnologia, confiança, automação e proximidade. No app, preservar:

- roxo como ação e progressão;
- verde como confirmação, continuidade e marca complementar;
- grafite azulado em vez de preto puro;
- títulos geométricos e pesados;
- superfícies arredondadas, bordas discretas e sombras contidas;
- gradiente verde–roxo reservado a momentos de marca e conquista.

## Estilo da interface

**Observado no site:** composição espaçosa, títulos de grande contraste, cards com borda, botões arredondados, áreas escuras imersivas, gradientes e brilhos difusos pontuais. Há modo claro e escuro, transições curtas e elevação em hover.

**Decisão proposta para o aplicativo:** usar Material 3 como infraestrutura de interação, mas reduzir seu aspecto genérico com paleta Naty, tipografia da marca, cards de 16 dp, indicadores de progresso roxos/verdes e navegação compacta. Evitar transportar menus, hero banners ou densidade editorial do site diretamente para telas pequenas.

## Cores

### Paleta de marca

| Token conceitual | Valor | Origem e uso |
|---|---:|---|
| Roxo principal | HSL `262 70% 50%` ≈ `#6B26D9` | **Observado no site.** CTA, links, foco e progresso. |
| Roxo principal escuro | HSL `262 70% 40%` ≈ `#561FB8` | **Observado no site.** Pressed e contraste em fundo claro. |
| Roxo principal claro | HSL `262 70% 65%` ≈ `#9566E4` | **Observado no site (dark theme).** Ações em superfícies escuras. |
| Roxo do logotipo | `#6243E9` | **Observado no SVG do logotipo.** Gradientes e assinatura visual. |
| Verde secundário | HSL `142 70% 45%` ≈ `#22C35E` | **Observado no site.** Sucesso e ação complementar. |
| Verde secundário claro | HSL `142 70% 60%` ≈ `#52DC85` | **Observado no site (dark theme).** Confirmação em fundo escuro. |
| Verde do logotipo | `#15C291` | **Observado no SVG do logotipo.** Início do gradiente de marca. |
| Gradiente de marca | `#15C291 → #6243E9` | **Observado no logotipo.** Splash, certificado e destaques raros. |

Não usar o gradiente em todos os botões. O roxo sólido deve ser o padrão de ação; o gradiente é um recurso de assinatura.

### Fundos, superfícies e texto

| Papel | Light | Dark | Origem |
|---|---:|---:|---|
| Background | `#FFFFFF` | HSL `220 28% 7%` ≈ `#0D1017` | **Observado no site.** |
| Surface | `#FFFFFF` | HSL `220 25% 12%` ≈ `#171C26` | **Observado no site.** |
| Surface variant | `#F6F7FA` | `#202634` | **Decisão proposta para o aplicativo.** |
| Texto principal | HSL `220 15% 20%` ≈ `#2B303B` | HSL `220 15% 95%` ≈ `#F0F1F4` | **Observado no site.** |
| Texto secundário | HSL `220 15% 43%` ≈ `#5D667E` | HSL `220 6% 78%` ≈ `#C3C6CC` | **Observado no site.** |
| Texto desabilitado | `#9298A5` | `#777E8D` | **Decisão proposta para o aplicativo.** |
| Borda | HSL `220 15% 90%` ≈ `#E2E4E9` | HSL `220 15% 20%` ≈ `#2B303B` | **Observado no site.** |
| Scrim | `#0D1017` a 48% | `#000000` a 64% | **Decisão proposta para o aplicativo.** |

### Cores de estados

| Estado | Cor base | Container claro | Container escuro | Observação |
|---|---:|---:|---:|---|
| Sucesso | `#22C35E` | `#E8F8EE` | `#123A24` | Verde secundário é o sucesso **observado no site**. Containers são proposta. |
| Erro | `#EF4444` | `#FDECEC` | `#491B20` | **Decisão proposta para o aplicativo**; vermelho aparece em estilos auxiliares, mas não como token semântico principal. |
| Alerta | HSL `38 92.1% 50.2%` ≈ `#F5A30B` | `#FFF6DE` | `#49320D` | Base **observada no site** como `cor-aviso`; containers são proposta. |
| Informação | `#3B82F6` | `#EAF2FE` | `#142D52` | **Decisão proposta para o aplicativo**; azul aparece em utilitários do site. |

Todos os estados devem combinar cor, ícone e texto. Para feedback de quiz, acrescentar “Correto”/“Revisar” e não depender do verde/vermelho.

### Contraste e distribuição

- Texto normal deve alcançar WCAG AA (4,5:1); texto grande, no mínimo 3:1.
- Prefira texto branco sobre roxo escuro; valide dinamicamente o roxo claro antes de usar branco.
- Verde deve ser usado como preenchimento apenas quando a combinação de texto atingir contraste; em caso contrário, usar verde como ícone/borda com texto grafite.
- Regra visual sugerida: 70% neutros, 20% roxo, 10% verde/semânticas.

## Tipografia

**Observado no site:**

- Headings: `Gilroy`, fallback `Lexend Variable`, `Inter Variable`, sans-serif.
- Corpo: `Inter Variable`, fallback de sistema.
- Line heights: tight `1.1`, snug `1.2`, normal `1.5`, relaxed `1.6`.
- Pesos visualmente predominantes: 400, 500, 600 e 700; títulos hero usam peso alto.

**Decisão proposta para o aplicativo:** licenciar/empacotar Gilroy apenas se os direitos permitirem. Caso contrário, usar Lexend para headings e Inter para corpo. Não sintetizar pesos ausentes.

### Hierarquia tipográfica Flutter

| Estilo | Tamanho | Peso | Altura de linha | Uso |
|---|---:|---:|---:|---|
| Display | 40 sp | 700 | 44 sp | Splash, conquista ou marco; uso raro. |
| H1 | 32 sp | 700 | 38 sp | Título principal da tela. |
| H2 | 24 sp | 700 | 30 sp | Seções e cards de destaque. |
| H3 | 20 sp | 600 | 26 sp | Blocos, módulos e modal. |
| Body large | 18 sp | 400 | 28 sp | Introduções e texto de aula. |
| Body | 16 sp | 400 | 24 sp | Conteúdo padrão. |
| Body small | 14 sp | 400/500 | 20 sp | Metadados e apoio. |
| Caption | 12 sp | 500 | 16 sp | Duração, status e labels curtos. |
| Button | 15 sp | 600 | 20 sp | CTAs; sentence case. |

Suportar escala de texto do sistema sem truncar conteúdo essencial. Limitar a uma linha somente metadados substituíveis; títulos devem aceitar duas ou mais linhas.

## Espaçamento e grid

**Observado no site:** escala de 4 px: `4, 8, 12, 16, 24, 32, 40, 96`.

**Decisão proposta para o aplicativo:** manter grid base de 4 dp e usar:

- `xs = 4`, `sm = 8`, `md = 12`, `lg = 16`, `xl = 24`, `2xl = 32`, `3xl = 40`, `section = 48` dp;
- margem horizontal: 16 dp em telefones compactos, 20 dp em telefones comuns, 24–32 dp em tablets;
- gap entre cards: 12 ou 16 dp;
- padding interno de cards: 16 dp; cards densos: 12 dp;
- largura máxima de leitura: 680 dp em tablet;
- breakpoints orientativos: compact `<600`, medium `600–839`, expanded `≥840` dp;
- respeitar SafeArea, teclado e orientação. Em medium/expanded, trocar BottomNavigationBar por NavigationRail e adotar duas colunas quando útil.

## Formas, bordas e elevação

### Border radius

**Observado no site:** `sm 6 px`, `md 8 px`, `lg 16 px`; botões também usam formato pill.

**Decisão proposta para o aplicativo:**

- small: 6 dp — badges e tooltips;
- medium: 8 dp — inputs e elementos internos;
- large: 16 dp — cards, sheets e modais;
- extra large: 24 dp — cards de destaque;
- pill: 999 dp — chips, filtros e botões compactos.

### Sombras

**Observado no site:** `0 2px 4px rgba(0,0,0,.02)` no claro e `.3` no escuro; dropdown `0 10px 15px -3px` com opacidade `.1`/`.5`. Há glows roxos em elementos promocionais.

**Decisão proposta para o aplicativo:**

- nível 0: sem sombra, borda de 1 dp;
- nível 1: `0 2 4 rgba(13,16,23,.08)` — cards;
- nível 2: `0 6 16 rgba(13,16,23,.12)` — menus e cards elevados;
- nível 3: `0 12 28 rgba(13,16,23,.18)` — modal/sheet;
- glow roxo: `0 8 24 rgba(98,67,233,.22)` somente para conquistas/CTA especial.

Em dark mode, preferir borda e diferença de superfície a sombras negras fortes.

### Bordas

- 1 dp sólida na cor `border` para cards e inputs.
- Foco: anel externo de 2 dp roxo com offset visual de 1 dp.
- Seleção: borda roxa e container roxo com 6–10% de opacidade.
- Erro: borda vermelha, ícone e mensagem de apoio persistente.

## Ícones

**Observado no site:** ícones lineares simples, checks e setas; o símbolo da marca é arredondado e amigável.

**Decisão proposta para o aplicativo:** usar Material Symbols Rounded, padrão 24 dp, stroke visual consistente. Navegação pode usar 24–28 dp; ícones decorativos, 32–48 dp. Estados selecionados usam variante preenchida; não misturar famílias de ícones. Toda ação apenas com ícone requer tooltip/semantic label.

## Ilustrações e imagens

**Observado no site:** fotografias corporativas, mockups de produto e composições tecnológicas com gradientes, brilho e profundidade. A paleta alterna grafite, roxo e verde.

**Decisão proposta para o aplicativo:** usar ilustrações vetoriais ou 3D leves com pessoas adultas, dispositivos, fluxos e formas abstratas. Evitar mascotes infantis. Aplicar fundos grafite, halos roxo/verde e geometria suave. Miniaturas de curso podem usar fotografia corporativa com overlay escuro e selo de categoria.

## Cards

- Fundo `surface`, raio 16 dp, borda de 1 dp e sombra nível 0–1.
- Hierarquia: imagem/ícone, título, metadados, progresso e ação.
- Cards tocáveis devem apresentar ripple Material, estado pressionado e foco.
- Card de destaque pode usar gradiente sutil roxo (máximo ~12% sobre superfície) ou faixa lateral roxa.
- Progresso concluído usa verde mais ícone check; bloqueio usa cadeado e neutralização, nunca opacidade abaixo do necessário para leitura.

## Botões

- Altura padrão 48 dp; grande 52–56 dp; área mínima de toque 48 dp.
- Primário: roxo sólido, texto de alto contraste, raio pill ou 12 dp; pressed em roxo escuro.
- Secundário: verde ou container roxo claro, conforme semântica; não competir com o CTA principal.
- Outlined: fundo transparente, borda neutra/roxa e texto roxo.
- Text button: ações terciárias.
- Ícone à esquerda com gap de 8 dp. Loading mantém largura e substitui conteúdo por spinner + label acessível.

## Inputs

**Decisão proposta para o aplicativo:** filled/outlined híbrido Material 3, altura mínima 52–56 dp, raio 8–12 dp, label persistente, texto 16 sp, padding horizontal 16 dp. Estados: default, hover (desktop), focused, filled, disabled, error e read-only. Campo de pesquisa usa ícone de lupa, botão limpar e teclado apropriado. Nunca usar placeholder como único label.

## Dark mode

**Observado no site:** há controle explícito de tema. O dark usa background aproximado `#0D1017`, surface `#171C26`, texto `#F0F1F4`, muted `#C3C6CC`, borda `#2B303B`, roxo mais claro e verde mais claro.

No app:

- manter conteúdo e hierarquia idênticos entre temas;
- evitar branco puro em grandes superfícies e preto puro no fundo;
- elevar superfícies por luminância/borda, não apenas sombra;
- reduzir intensidade de glows e overlays;
- permitir tema do sistema, claro e escuro no perfil;
- conferir contraste de vídeos, gráficos, badges e estados em ambos os temas.

## Movimento

**Observado no site:** transição rápida de `150 ms ease` e normal de `300 ms cubic-bezier(.4,0,.2,1)`.

**Decisão proposta para o aplicativo:** 150 ms para feedback local, 250–300 ms para mudança de estado/tela e 400–500 ms para conquista. Respeitar “reduzir movimento”. Gamificação deve usar animação curta, sem bloquear a tarefa.

## Flutter Design Tokens

Os nomes abaixo são uma proposta de arquitetura; não representam implementação Dart nesta etapa.

### AppColors

- Marca: `primary`, `primaryDark`, `primaryLight`, `secondary`, `brandPurple`, `brandGreen`, `brandGradient`.
- Superfícies: `background`, `surface`, `surfaceVariant`, `surfaceElevated`, `scrim`, com pares light/dark.
- Texto: `textPrimary`, `textSecondary`, `textDisabled`, `onPrimary`, `onSecondary`.
- Semânticas: `success`, `onSuccess`, `successContainer`, `error`, `errorContainer`, `warning`, `warningContainer`, `info`, `infoContainer`.
- Estrutura: `border`, `divider`, `focus`, `progressTrack`, `locked`.

### AppTypography

- Famílias: `headingFamily` (Gilroy/Lexend) e `bodyFamily` (Inter).
- Estilos: `display`, `h1`, `h2`, `h3`, `bodyLarge`, `body`, `bodySmall`, `caption`, `button`.
- Cada token reúne tamanho, peso, altura de linha e letter spacing; não codificar estilos ad hoc nos widgets.

### AppSpacing

- Escala: `xxs=2`, `xs=4`, `sm=8`, `md=12`, `lg=16`, `xl=24`, `xxl=32`, `xxxl=40`, `section=48` dp.
- Tokens semânticos: `screenHorizontal`, `cardPadding`, `sectionGap`, `listGap`, `inlineGap`, ajustáveis por breakpoint.

### AppRadius

- `small=6`, `medium=8`, `input=12`, `large=16`, `extraLarge=24`, `pill=999` dp.
- Preferir tokens semânticos (`card`, `button`, `sheet`) mapeados para a escala.

### AppShadows

- `none`, `card`, `menu`, `modal`, `brandGlow`.
- Cada tema pode fornecer valores próprios; dark usa menor opacidade de sombra e maior contraste de borda.

## Fontes da análise

- Página e composição visual: [NatyApp — página inicial em português](https://naty.app/pt/).
- Valores de cor, tipografia, espaçamento, raio, sombra e transição: folhas de estilo públicas carregadas pela página em 12/08/2026.
- Gradiente e cores do símbolo: SVG do logotipo embutido na mesma página.

