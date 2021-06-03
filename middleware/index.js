var express = require('express');
var auth = require('./auth');
var router = express.Router();
// var verifikation = require('./verification');
var verifikasi = require('./verifikasi')

//daftarkan menu registrasi
router.post('/api/v1/register', auth.registrasi);
router.post('/api/v1/login', auth.login);
router.post('/api/v1/ubahpassword', verifikasi(), auth.ubahPassword);

router.get('/verify', auth.verifikasi)

//alamat yang perlu otorisasi
//halaman menampilkan data tabel oleh administrator
router.get('/api/v1/admin/users', verifikasi(), auth.admin);

module.exports = router;