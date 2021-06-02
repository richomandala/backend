'use strict';

var response = require('../utils/response');
var connection = require('../koneksi');

const table = "classrooms";

//menampilkan semua data ruang kelas
exports.findall = function (req, res) {
    connection.query(
        `SELECT * FROM ${table}
        LEFT JOIN teachers ON teachers.id = ${table}.teacher_id
        LEFT JOIN subjects ON subjects.id = ${table}.subject_id
        LEFT JOIN classes ON classes.id = ${table}.class_id`,
        function (err, values) {
            if (err) {
                response.error(error.message, res)
            } else {
                if (values.length) {
                    response.success(values, res);
                } else {
                    response.notFound(res);
                }
            }
        }
    );
};

//menampilkan data ruang kelas berdasarkan id
exports.find = function (req, res) {
    let id = req.params.id;
    connection.query(
        `SELECT * FROM ${table}
        LEFT JOIN teachers ON teachers.id = ${table}.teacher_id
        LEFT JOIN subjects ON subjects.id = ${table}.subject_id
        LEFT JOIN classes ON classes.id = ${table}.class_id
        WHERE ${table}.id=?`,
        [id],
        function (err, values) {
            if (err) {
                response.error(error.message, res)
            } else {
                if (values.length) {
                    response.success(values[0], res);
                } else {
                    response.notFound(res);
                }
            }
        }
    );
};

//menambahkan data ruang kelas
exports.store = function (req, res) {
    const body = req.body;

    const data = {
        teacher_id: body.teacher_id,
        subject_id: body.subject_id,
        class_id: body.class_id
    };

    connection.query(
        `INSERT INTO ${table} 
        (teacher_id, subject_id, class_id) 
        VALUES(?,?,?)`,
        [data.teacher_id, data.subject_id, data.class_id],
        function (err, values) {
            if (err) {
                response.error(err.message, res);
            } else {
                response.success(values, res);
            }
        }
    );
};

//mengubah data ruang kelas
exports.update = function (req, res) {
    const id = req.params.id
    const body = req.body;

    const data = {
        teacher_id: body.teacher_id,
        subject_id: body.subject_id,
        class_id: body.class_id
    };

    connection.query(
        `UPDATE ${table} SET 
        teacher_id=?, subject_id=?, class_id=?
        WHERE id=?`,
        [data.teacher_id, data.subject_id, data.class_id, id],
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
        function (err, values) {
            if (err) {
                response.error(err.message, res)
            } else {
                response.success(values, res);
            }
        }
    );
}