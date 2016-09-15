cls
echo off
cls
REM -
REM - 100SECURITY
REM - 
REM - Criado por: Marcos Henrique
REM - Site: www.100security.com.br
REM -
REM - VARIAVEIS
set ORIGEM=C:\100SECURITY\pasta01
set DESTINO="C:\100SECURITY\pasta 02"
set LOG=C:\100SECURITY\backup\LOG
set EMAIL=marcos@100security.com.br
REM - ESTRUTURA
echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
echo #         COPIA DE ARQUIVOS E/OU DIRETORIOS         #
echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
xcopy %ORIGEM% %DESTINO% /E /Y /C /H
REM /E - Copia diretórios e subdiretórios, inclusive os vazios.
REM /Y - Suprime o prompt para você confirmar se deseja substituir um arquivo de destino existente.
REM /C - Continua copiando, mesmo que ocorram erros.
REM /H - Copia arquivos ocultos e do sistema também.
echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
echo # GERANDO LOG DE ARQUIVOS E/OU DIRETORIOS COPIADOS  #
echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
dir /s %DESTINO% > %LOG%\Arquivos.txt
echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
echo #          ENVIANDO E-MAIL COM LOG EM ANEXO         #
echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
blat.exe -attach "C:\100SECURITY\backup\LOG\Arquivos.txt" -p configsmtp -to %EMAIL% -subject BACKUP -body "O backup foi realizado com sucesso!" -server 192.168.1.200:25 -f %EMAIL%