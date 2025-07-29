# 📦 Backend AEE – Configuração

Este documento orienta a instalação e configuração do backend do projeto AEE, incluindo o banco de dados PostgreSQL, dependências do Node.js, e execução da API.

---

## ✅ 1. Pré-requisitos

- Node.js (≥ 22.17.0)
- npm
- PostgreSQL (≥ 16.9)
- Git

---

## 🚀 2. Clonar o repositório e acessar a branch de desenvolvimento

```bash
git clone "https://github.com/Gerson-Santiago/aee.git"
cd /aee
git switch dev
````

---

## 📦 3. Instalar dependências

```bash
cd backend
npm install prisma --save-dev
npm install @prisma/client
```

---

## 🧱 4. Inicializar o Prisma

```bash
npx prisma init
```

Isso criará os arquivos:

* `prisma/schema.prisma`
* `.env`

Em seguida, configure sua variável de ambiente com a URL de conexão:

```env
DATABASE_URL="postgresql://postgres@localhost:5432/aee_db"
```

> ⚠️ Confirme que o banco `aee_db` e o usuário `postgres` existem no seu PostgreSQL.

---

## 🧩 5. Definir modelos no schema do Prisma

Edite o arquivo `prisma/schema.prisma` e defina seus modelos.

Após salvar:

```bash
npx prisma generate
```

---

## 🧪 6. Executar migrações

```bash
npx prisma migrate dev --name init
```

Isso criará as tabelas com base nos modelos definidos.

---

## 🧪 7. Testar a API

```bash
npm run dev
```

A API estará disponível em:

```
http://localhost:3000
```

---

## 🐘 8. Configurar o PostgreSQL

### 🔹 Iniciar o serviço:

```bash
cd ~
sudo service postgresql start
```

### 🔹 Criar o banco de dados:

```bash
cd ~
sudo -u postgres psql -c "CREATE DATABASE aee_db;"
```

### 🔹 Verificar o banco criado:

```bash
cd ~
sudo -u postgres psql -c "\l"
```

> Confirme que `aee_db` aparece na lista.

---

### 🔹 Criar um usuário com senha segura e dar permissões:

```bash
cd ~
sudo -u postgres psql -c "CREATE ROLE aee_user WITH LOGIN PASSWORD 'SENHA_SEGURA';"
sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE aee_db TO aee_user;"
```

> Substitua `SENHA_SEGURA` por uma senha forte.

### 🔹 Verificar as roles:

```bash
sudo -u postgres psql -c "\du"
```

### 🔹 Atualize o arquivo `.env` do backend:

```env
DATABASE_URL="postgresql://aee_user:SENHA_SEGURA@localhost:5432/aee_db"
```

---

## 📂 9. Organizar os arquivos CSV

Renomear os arquivos CSV para remover o sufixo `_headers.csv`:

```bash
cd aee/csv
for f in *_headers.csv; do mv "$f" "${f/_headers.csv/.csv}"; done
```

---

## 📤 10. Popular banco com dados do CSV

### 🔹 Acesse o banco via terminal:

```bash
cd ~/aee/backend
sudo -u postgres psql -d aee_db
```

### 🔹 Dentro do psql, use o caminho absoluto e execute o script:
aee_db#

```sql
\i '/aee/baseline.sql'
```

> 💡 O arquivo `baseline.sql` deve conter os comandos `CREATE TABLE` e `\copy` com caminho correto para os CSVs.

---

## ✅ Pronto!

O backend está configurado, conectado ao banco e pronto para servir o frontend.