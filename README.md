# Precify

Ferramenta de precificação para anúncios do Mercado Livre.  
Acesse de qualquer celular ou computador — sem instalar nada.

---

## Subir no GitHub e publicar online (20 minutos)

### Passo 1 — Criar conta no Supabase (banco de dados)

> Só precisa se quiser sincronizar dados entre dispositivos. Para uso em um único navegador, o app já funciona sem Supabase — os dados ficam salvos localmente.

1. Acesse **supabase.com** → criar conta gratuita
2. Clique em **New project** → dê um nome → aguarde inicializar (~2 min)
3. No menu lateral: **SQL Editor → New query**
4. Cole o conteúdo de `supabase_schema.sql` → clique em **Run**
5. Vá em **Settings → API** e copie:
   - **Project URL** → `https://xyzxyz.supabase.co`
   - **anon public** key → chave longa começando com `eyJ...`

### Passo 2 — Criar repositório no GitHub

1. Acesse **github.com** → **New repository**
2. Nome: `precify` → marque **Public** → **Create repository**
3. Na tela do repositório: clique em **"uploading an existing file"**
4. Arraste **`index.html`** e **`README.md`** para a área de upload
5. Clique em **Commit changes**

### Passo 3 — Ativar GitHub Pages (seu link público gratuito)

1. No repositório → **Settings** → **Pages** (menu lateral)
2. Em "Branch": selecione **main** → clique em **Save**
3. Aguarde 1-2 minutos

Seu link ficará:
```
https://SEU_USUARIO.github.io/precify
```

---

## Adicionar na tela inicial do celular

**iPhone (Safari):**  
Compartilhar → Adicionar à Tela de Início

**Android (Chrome):**  
Menu (⋮) → Adicionar à tela inicial

---

## Funcionalidades

| | |
|---|---|
| **Painel** | Alertas inteligentes, métricas, melhores/piores margens, lembretes |
| **Anúncios** | Tabela completa, filtros, sugestão de preço para margem ruim |
| **Simulador** | Estimativa de frete automática, sugestões de preço, comparativo Clássico vs Premium |
| **Insights** | Análise por linha, campanha (Full/Oferta/Pub), Clássico vs Premium |
| **Histórico** | Log de todas as alterações com data/hora |
| **Tags** | Full ML · Oferta relâmpago · Publicidade (por anúncio) |

---

## Estrutura do projeto

```
precify/
├── index.html        ← app completo (tudo em um arquivo)
├── supabase_schema.sql  ← schema do banco (opcional)
└── README.md
```
