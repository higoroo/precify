-- PRECIFY — Supabase Schema v2
-- Cole no SQL Editor do Supabase e clique em Run

create table if not exists anuncios (
  id uuid default gen_random_uuid() primary key,
  user_id uuid references auth.users(id) on delete cascade not null,
  plataforma text default 'ml' check (plataforma in ('ml','shopee')),
  cod text default '', nome text not null,
  tipo text default 'classico',
  status text default 'ativo',
  preco numeric(10,2) default 0, preco_d numeric(10,2) default 0,
  custo numeric(10,2) default 0, com numeric(5,2) default 11.5,
  ant numeric(5,2) default 4.2, frete numeric(10,2) default 0,
  aj_ml numeric(10,2) default 0, outros numeric(10,2) default 0,
  desc_pct numeric(5,2) default 5, desc_max numeric(10,2) default 10,
  imp numeric(5,2) default 10, obs text default '',
  tag_full boolean default false, tag_oferta boolean default false, tag_pub boolean default false,
  created_at timestamptz default now(), updated_at timestamptz default now()
);

create table if not exists historico (
  id uuid default gen_random_uuid() primary key,
  user_id uuid references auth.users(id) on delete cascade not null,
  msg text not null, created_at timestamptz default now()
);

alter table anuncios enable row level security;
alter table historico enable row level security;
create policy "usuario_anuncios" on anuncios for all using (auth.uid() = user_id);
create policy "usuario_historico" on historico for all using (auth.uid() = user_id);

create or replace function _set_updated_at() returns trigger language plpgsql as $$
begin new.updated_at = now(); return new; end; $$;
create trigger anuncios_updated before update on anuncios
  for each row execute function _set_updated_at();
