# define imagem base
FROM alpine:latest

# atualiza sistema de pacotes
RUN apk update && apk add --update py-pip

# instala python e pip 
RUN apk add --update py-pip 

# instala módulos python necessários pela aplicação python
RUN apk add py3-django

# copia arquivos necessários para a aplicação rodar 
COPY . /usr/src/app

# define o diretório de trabalho da aplicação
WORKDIR /usr/src/app

# roda rotina de criação do banco de dados
RUN python manage.py migrate

# informa a porta que o container deve expor
EXPOSE 8000

# roda a aplicação
CMD ["python","manage.py","runserver","0.0.0.0:8000"]

