type Pessoa = String
type Livro = String
type BancoDados = [(Pessoa, Livro)]

baseExemplo :: BancoDados

baseExemplo = [("Sergio", "O Senhor dos Aneis"), 
    ("Andre", "Duna"),
    ("Fernando", "Jonathan Strange & Mr. Norrell" ),
    ("Fernando" , "Duna" )]

livros :: BancoDados -> Pessoa -> [Livro]
livros [] _ = []
livros (db:dbs) person
 | fst(db) == person = snd(db):livros dbs person
 | otherwise = livros dbs person

emprestimos :: BancoDados -> Livro -> [Pessoa]
emprestimos [] _ = []
emprestimos (db:dbs) book
 | snd(db) == book = fst(db):emprestimos dbs book
 | otherwise = emprestimos dbs book

emprestado :: BancoDados -> Livro -> Bool
emprestado [] _ = False
emprestado (db:dbs) book
 | snd(db) == book = True
 | otherwise = emprestado dbs book

qtdEmprestimos :: BancoDados -> Pessoa -> Int
qtdEmprestimos [] _ = 0
qtdEmprestimos (db:dbs) person
 | fst db == person = 1 + qtdEmprestimos dbs person
 | otherwise = qtdEmprestimos dbs person