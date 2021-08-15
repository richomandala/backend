'use strict';

var response = require('../utils/response');
var connection = require('../koneksi');

const table = "classes";

//menampilkan semua data kelas
exports.findall = function (req, res) {
    connection.query(
        `SELECT ${table}.*, major FROM ${table} 
        LEFT JOIN majors ON majors.id = ${table}.major_id`,
        function(err, values) {
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

exports.findByMajor = function (req, res) {
    const id = req.params.id

    connection.query(
        `SELECT ${table}.*, major FROM ${table} 
        LEFT JOIN majors ON majors.id = ${table}.major_id
        WHERE majors.id = ?`,
        [id],
        function(err, values) {
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

//menampilkan data kelas berdasarkan id
exports.find = function (req, res) {
    let id = req.params.id;
    connection.query(
        `SELECT ${table}.*, major FROM ${table} 
        LEFT JOIN majors ON majors.id = ${table}.major_id
        WHERE ${table}.id=?`,
        [id],
        function(err, values) {
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

//menambahkan data siswa
exports.store = function (req, res) {
    const body = req.body;
    
    const data = {
        class: body.class,
        grade: body.grade,
        major_id: body.major_id
    };

    connection.query(
        `INSERT INTO ${table} 
        (class, grade, major_id) 
        VALUES(?,?,?)`,
        [data.class, data.grade, data.major_id],
        function (err, values) {
            if (err) {
                response.error(err.message, res);
            } else {
                response.success(values, res);
            }
        }
    );
};

//mengubah data kelas
exports.update = function (req, res) {
    const id = req.params.id
    const body = req.body;

    const data = {
        class: body.class,
        grade: body.grade,
        major_id: body.major_id
    };

    connection.query(
        `UPDATE ${table} SET 
        class=?, grade=?, major_id=?
        WHERE id=?`,
        [data.class, data.grade, data.major_id, id],
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
        `DELETE FROM ${table}
        WHERE id=?`,
        [id],
        function(err, values) {
            if (err) {
                response.error(err.message, res)
            } else {
                 response.success(values, res);
              }
        }
    );
}