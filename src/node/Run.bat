@echo off
:restart
cls
idena-node --profile=lowpower --apikey=mynode --datadir node --rpcaddr localhost --rpcport 9993
goto restart