# Usando uma imagem base estável e leve
FROM mcr.microsoft.com/devcontainers/base:bullseye

# Evita prompts interativos durante a instalação
ENV DEBIAN_FRONTEND=noninteractive

# Instalação de ferramentas essenciais de DevOps e Segurança
RUN apt-get update && apt-get install -y \
    curl \
    git \
    vim \
    wget \
    htop \
    jq \
    build-essential \
    iputils-ping \
    net-tools \
    dnsutils \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/*

# Instalação do Node.js (Versão LTS)
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

# Instalação do Python (Versão 3) e Pip
RUN apt-get install -y python3 python3-pip && \
    ln -s /usr/bin/python3 /usr/bin/python

# Configuração de usuário e permissões (evitar problemas de root)
USER vscode
