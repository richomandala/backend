'use strict';

var response = require('../utils/response');
var connection = require('../koneksi');

const table = "majors";

//menampilkan semua data jurusan
exports.findall = function (req, res) {
    connection.query(
        `SELECT * FROM ${table}`,
        function (err, values) {
            if (err) {
                response.error(error.message, res)
            } else {
                if (values.length) {
                    response.success(values[0], res);
                } else {
                    if (values.length) {
                        response.success(values, res);
                    } else {
                        response.notFound(res);
                    }
                }
            }
        }
    );
};

//menampilkan data jurusan berdasarkan id
exports.find = function (req, res) {
    let id = req.params.id;
    connection.query(
        `SELECT * FROM ${table}
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

//menambahkan data jurusan
exports.store = function (req, res) {
    const body = req.body;

    const data = {
        code: body.code,
        major: body.major
    };

    connection.query(
        `INSERT INTO ${table} 
        (code, major) 
        VALUES(?,?)`,
        [data.code, data.major],
        function (err, values) {
            if (err) {
                response.error(err.message, res);
            } else {
                response.success(values, res);
            }
        }
    );
};

//mengubah data jurusan
exports.update = function (req, res) {
    const id = req.params.id
    const body = req.body;

    const data = {
        code: body.code,
        major: body.major
    };

    connection.query(
        `UPDATE ${table} SET 
        code=?, major=?
        WHERE id=?`,
        [data.code, data.major, id],
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