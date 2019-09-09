Amigo Dulce
===========

Como Jugar
-----------

1. Crear archivo people.yml
2. Correr `ruby scrabbler.rb`

  Esto generara dos archivos:

             mails.yml # Contiene un array de hashes con los mails a enviar (No se versiona)
             result.txt # Contiene los resultados del juego (Se debe versionar)

3. Modificar el cuerpo del correo en `mailer.rb` y subir los cambios

4. Montar aplicacion en heroku, incluyendo el nuevo result.txt

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

