#!/bin/bash

# Koniec od razu jeśli jakakolwiek komenda sie nie uda
set -e

# Start vmki
echo "Startuje Vagrant VM..."
vagrant up

# Instaluje 
echo "Sprawdzam czy Docker jest zainstalowany..."
vagrant ssh -c "if ! docker --version &>/dev/null; then
    echo 'Instaluje Dockera...';
    sudo apt-get update &&
    sudo apt-get install -y docker.io docker-compose;
else
    echo 'Docker jest juz zainstalowany.';
fi"

#fix malego problemu, pewnie jest sposob na mniej security nightmare rozwiazanie, ale go nie znam w tym momencie
echo "Ustawiam uprawnienia dla Dockera" 
vagrant ssh -c "sudo chmod 666 /var/run/docker.sock"

# Wejscie do wspoldzielonego folderu z VMka
echo "Wchodze do wspoldzielonego folderu i odpalam Dockera..."
vagrant ssh -c "cd /vagrant && docker-compose up -d"

# Podaje link do web appki
echo "Web appka dziala i chodzi pod adresem: http://localhost:9090"
