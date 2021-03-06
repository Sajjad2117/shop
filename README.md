# Online Shop
A simple django ecommerce project 

## Tools:
![python](https://img.shields.io/badge/Python-3-brightgreen)
![Django](https://img.shields.io/badge/Django-3.2.7-brightgreen)
![PostgreSQL](https://img.shields.io/badge/Data%20Base-PostgreSQL%20-orange)
![HTML](https://img.shields.io/badge/Front--End-HTML5%20-blue)
![CSS](https://img.shields.io/badge/CSS-%20%203-brightgreen)
![JavaScript](https://img.shields.io/badge/JavaScript-%20-blue)
![Bootstrap](https://img.shields.io/badge/Bootstrap-%205-red)
![jQuery](https://img.shields.io/badge/jQuery-%20-brightgreen)
![AJAX](https://img.shields.io/badge/AJAX-%20%20-yellow)

![Tokan](media/shop.gif)

## How to Run?

#### 1- Clone the repository:
```bash
$ git clone https://github.com/Sajjad2117/shop.git
$ cd shop
```
#### 2- Create a virtualenv and activate it:

* Windows:
```bash
py -3 -m venv venv
venv\Scripts\activate
```
* Linux:
```bash
$ python3 -m venv venv
$ . venv/bin/activate
```
#### 3- In settings.py set up the your database:
```bash
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'shop',
        'USER': 'postgres',
        'PASSWORD': 'your password',
        'HOST': '127.0.0.1',
        'PORT': '5432'
    }
}
```
* or you can to import my sample PostgreSQL database using this command:
```bash
psql -U username dbname < dbexport.pgsql
```

#### 4- In settings.py set up the your email:
```bash
EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'
EMAIL_HOST = 'smtp.gmail.com'
EMAIL_USE_TLS = True
EMAIL_PORT = 587
EMAIL_HOST_USER = 'your email'
EMAIL_HOST_PASSWORD = 'your email password'
```

#### 5- Install the requirements :
```bash
pip install -r requirements.txt
``` 

#### 6- Write the following commands to create your tables:
```bash
python manage.py makemigrations
python manage.py migrate
``` 
#### 7- Run the development server:
```bash
python manage.py runserver
``` 
#### Open http://127.0.0.1:8000 in your browser. 

## License
[![license](https://img.shields.io/github/license/DAVFoundation/captain-n3m0.svg?style=flat-square)](https://github.com/DAVFoundation/captain-n3m0/blob/master/LICENSE)



