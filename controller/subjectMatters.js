'use strict';

var response = require('../utils/response');
var connection = require('../koneksi');

const table = "subject_matters";

//menampilkan semua data materi
exports.findall = function (req, res) {
    connection.query(
        `SELECT * FROM ${table}`,
        function (err, values) {
            if (err) {
                response.error(error.message, res)
            } else {
                if (values.length > 0) {
                    response.success(values, res);
                } else {
                    response.notfound(res);
                }
            }
        }
    );
};

//menampilkan data materi berdasarkan id
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
                if (values.length > 0) {
                    response.success(values[0], res);
                } else {
                    response.notfound(res);
                }
            }
        }
    );
};

//menampilkan data materi berdasarkan classroom
exports.findByClassroom = function (req, res) {
    let id = req.params.id;
    connection.query(
        `SELECT * FROM ${table}
        WHERE ${table}.classroom_id=?`,
        [id],
        function (err, values) {
            if (err) {
                response.error(error.message, res)
            } else {
                if (values.length > 0) {
                    response.success(values, res);
                } else {
                    response.notfound(res);
                }
            }
        }
    );
};

//menambahkan data materi
exports.store = function (req, res) {
    const body = req.body;

    const data = {
        title: body.title,
        content: body.content,
        file_path: body.file_path,
        classroom_id: body.classroom_id
    };

    connection.query(
        `INSERT INTO ${table} 
        (title, content, file_path, classroom_id) 
        VALUES(?,?,?,?)`,
        [data.title, data.content, data.file_path, data.classroom_id],
        function (err, values) {
            if (err) {
                response.error(err.message, res);
            } else {
                response.success(values, res);
            }
        }
    );
};

//mengubah data materi
exports.update = function (req, res) {
    const id = req.params.id
    const body = req.body;

    const data = {
        title: body.title,
        content: body.content,
        file_path: body.file_path,
        classroom_id: body.classroom_id
    };

    connection.query(
        `UPDATE ${table} SET 
        title=?, content=?, file_path=?, classroom_id=?
        WHERE id=?`,
        [data.title, data.content, data.file_path, data.classroom_id, id],
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