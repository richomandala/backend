'use strict';

var response = require('./res');
var connection = require('./koneksi');

exports.index = function (req, res) {
    response.ok("Aplikasi REST API ku berjalan!", res)
};

//menampilkan semua data mahasiswa
exports.tampilsemuausers = function (req, res) {
    connection.query('SELECT * FROM `users` LEFT JOIN level_users ON level_users.id = users.id_level', function (error, rows, fileds) {
        if (error) {
            console.log(error);
        } else {
            response.ok(rows, res);
        }
    });
};

//menampilkan semua data mahasiwa berdasarkan id
exports.tampilberdasarkanid = function (req, res) {
    let id = req.params.id;
    connection.query('SELECT * FROM users WHERE id = ?', [id],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);
            }
        });
};

//menambahkan data mahasiswa
exports.tambahUsers = function (req, res) {
    var nis = req.body.nis;
    var nama = req.body.nama;
    var password = req.body.password;
    var id_level = req.body.id_level;

    connection.query('INSERT INTO users (nis,nama,password,id_level) VALUES(?,?,?,?)',
        [nis, nama, password, id_level],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok("Berhasil Menambahkan Data!", res)
            }
        });
};


//mengubah data berdasarkan id
exports.ubahUsers = function (req, res) {
    var id = req.body.id;
    var nis = req.body.nis;
    var nama = req.body.nama;
    var password = req.body.password;
    var id_level= req.body.id_level;

    connection.query('UPDATE users SET nis=?, nama=?, password=?, id_level=? WHERE id=?', [nim, nama, password, level_users, id],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok("Berhasil Ubah Data", res)
            }
        });
}

//Menghapus data berdasarkan id
exports.hapusUsers = function (req, res) {
    var id = req.body.id;
    connection.query('DELETE FROM users WHERE id=?',[id],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok("Berhasil Hapus Data", res)
            }
        });
}

exports.loginUsers = function (req, res) {
    var nis = req.body.nis;
    var password = req.body.password;
    console.log(req.body)
    connection.query('SELECT * FROM users WHERE nis=? AND password=?', [nis, password],
        function (error, rows, fileds) {
            if (error) {
                console.log(error);
            } else {
                console.log(rows)
                if(rows.length === 0){
                    response.ok(rows, res, "nis dan password tidak ditemukan")
                } else {
                    if (rows[0].id_level == 3) {
                        response.ok(rows, res, "INI SISWA")
                        connection.query('SELECT * FROM `users` LEFT JOIN level_users ON level_users.id = users.id_level LEFT JOIN tingkat ON tingkat.id = level_users.id_tingkat LEFT JOIN jurusan ON jurusan.id = tingkat.id_jurusan LEFT JOIN kelas ON kelas.id = jurusan.id_kelas WHERE id_level=3',  function(err, result){
                            if(err){
                                console.log(err)
                            } else {
                                response.ok(result, res, "INI SISWA")
                            }
                        })
                    } else if (rows[0].id_level === 2) {
                        response.ok(rows, res, "Berhasil Login GURU")
                    } else {
                        response.ok(rows, res, "Berhasil Login ADMIN")
                    }
                    // response.ok(rows, res, "Berhasil Login")
                }
            }
        })
}