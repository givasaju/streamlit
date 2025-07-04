# Use uma imagem base oficial do Python.
# python:3.10-slim é uma boa escolha por ser leve.
FROM python:3.10-slim

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copia o arquivo de dependências para o diretório de trabalho
# Copiamos este arquivo primeiro para aproveitar o cache de camadas do Docker.
# As dependências só serão reinstaladas se o requirements.txt mudar.
COPY requirements.txt ./

# Instala as dependências do projeto
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante do código da aplicação para o diretório de trabalho
COPY . .

# Expõe a porta padrão que o Streamlit utiliza
EXPOSE 8501

# Define o comando para executar a aplicação quando o contêiner iniciar.
# **Atenção:** Assumindo que seu arquivo principal se chama `app.py`.
# Se tiver outro nome (ex: `main.py`), altere-o aqui.
CMD ["streamlit", "run", "appst.py"]