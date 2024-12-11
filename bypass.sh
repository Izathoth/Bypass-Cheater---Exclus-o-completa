#!/bin/bash

# Definir os arquivos e diretórios a serem apagados
ARQUIVO_UM="teste.txt"
ARQUIVO_DOIS="logfile.log"
DIRETORIO_UM="pasta_temporal"
DIRETORIO_DOIS="backup_antigo"
REGISTRO_EXCLUSAO="/var/log/exclusao.log"

# Função para apagar arquivos
apagar_arquivo() {
    local arquivo=$1
    if [ -f "$arquivo" ]; then
        echo "Apagando o arquivo: $arquivo"
        rm -f "$arquivo"
        echo "Arquivo $arquivo apagado com sucesso."
    else
        echo "Arquivo $arquivo não encontrado."
    fi
}

# Função para apagar diretórios
apagar_diretorio() {
    local diretorio=$1
    if [ -d "$diretorio" ]; then
        echo "Apagando o diretório: $diretorio"
        rm -rf "$diretorio"
        echo "Diretório $diretorio apagado com sucesso."
    else
        echo "Diretório $diretorio não encontrado."
    fi
}

# Função para apagar registros de criação, exclusão e modificações
apagar_registros() {
    local arquivo_ou_diretorio=$1
    local registro=$(find /var/log -type f -name "$(basename "$arquivo_ou_diretorio")*.log")

    if [ -n "$registro" ]; then
        echo "Apagando o registro de criação, exclusão e modificações: $registro"
        rm -f "$registro"
        echo "Registro $registro apagado com sucesso."
    else
        echo "Registro de criação/exclusão/modificação para $arquivo_ou_diretorio não encontrado."
    fi
}

# Função para apagar registros no histórico do sistema (bash history)
apagar_historico() {
    local arquivo_ou_diretorio=$1
    local historico="/root/.bash_history"
    
    if grep -q "$arquivo_ou_diretorio" "$historico"; then
        echo "Apagando histórico de ações relacionadas a: $arquivo_ou_diretorio"
        sed -i "/$arquivo_ou_diretorio/d" "$historico"
        echo "Histórico apagado com sucesso."
    else
        echo "Nenhuma ação registrada no histórico para $arquivo_ou_diretorio."
    fi
}

# Função para apagar logs de download
apagar_log_download() {
    local arquivo_ou_diretorio=$1
    local log_download="/var/log/download.log"
    
    if grep -q "$arquivo_ou_diretorio" "$log_download"; then
        echo "Apagando o log de download para: $arquivo_ou_diretorio"
        sed -i "/$arquivo_ou_diretorio/d" "$log_download"
        echo "Log de download apagado com sucesso."
    else
        echo "Nenhuma entrada de download encontrada para $arquivo_ou_diretorio."
    fi
}

# Função para apagar o histórico de ações em comandos específicos
apagar_comandos() {
    local comando=$1
    local log_comandos="/var/log/syslog"
    
    if grep -q "$comando" "$log_comandos"; then
        echo "Apagando registros de execução do comando: $comando"
        sed -i "/$comando/d" "$log_comandos"
        echo "Comando $comando removido do histórico do sistema."
    else
        echo "Comando $comando não encontrado nos logs do sistema."
    fi
}

# Função para apagar arquivos temporários criados pelo sistema
apagar_temporarios() {
    echo "Limpando arquivos temporários do sistema..."
    rm -rf /tmp/*
    rm -rf /var/tmp/*
    echo "Arquivos temporários apagados."
}

# Função para remover arquivos de cache
apagar_cache() {
    echo "Limpando cache do sistema..."
    rm -rf /var/cache/*
    echo "Cache apagado."
}

# Função para apagar logs do sistema
apagar_logs_sistema() {
    echo "Limpando logs do sistema..."
    find /var/log -type f -name "*.log" -exec rm -f {} \;
    echo "Logs apagados."
}

# Função para apagar configurações relacionadas a arquivos e diretórios
apagar_configuracoes() {
    local arquivo_ou_diretorio=$1
    local configuracoes=$(find /etc -type f -name "$(basename "$arquivo_ou_diretorio")*.conf")
    
    if [ -n "$configuracoes" ]; then
        echo "Apagando configurações relacionadas a: $arquivo_ou_diretorio"
        rm -f $configuracoes
        echo "Configurações apagadas."
    else
        echo "Nenhuma configuração encontrada para $arquivo_ou_diretorio."
    fi
}

# Função principal para apagar arquivos, diretórios, registros e dados associados
apagar_todos_os_dados() {
    # Apagar os arquivos
    apagar_arquivo "$ARQUIVO_UM"
    apagar_arquivo "$ARQUIVO_DOIS"

    # Apagar diretórios
    apagar_diretorio "$DIRETORIO_UM"
    apagar_diretorio "$DIRETORIO_DOIS"

    # Apagar registros de criação, exclusão, modificações, downloads
    apagar_registros "$ARQUIVO_UM"
    apagar_registros "$ARQUIVO_DOIS"
    apagar_registros "$DIRETORIO_UM"
    apagar_registros "$DIRETORIO_DOIS"

    # Apagar histórico de ações no bash
    apagar_historico "$ARQUIVO_UM"
    apagar_historico "$ARQUIVO_DOIS"
    apagar_historico "$DIRETORIO_UM"
    apagar_historico "$DIRETORIO_DOIS"

    # Apagar logs de download
    apagar_log_download "$ARQUIVO_UM"
    apagar_log_download "$ARQUIVO_DOIS"
    apagar_log_download "$DIRETORIO_UM"
    apagar_log_download "$DIRETORIO_DOIS"

    # Apagar comandos executados
    apagar_comandos "$ARQUIVO_UM"
    apagar_comandos "$ARQUIVO_DOIS"
    apagar_comandos "$DIRETORIO_UM"
    apagar_comandos "$DIRETORIO_DOIS"

    # Apagar arquivos temporários e caches
    apagar_temporarios

    # Apagar logs do sistema
    apagar_logs_sistema

    # Apagar configurações relacionadas aos arquivos e diretórios
    apagar_configuracoes "$ARQUIVO_UM"
    apagar_configuracoes "$ARQUIVO_DOIS"
    apagar_configuracoes "$DIRETORIO_UM"
    apagar_configuracoes "$DIRETORIO_DOIS"
}

# Iniciar o processo de apagamento de dados
apagar_todos_os_dados

echo "Processo concluído."