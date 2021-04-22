from src.config.db import DB

class UsersModel():
    def save(self, name, email, password):
        
        cursor= DB.cursor()

        cursor.execute('insert into users(name, email, password) values(?,?,?)',(name, email, password,))
        cursor.close()

    def consultCheckIn(self, email):
        cursor = DB.cursor()
        cursor.execute('select * from users where email = ?',(email,))
        user = cursor.fetchone()
       
        return user


    def consultlogin(self, email, password):
        cursor = DB.cursor()
        cursor.execute('select * from users where email = ? and password = ?',(email, password,))
        user = cursor.fetchone()
        cursor.close()

        return user

    def confirmar_email(self, email):
        cursor = DB.cursor()
        cursor.execute('UPDATE users SET confirmacion = 1 WHERE email = ?', (email,))
        cursor.close()

    def sacar_registro(self,user_id):
        
        cursor = DB.cursor()
        cursor.execute('select * from url where usuario_id = ?',(user_id,))
        user = cursor.fetchall()
        cursor.close()
        print(user)
        return user
    
    def guardar_reg_user(self, url, urlRecortada, user_id):
        
        cursor= DB.cursor()
        cursor.execute('insert into url(url, url_recortada, usuario_id) values(?,?,?)',(url,urlRecortada,user_id,))
        cursor.close()

    def eliminar_registro(self, id):
        cursor= DB.cursor()
        cursor.execute('DELETE FROM url WHERE id=?', (id,))
        cursor.close()

    def editar_registro(self, url, id):
        cursor = DB.cursor()
        cursor.execute('UPDATE url SET url=? WHERE id = ?', (url, id,))
        cursor.close()

    def sacar_link(self, id):
        cursor = DB.cursor()
        cursor.execute('select url from url where id = ?',(id,))
        user = cursor.fetchone()
        user=user[0]
        cursor.close()
        return user        
