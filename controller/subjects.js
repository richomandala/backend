'use strict';

var response = require('../utils/response');
var connection = require('../koneksi');

const table = "subjects";

//menampilkan semua data mata pelajaran
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

//menampilkan data mata pelajaran berdasarkan id
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

//menambahkan data mata pelajaran
exports.store = function (req, res) {
    const body = req.body;
    
    const data = {
        code: body.code,
        subject: body.subject
    };

    connection.query(
        `INSERT INTO ${table} 
        (code, subject) 
        VALUES(?,?)`,
        [data.code, data.subject],
        function (err, values) {
            if (err) {
                response.error(err.message, res);
            } else {
                response.success(values, res);
            }
        }
    );
};

//mengubah data mata pelajaran
exports.update = function (req, res) {
    const id = req.params.id
    const body = req.body;

    const data = {
        code: body.code,
        subject: body.subject
    };

    connection.query(
        `UPDATE ${table} SET 
        code=?, subject=?
        WHERE id=?`,
        [data.code, data.subject, id],
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