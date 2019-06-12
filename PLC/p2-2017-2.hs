module Main where
import Control.Concurrent
import Control.Concurrent.MVar
import Control.Concurrent.STM
import Control.Concurrent.STM.TVar
import System.IO
import Control.Monad
    
main :: IO ()
main = do
    sem <- atomically (newTVar True)
    atomically (p sem)
    value <- atomically (readTVar sem)
    putStr(show value)

type Semaforo = TVar Bool

p:: Semaforo -> STM()
p sem = do {
    b <- readTVar sem;
    if b
    then writeTVar sem False
    else retry
}

v:: Semaforo -> STM()
v sem = writeTVar sem True