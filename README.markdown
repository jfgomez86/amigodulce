Amigo Dulce
===========

Como Jugar
-----------

1. Crear archivo people.yml con el siguiente formato:

    ---
    - name: "John Doe"
      email: john@does.com
    - name: "Jane Doe"
      email: jane@does.com

2. Correr el siguiente scripts:

    ruby scrabbler.rb

  Esto generara dos archivos:

    mails.yml # Contiene un array de hashes con los mails a enviar
    result.txt # Contiene los resultados del juego

3. Montar aplicacion en heroku

4. Correr el siguiente script

    ruby mailer.rb

--

Jose F. Gomez
