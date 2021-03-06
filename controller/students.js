'use strict';

var response = require('../utils/response');
var connection = require('../koneksi');

const table = "students";

//menampilkan semua data siswa
exports.findall = function (req, res) {
    connection.query(
        `SELECT ${table}.*, class, major FROM ${table} 
        LEFT JOIN classes ON classes.id = ${table}.class_id
        LEFT JOIN majors ON majors.id = classes.major_id`,
        function (err, values) {
            if (err) {
                response.error(error.message, res)
            } else {
                if (values.length > 0) {
                    response.success(values, res);
                } else {
                    response.notfound(res)
                }
            }
        }
    );
};

//menampilkan data siswa berdasarkan id
exports.find = function (req, res) {
    let id = req.params.id;
    connection.query(
        `SELECT ${table}.*, class, major FROM ${table} 
        LEFT JOIN classes ON classes.id = ${table}.class_id
        LEFT JOIN majors ON majors.id = classes.major_id
        WHERE ${table}.id=?`,
        [id],
        function (err, values) {
            if (err) {
                response.error(error.message, res)
            } else {
                if (values.length > 0) {
                    response.success(values[0], res);
                } else {
                    response.notfound(res)
                }
            }
        }
    );
};

//menampilkan data siswa berdasarkan class id
exports.findByClass = function (req, res) {
    let id = req.params.id;
    connection.query(
        `SELECT ${table}.*, class, major FROM ${table} 
        LEFT JOIN classes ON classes.id = ${table}.class_id
        LEFT JOIN majors ON majors.id = classes.major_id
        WHERE class_id=?`,
        [id],
        function (err, values) {
            if (err) {
                response.error(error.message, res)
            } else {
                if (values.length > 0) {
                    response.success(values, res);
                } else {
                    response.notfound(res)
                }
            }
        }
    );
};

//menambahkan data siswa
exports.store = function (req, res) {
    const body = req.body;

    // create users for student
    const users = require('./users');
    const dataUser = {
        username: body.username,
        email: body.email,
        password: body.password,
        role_id: 3 // 3 untuk siswa
    };

    // buat user
    users.store(dataUser, function (result) {
        // jika gagal tampil pesan error
        if (result.error) {
            response.error(result.message, res);
            // jika berhasil tambah data siswa
        } else {
            const data = {
                nisn: body.nisn,
                nis: body.nis,
                name: body.name,
                gender: body.gender,
                birthplace: body.birthplace,
                birthdate: body.birthdate,
                user_id: result.id,
                class_id: body.class_id
            };

            connection.query(
                `INSERT INTO ${table} 
                (nisn, nis, name, gender, birthplace, birthdate, user_id, class_id) 
                VALUES(?,?,?,?,?,?,?,?)`,
                [data.nisn, data.nis, data.name, data.gender, data.birthplace, data.birthdate, data.user_id, data.class_id],
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

//mengubah data siswa
exports.update = function (req, res) {
    const id = req.params.id
    const body = req.body;

    const data = {
        nisn: body.nisn,
        nis: body.nis,
        name: body.name,
        gender: body.gender,
        birthplace: body.birthplace,
        birthdate: body.birthdate,
        class_id: body.class_id
    };

    connection.query(
        `UPDATE ${table} SET 
        nisn=?, nis=?, name=?, gender=?, birthplace=?, birthdate=?, class_id=?
        WHERE id=?`,
        [data.nisn, data.nis, data.name, data.gender, data.birthplace, data.birthdate, data.class_id, id],
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
        function (err, values) {
            if (err) {
                response.error(err.message, res)
            } else {
                const users = require('./users');
                users.destroy(values[0].user_id, function (result) {
                    response.success(result, res);
                })
            }
        }
    );
}