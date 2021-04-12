# Instalasi IT Project Backend

Buka Command Prompt / Terminal / Git Bash

Clone project

```
git clone https://github.com/richomandala/backend.git
```
Masuk ke direktori projek
```
cd backend
```

Nyalakan Mysql serta PHPMyAdmin lalu masuk ke PHPMyAdmin
Buat Database baru dengan nama
```
elearning
```
lalu pilih menu import dan pilih file
```
database/elearning.sql
```
Lalu ubah file `koneksi.js` sesuai dengan pengaturan MySQL
```
host:'localhost',
user:'root',
password:'',
database:'elearning',
port: '3306'
```

Lalu kembali ke Command Prompt / Terminal / Git Bash
Jalankan perintah
```
node server
```
