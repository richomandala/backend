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

//menampilkan data siswa berdasarkan id
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

//menambahkan data siswa
exports.store = function (req, res) {
    const body = req.body;
    
    // create users for student
    const user = require('./user');
    const dataUser = {
        username: body.username,
        email: body.email,
        password: body.password,
        role_id: 3 // 3 untuk siswa
    };
    
    // buat user
    user.store(dataUser, function(result) {
        console.log(result);
        // jika gagal tampil pesan error
        if (result.error) {
            response.ok({
                error: true,
                message: result.message
            })
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

            sql(
                `INSERT INTO students 
                (nisn, nis, name, gender, birthplace, birthdate, user_id, class_id) 
                VALUES(?,?,?,?,?,?,?,?)`,
                res,
                [data.nisn, data.nis, data.name, data.gender, data.birthplace, data.birthdate, data.user_id, data.class_id],
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

    sql(
        `UPDATE students SET 
        nisn=?, nis=?, name=?, gender=?, birthplace=?, birthdate=?, class_id=?
        WHERE id=?`,
        res,
        [data.nisn, data.nis, data.name, data.gender, data.birthplace, data.birthdate, data.class_id, id],
    );
};

//Menghapus data
exports.destroy = function (req, res) {
    const id = req.params.id;

    connection.query(
        `SELECT * FROM students
        WHERE id=?`,
        [id],
        function(err, result) {
            if (err) {
                response.ok({
                    error: true,
                    message: err
                }, res);
            } else {
                const user = require('./user');
                user.destroy(result[0].user_id, function(result) {
                    response.ok({
                        error: result.error,
                        message: result.message
                    }, res);
                })
            }
        }
    );
}