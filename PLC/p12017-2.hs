--Questão 2

filtrarEInserir :: [[Int]] -> Int -> ([[Int]], Int)
filtrarEInserir (a b) = (impares a, (maiorSoma impares a) *  b)

impares :: [[Int]] -> [[Int]]
impares [] = []
impares (a:as) = [x | x <- a, somaImpares a > somaPar a] ++ impares as

somaImpares :: [Int] -> Int
somaImpares [] = 0
somaImpares (a:as)
    | mod a 2 == 1 = a + somaImpares as
    | otherwise = somaImpares as

somaPar :: [Int] -> Int
somaPar [] = 0
somaPar (a:as)
    | mod a 2 == 0 = 0 + somaPar as
    | otherwise = somaPar as


maiorSoma :: [[Int]] -> Int
maiorSoma [] = 0
maiorSoma a:as
    | somaImpares a > maiorSoma as = somaImpares a
    | 
--Questão 5

data Mobile = Pendente Int | Barra Mobile Mobile

peso :: Mobile -> Int

peso (Pendente n) = n
peso (Barra m n) = peso m + peso n

balanceado :: Mobile -> Bool

balanceado (Pendente _) = True
balanceado (Barra m n) = (peso m == peso n) && (balanceado m && balanceado n)