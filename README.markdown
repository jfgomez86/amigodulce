Amigo Dulce
===========

Como Jugar
-----------

1. Crear archivo people.yml
2. Correr `ruby scrabbler.rb`

  Esto generara dos archivos:

             mails.yml # Contiene un array de hashes con los mails a enviar
             result.txt # Contiene los resultados del juego

3. Montar aplicacion en heroku

4. Modificar el cuerpo del correo en `mailer.rb`

5. Correr `ruby mailer.rb` usando application specific password
   (https://support.google.com/accounts/answer/185833?hl=en)


Ejemplo de people.yml:

    ---
    - name: "John Doe"
      email: john@does.com
    - name: "Jane Doe"
      email: jane@does.com

--

Jose F. Gomez

