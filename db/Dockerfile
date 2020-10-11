FROM mysql
EXPOSE 3306

RUN ["apt-get", "update"]
RUN ["apt-get", "install", "-y", "vim"]
RUN ["apt-get", "install", "-y", "sudo"]

CMD ["mysqld"]