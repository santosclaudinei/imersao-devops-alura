# Etapa 1: Usar uma imagem base oficial do Python
# Usar a versão 'slim' ajuda a manter a imagem final menor
FROM python:3.11-slim

# Etapa 2: Definir o diretório de trabalho dentro do contêiner
WORKDIR /app

# Etapa 3: Copiar o arquivo de dependências
# Isso é feito separadamente para aproveitar o cache do Docker.
# Se o requirements.txt não mudar, o Docker não reinstalará as dependências.
COPY requirements.txt .

# Etapa 4: Instalar as dependências
RUN pip install --no-cache-dir -r requirements.txt

# Etapa 5: Copiar o restante do código da aplicação
COPY . .

# Etapa 6: Expor a porta em que a aplicação será executada
EXPOSE 8000

# Etapa 7: Comando para iniciar a aplicação usando Uvicorn
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]