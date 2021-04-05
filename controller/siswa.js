'use strict';

var response = require('../res');
var connection = require('../koneksi');

// fungsi sql connection query
const sql = (query, res, params) => {
    connection.query(query, params, function(err, rows) {
        if (err) {
            response.ok({
                error: true,
                message: err
            }, res);
        } else {
            response.ok({
                error: false,
                data: rows
            }, res)
        }
    });
};

//menampilkan semua data siswa
exports.findall = function (req, res) {
    sql(
        `SELECT * FROM students 
        LEFT JOIN classes ON classes.id = students.class_id
        LEFT JOIN majors ON majors.id = classes.major_id`, 
        res
    );
};

//menampilkan semua data siswa berdasarkan id
exports.find = function (req, res) {
    let id = req.params.id;
    sql(`
        SELECT * FROM students 
        LEFT JOIN classes ON classes.id = students.class_id
        LEFT JOIN majors ON majors.id = classes.major_id
        WHERE students.id = ?`, 
        res,
        [id]
    );
};

//menambahkan data mahasiswa
exports.store = function (req, res) {
    const data = {

    };

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


// //mengubah data berdasarkan id
// exports.ubahUsers = function (req, res) {
//     var id = req.body.id;
//     var nis = req.body.nis;
//     var nama = req.body.nama;
//     var password = req.body.password;
//     var id_level= req.body.id_level;

//     connection.query('UPDATE users SET nis=?, nama=?, password=?, id_level=? WHERE id=?', [nim, nama, password, level_users, id],
//         function (error, rows, fields) {
//             if (error) {
//                 console.log(error);
//             } else {
//                 response.ok("Berhasil Ubah Data", res)
//             }
//         });
// }

// //Menghapus data berdasarkan id
// exports.hapusUsers = function (req, res) {
//     var id = req.body.id;
//     connection.query('DELETE FROM users WHERE id=?',[id],
//         function (error, rows, fields) {
//             if (error) {
//                 console.log(error);
//             } else {
//                 response.ok("Berhasil Hapus Data", res)
//             }
//         });
// }