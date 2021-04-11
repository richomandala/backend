'use strict';

var response = require('../utils/response');
var connection = require('../koneksi');

const table = "teachers";

//menampilkan semua data guru
exports.findall = function (req, res) {
    connection.query(
        `SELECT * FROM ${table}`,
        function(err, values) {
            if (err) {
                response.error(error.message, res)
            } else {
                response.success(values, res);
            }
        }
    );
};

// menampilkan data guru berdasarkan id
exports.find = function (req, res) {
    let id = req.params.id;
    connection.query(
        `SELECT * FROM ${table} 
        WHERE ${table}.id=?`,
        [id],
        function(err, values) {
            if (err) {
                response.error(error.message, res)
            } else {
                response.success(values[0], res);
            }
        }
    );
};

//menambahkan data guru
exports.store = function (req, res) {
    const body = req.body;
    
    // create users for teacher
    const users = require('./users');
    const dataUser = {
        username: body.username,
        email: body.email,
        password: body.password,
        role_id: 2 // 2 untuk guru
    };
    
    // buat user
    users.store(dataUser, function(result) {
        // jika gagal tampil pesan error
        if (result.error) {
            response.error(result.message, res);
        // jika berhasil tambah data siswa
        } else {
            const data = {
                nip: body.nip,
                name: body.name,
                gender: body.gender,
                birthplace: body.birthplace,
                birthdate: body.birthdate,
                user_id: result.id
            };

            connection.query(
                `INSERT INTO ${table} 
                (nip, name, gender, birthplace, birthdate, user_id) 
                VALUES(?,?,?,?,?,?)`,
                [data.nip, data.name, data.gender, data.birthplace, data.birthdate, data.user_id],
                function (err, values) {
                    if (err) {
                        response.error(err.message, res);
                    } else {
                        response.success(values, res);
                    }
                }
            );
        }
    });
};

//mengubah data guru
exports.update = function (req, res) {
    const id = req.params.id
    const body = req.body;

    const data = {
        nip: body.nip,
        name: body.name,
        gender: body.gender,
        birthplace: body.birthplace,
        birthdate: body.birthdate
    };

    connection.query(
        `UPDATE ${table} SET 
        nip=?, name=?, gender=?, birthplace=?, birthdate=?
        WHERE id=?`,
        [data.nip, data.name, data.gender, data.birthplace, data.birthdate, id],
        function (err, values) {
            if (err) {
                response.error(err.message, res);
            } else {
                response.success(values, res);
            }
        }
    );
};

//Menghapus data
exports.destroy = function (req, res) {
    const id = req.params.id;

    connection.query(
        `SELECT * FROM ${table}
        WHERE id=?`,
        [id],
        function(err, values) {
            if (err) {
                response.error(err.message, res)
            } else {
                const users = require('./users');
                users.destroy(values[0].user_id, function(result) {
                    response.success(result, res);
                })
            }
        }
    );
}