# Online Shop
A simple django ecommerce project 

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
### Open http://127.0.0.1:8000 in your browser. 

## License
[![license](https://img.shields.io/github/license/DAVFoundation/captain-n3m0.svg?style=flat-square)](https://github.com/DAVFoundation/captain-n3m0/blob/master/LICENSE)



