#!/bin/bash

cd /home/ubuntu/oke-free

source .env

DATETIME=$(date +%F\ %H:%M:%S)

echo "[${DATETIME}] - Iniciando Execução"

if /snap/bin/tofu apply -auto-approve >/tmp/lastrun.log 2>&1 ; then
    DATETIME=$(date +%F\ %H:%M:%S)
        cat <__EOF__
Olá, Mestre

Seu cluster OKE foi criado com sucesso em $DATETIME.

Verifique a execução do ToFu e o cluster.

Que a Força esteja com você. Vida longa e próspera
__EOF__ | mutt -s "[${DATETIME}] - Aviso de criação de cluster OKE" "mrbits@mrbits.com.br"
    exit 0
else
    DATETIME=$(date +%F\ %H:%M:%S)
    echo "[$DATETIME] - Ainda nao temos VMs disponiveis"
    exit 1
fi

DATETIME=$(date +%F\ %H:%M:%S)
echo "[${DATETIME}] - Final de execução"
