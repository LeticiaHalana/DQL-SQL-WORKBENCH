# 📚 Material de Aula: Introdução ao SQL — DQL

Bem-vindos! Este material contém os conceitos e comandos práticos e básicos para introdução ao DQL.

---

## 📋 Passo a Passo Didático

### 🟢 ETAPA 1: O Básico da Projeção (`SELECT`, `*` e `AS`)

**🎯 Objetivo:** Aprender a buscar dados em tabelas do banco de dados e personalizar o nome das colunas na exibição do relatório.

---

#### 🔹 1.1 Buscar tudo de uma tabela

O comando `SELECT *` é utilizado para retornar **todas as colunas** de uma determinada tabela.

**Sintaxe / Exemplo:**
```sql
SELECT * 
FROM produtos;
```
> 💬 **Explicação:**
> *"O asterisco (`*`) significa 'todas as colunas'. É ótimo para testar, mas em sistemas reais evitamos usar em telas com milhões de registros para não travar a aplicação."*

---

#### 🔹 Comando 1.2: Selecionar colunas específicas e usar Apelidos (`AS`)

Quando queremos selecionar apenas os campos necessários e customizar o cabeçalho exibido na resposta da consulta, utilizamos a cláusula `AS`.

```sql
SELECT 
    nome AS Produto, preco AS 'Preço Unitário'
FROM produtos;
```

> 💬 **Explicação:**
> *"Com o `AS`, criamos um 'apelido' para a coluna apenas na exibição do relatório. Reparem que se o apelido tiver espaço, colocamos entre crases ou aspas."*

---

### 🟡 ETAPA 2: Filtrando Linhas com Condições (`WHERE`)

**🎯 Objetivo:** Mostrar como extrair apenas os registros necessários do banco de dados.

#### 🔹 Comando 2.1: Filtro Numérico Simples

Utilizamos a cláusula `WHERE` para restringir o resultado da consulta com base em uma ou mais condições.

```sql
SELECT *
FROM produtos 
WHERE preco > 500.00;
```

> 💬 **Explicação:**
> *"O `WHERE` age como uma peneira: ele analisa linha por linha. Só passa para o relatório o registro cuja condição for VERDADEIRA."*

##### 📊 Operadores de Comparação

| Operador | Significado | Exemplo |
| :--- | :--- | :--- |
| `=` | Igual a | `WHERE categoria_id = 1` |
| `<>` ou `!=` | Diferente de | `WHERE status != 'Inativo'` |
| `>` | Maior que | `WHERE preco > 50.00` |
| `<` | Menor que | `WHERE estoque < 10` |
| `>=` | Maior ou igual a | `WHERE idade >= 18` |
| `<=` | Menor ou igual a | `WHERE desconto <= 0.15` |

#### 🔹 Comando 2.2: Filtro com Múltiplas Condições (`AND` / `OR`)

Podemos combinar mais de uma condição usando os operadores lógicos `AND` (E) e `OR` (OU).

```sql
-- Exemplo AND (Ambas as condições precisam ser verdadeiras)
SELECT * FROM produtos 
WHERE preco < 1000.00 AND estoque > 0;

-- Exemplo OR (Pelo menos uma condição precisa ser verdadeira)
SELECT * FROM produtos 
WHERE estoque = 0 OR id_categoria = 3;
```

> 💬 **Explicação:**
> *"No `AND`, o produto precisa ser barato E estar em estoque ao mesmo tempo. No `OR`, se ele atender a qualquer uma das duas regras, ele já aparece."*

##### 🧩 Operadores Lógicos

| Operador | Regra |
| :--- | :--- |
| `AND` | Retorna o registro apenas se **todas** as condições forem verdadeiras. |
| `OR` | Retorna o registro se **pelo menos uma** das condições for verdadeira. |
| `NOT` | Inverte o sentido do filtro (negação). |

---

### 🔵 ETAPA 3: Filtros Especiais (`BETWEEN`, `IN`, `LIKE`, `IS NULL`)

**🎯 Objetivo:** Conhecer e aplicar operadores avançados de busca.

#### 🔹 Comando 3.1: Intervalo de Valores (`BETWEEN`)

O operador `BETWEEN` facilita a busca dentro de um intervalo de valores numéricos, datas ou textos.

```sql
SELECT nome, preco FROM produtos 
WHERE preco BETWEEN 100.00 AND 1500.00;
```

> 💬 **Explicação:**
> *"O `BETWEEN` substitui `preco >= 100 AND preco <= 1500`. Ele inclui os valores das pontas!"*

#### 🔹 Comando 3.2: Lista de Opções (`IN`)

Para verificar se o valor de uma coluna está contido em uma lista específica de opções, usamos o `IN`.

```sql
SELECT * FROM produtos 
WHERE id_categoria IN (1, 3);
```

> 💬 **Explicação:**
> *"O `IN` funciona como múltiplos `OR`. Aqui estamos buscando produtos que pertençam à Categoria 1, 3 ou 5."*

#### 🔹 Comando 3.3: Busca por Texto Parcial (`LIKE` e `%`)

Quando não sabemos o texto exato ou queremos pesquisar por padrões (como palavras contidas em um texto), usamos o `LIKE` com o caractere coringa `%`.

```sql
-- Busca qualquer produto que contenha a palavra 'Gamer' no nome
SELECT * FROM produtos 
WHERE nome LIKE '%Gamer%';
```

> 💬 **Explicação:**
> *"O símbolo `%` é o coringa. `%Gamer%` significa: não me importa o que vem antes nem o que vem depois, contanto que tenha 'Gamer' no meio."*

##### 🔤 Padrões com `%`:
* `'Gamer%'`: Começa com "Gamer".
* `'%Gamer'`: Termina com "Gamer".
* `'%Gamer%'`: Contém "Gamer" em qualquer posição.

#### 🔹 Comando 3.4: Tratamento de Valores Ausentes (`IS NULL` / `IS NOT NULL`)

Para verificar se um campo não possui valor preenchido (nulo), usamos `IS NULL`.

```sql
SELECT * FROM produtos 
WHERE id_categoria IS NULL;
```

> 💬 **Explicação:**
> *"Nunca usem `= NULL`. O valor Nulo é a ausência de dado, por isso usamos a sintaxe correta `IS NULL` ou `IS NOT NULL`."*

---

## 📌 Guia Rápido dos Operadores Especiais

| Operador | Finalidade | Exemplo |
| :--- | :--- | :--- |
| `BETWEEN x AND y` | Filtra dentro de um intervalo inclusivo | `WHERE idade BETWEEN 18 AND 30` |
| `IN (v1, v2)` | Compara com uma lista de valores | `WHERE estado IN ('SP', 'RJ', 'MG')` |
| `LIKE '%texto%'` | Busca por padrão/texto parcial | `WHERE email LIKE '%@gmail.com'` |
| `IS NULL` | Identifica valores ausentes/vazios | `WHERE observacao IS NULL` |
| `IS NOT NULL` | Identifica valores devidamente preenchidos | `WHERE observacao IS NOT NULL` |

## ✏️ EXERCÍCIOS PRÁTICOS
Acesse o script sql nos arquivos e cole no sql workbench.
Escreva as consultas SQL utilizando os conceitos de projeção, aliases, filtros com operadores de comparação, operadores lógicos, `BETWEEN`, `IN`, `LIKE`, `IS NULL` e `IS NOT NULL`:

1. **Projeção e Apelidos:** Selecione o `titulo` e o `preco_diaria` da tabela `filmes`, exibindo os cabeçalhos das colunas como **Nome do Filme** e **Valor da Diária**.
2. **Filtro de Igualdade:** Exiba todos os dados dos clientes que moram na cidade de `'São Paulo'`.
3. **Filtro Numérico de Comparação:** Selecione os filmes cujo preço da diária seja maior que **R$ 8,00**.
4. **Operador Lógico AND:** Liste os filmes lançados a partir do ano **2000** que possuem o preço da diária menor ou igual a **R$ 10,00**.
5. **Operador Lógico OR:** Liste todos os filmes do gênero `'Sci-Fi'` ou do gênero `'Animação'`.
6. **Intervalo (BETWEEN):** Selecione os filmes lançados entre os anos **1990** e **2005** (inclusive).
7. **Lista de Opções (IN):** Exiba os dados dos clientes que residem nas cidades de `'Campinas'`, `'Santos'` ou `'Curitiba'`.
8. **Busca Parcial por Texto (LIKE):** Liste todos os filmes cujo título contenha a palavra `'Senhor'` em qualquer posição.
9. **Identificação de Valores Ausentes (IS NULL):** Selecione todas as locações que ainda não foram devolvidas (`data_devolucao_real` é nula).
10. **Identificação de Valores Preenchidos (IS NOT NULL):** Selecione os clientes que possuem e-mail cadastrado no sistema.

---

🚀 *Aproveite o material e bons estudos!*
