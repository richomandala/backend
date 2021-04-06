'use strict';

var response = require('../utils/response');
var connection = require('../koneksi');

//menampilkan semua data kelas
exports.findall = function (req, res) {
    connection.query(
        `SELECT * FROM classes 
        LEFT JOIN majors ON majors.id = classes.major_id`,
        function(err, values) {
            if (err) {
                response.error(error.message, res)
            } else {
                response.success(values, res);
            }
        }
    );
};

exports.findByMajor = function (req, res) {
    const id = req.params.id

    connection.query(
        `SELECT * FROM classes 
        LEFT JOIN majors ON majors.id = classes.major_id
        WHERE majors.id = ?`,
        [id],
        function(err, values) {
            if (err) {
                response.error(error.message, res)
            } else {
                response.success(values, res);
            }
        }
    );
};

//menampilkan data kelas berdasarkan id
exports.find = function (req, res) {
    let id = req.params.id;
    connection.query(
        `SELECT * FROM classes
        LEFT JOIN majors ON majors.id = classes.major_id
        WHERE classes.id=?`,
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

//menambahkan data siswa
exports.store = function (req, res) {
    const body = req.body;
    
    // buat kelas
        const data = {
            class: body.class,
            grade: body.grade,
            major_id: body.major_id
        };

        connection.query(
            `INSERT INTO classes 
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

//mengubah data siswa
exports.update = function (req, res) {
    const id = req.params.id
    const body = req.body;

    const data = {
        class: body.class,
        grade: body.grade,
        major_id: body.major_id
    };

    connection.query(
        `UPDATE classes SET 
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
        `DELETE FROM classes
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