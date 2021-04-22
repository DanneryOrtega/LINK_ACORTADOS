from flask import render_template, request, redirect, url_for, flash, session
from src import app
from flask_mail import Mail, Message
from src.models.users import UsersModel
from hashlib import md5
from src.config.send import mail
app.secret_key ='CBZEkZPmgsPdrA3sVEb2PLu1p'

@app.route('/user/checkIn', methods=['GET','POST'])
def checkIn():
    if request.method == 'GET':
        return render_template('user/check_in.html')

    name = request.form.get('name')
    email = request.form.get('email')
    password = request.form.get('password')
    #print(name, email, password)

    usersModel = UsersModel()
    password=md5(password.encode("utf-8")).hexdigest()
    
    
    user = usersModel.consultCheckIn(email)
    if user is not None:
        flash('Ya existe un usuario registrado con ese correo', 'danger') 
        return redirect(request.url)

    with app.app_context():
        msg = Message(subject="Hola",
                      sender=app.config.get("MAIL_USERNAME"),
                      recipients=[email], # replace with your email for testing
                      html=f"<a href='http://127.0.0.1:5000/confirmacion/{email}'>¡Confirma Aquí!</a>")
        mail.send(msg)

    usersModel.save(name, email, password)
    flash('Registrado correctamente...','success')
    return redirect(url_for('login'))


@app.route('/user/login', methods=['GET','POST'])
def login():
    if request.method == 'GET':
        return render_template('user/login.html')

    email = request.form.get('email')
    password = request.form.get('password')
    password=md5(password.encode("utf-8")).hexdigest()
   # print(email, password)
    usersModel = UsersModel()
    user = usersModel.consultlogin(email, password)

    print(user)
    if user == None:
        flash('Usuario o contraseña incorrecta...','danger')
        return redirect(request.url)
    usersmodel=UsersModel()
    users = usersmodel.consultCheckIn(email)
    session['user']=users
    flash('Ingreso correcto','success')
    return redirect(url_for('index'))

@app.route('/user/sacar_registro', methods=['GET','POST'])
def sacar_registro():
    Usersmodel=UsersModel()
    usu = Usersmodel.sacar_registro(session['user'][0])
    print(usu)
    if request.method == 'GET':
        return render_template('user/lista.html',registros=usu)

@app.route('/user/eliminar/<id>', methods=['GET','POST'])
def eliminar(id):
    Usersmodel=UsersModel()
    Usersmodel.eliminar_registro(id)
    return redirect(url_for('sacar_registro'))

@app.route('/user/editar/<id>', methods=['GET','POST'])
def editar(id):

    if request.method == 'GET':
        Usersmodel=UsersModel()
        link=Usersmodel.sacar_link(id)
        return render_template('user/editar.html',url=link, id=id)
   
    Usersmodel=UsersModel()
    url = request.form.get('url')
    Usersmodel.editar_registro(url, id)

    return redirect(url_for('sacar_registro'))



