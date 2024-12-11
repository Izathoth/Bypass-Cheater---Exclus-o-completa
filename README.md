# bypass.sh - Script de Limpeza de Arquivos, Diretórios e Logs

## Descrição
Este script foi criado para realizar a exclusão de arquivos, diretórios, registros, histórico de comandos, logs e caches no sistema Linux. Além disso, ele remove configurações associadas e limpa arquivos temporários.

## Uso
1. Certifique-se de que o script possui permissões de execução:
   ```bash
   chmod +x bypass.sh
   ```
2. Execute o script como superusuário:
   ```bash
   sudo ./bypass.sh
   ```

## Componentes do Script
- **ARQUIVO_UM**: Nome do primeiro arquivo a ser excluído.
- **ARQUIVO_DOIS**: Nome do segundo arquivo a ser excluído.
- **DIRETORIO_UM**: Nome do primeiro diretório a ser excluído.
- **DIRETORIO_DOIS**: Nome do segundo diretório a ser excluído.
- **REGISTRO_EXCLUSAO**: Arquivo de log onde são registradas as exclusões realizadas.

## Funções Principais
- `apagar_arquivo()`: Remove arquivos especificados.
- `apagar_diretorio()`: Remove diretórios especificados.
- `apagar_registros()`: Remove logs associados a arquivos/diretórios.
- `apagar_historico()`: Remove referências do histórico de comandos (bash).
- `apagar_log_download()`: Remove logs de download relacionados.
- `apagar_comandos()`: Remove logs de execução de comandos.
- `apagar_temporarios()`: Limpa arquivos temporários do sistema.
- `apagar_cache()`: Limpa cache do sistema.
- `apagar_logs_sistema()`: Remove logs de todo o sistema.
- `apagar_configuracoes()`: Remove configurações associadas a arquivos/diretórios.

## Como Modificar o Código
1. Para alterar os arquivos ou diretórios a serem excluídos, edite as variáveis no início do script:
   ```bash
   ARQUIVO_UM="novo_arquivo.txt"
   DIRETORIO_UM="novo_diretorio"
   ```
2. Para adicionar novas funções de limpeza, siga o formato das funções existentes e chame-as dentro da função principal `apagar_todos_os_dados()`.
3. Se quiser desativar uma função específica, comente sua chamada no final do script.

## Aviso
Este script é destrutivo. Use-o com cautela e apenas em sistemas onde a limpeza é realmente necessária.

## Licença
Este script é fornecido "como está", sem garantias de qualquer tipo. O uso é de total responsabilidade do usuário.
