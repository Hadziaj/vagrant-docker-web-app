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

# Wejscie do wspoldzielonego folderu z VMka
echo "Wchodze do wspoldzielonego folderu i odpalam Dockera..."
vagrant ssh -c "cd /vagrant && docker-compose up -d"

# Print the application URL
echo "Web appka dziala i chodzi pod adresem: http://localhost:9090"