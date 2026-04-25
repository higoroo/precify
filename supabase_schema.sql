-- PRECIFY — Supabase Schema
-- Cole no SQL Editor do Supabase e clique em Run

-- 1. Habilita autenticação por email no Supabase:
--    Authentication → Providers → Email → Enable
--    (Desmarque "Confirm email" para não precisar confirmar)

-- Tabela de anúncios ML
create table if not exists anuncios (
  id uuid default gen_random_uuid() primary key,
  user_id uuid references auth.users(id) on delete cascade not null,
  cod text default '', nome text not null,
  tipo text default 'classico',
  preco numeric(10,2) default 0, preco_d numeric(10,2) default 0,
  custo numeric(10,2) default 0, com numeric(5,2) default 11.5,
  ant numeric(5,2) default 4.2, frete numeric(10,2) default 0,
  aj_ml numeric(10,2) default 0,
  desc_pct numeric(5,2) default 5, desc_max numeric(10,2) default 10,
  imp numeric(5,2) default 10, obs text default '',
  tag_full boolean default false, tag_oferta boolean default false, tag_pub boolean default false,
  created_at timestamptz default now(), updated_at timestamptz default now()
);

-- Tabela de anúncios Shopee
create table if not exists anuncios_shopee (
  id uuid default gen_random_uuid() primary key,
  user_id uuid references auth.users(id) on delete cascade not null,
  cod text default '', nome text not null,
  status text default 'ativo',
  preco numeric(10,2) default 0, preco_d numeric(10,2) default 0,
  custo numeric(10,2) default 0, ant numeric(5,2) default 6,
  frete numeric(10,2) default 0, outros numeric(10,2) default 0,
  desc_pct numeric(5,2) default 5, desc_max numeric(10,2) default 10,
  imp numeric(5,2) default 10, obs text default '',
  created_at timestamptz default now(), updated_at timestamptz default now()
);

-- Tabela de histórico
create table if not exists historico (
  id uuid default gen_random_uuid() primary key,
  user_id uuid references auth.users(id) on delete cascade not null,
  msg text not null, created_at timestamptz default now()
);

-- Segurança (cada usuário vê só seus dados)
alter table anuncios         enable row level security;
alter table anuncios_shopee  enable row level security;
alter table historico        enable row level security;

create policy "own_anuncios"    on anuncios        for all using (auth.uid() = user_id);
create policy "own_shopee"      on anuncios_shopee for all using (auth.uid() = user_id);
create policy "own_historico"   on historico       for all using (auth.uid() = user_id);

-- Auto-atualiza updated_at
create or replace function _upd_at() returns trigger language plpgsql as $$
begin new.updated_at = now(); return new; end; $$;

create trigger t_anuncios    before update on anuncios        for each row execute function _upd_at();
create trigger t_shopee      before update on anuncios_shopee for each row execute function _upd_at();

-- IMPORTANTE: No Supabase, vá em:
-- Authentication → Settings → desmarque "Enable email confirmations"
-- Isso permite que o app crie a conta automaticamente sem precisar confirmar email
