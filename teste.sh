#!/bin/bash
echo “Qual o nome do pacote que voce quer instalar?”
read nome_pacote;
pacman -S $nome_pacote
