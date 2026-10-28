-- Rode este arquivo no Supabase: SQL Editor > New query > Run
create table if not exists docs (
  col  text not null,
  id   text not null,
  data jsonb not null default '{}'::jsonb,
  primary key (col, id)
);
alter table docs enable row level security;
-- Só quem está logado consegue ler e gravar
create policy "somente logado" on docs for all to authenticated using (true) with check (true);
-- Atualização em tempo real entre aparelhos
alter publication supabase_realtime add table docs;
