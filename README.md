# Online Shop
A simple django ecommerce project 

![Tokan](media/shop.gif)

## How to Run?

### 1- Clone the repository:
```bash
$ git clone https://github.com/Sajjad2117/shop.git
$ cd shop
```
### 2- Create a virtualenv and activate it:

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
### 3- In settings.py, set up the database and email

### 4- Install the requirements :
```bash
pip install -r requirements.txt
``` 

### 5- Write the following commands to create your tables:
```bash
python manage.py makemigrations
python manage.py migrate
``` 
### 6- Run the development server:
```bash
python manage.py runserver
``` 

