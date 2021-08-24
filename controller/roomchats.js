'use strict';

var response = require('../utils/response');
var connection = require('../koneksi');

const table = "roomchats";

//menampilkan semua data chat classroom
exports.findall = function (req, res) {
    const classroom_id = req.params.classroom_id

    connection.query(
        `SELECT * FROM ${table}
        WHERE ${table}.classroom_id = ?`,
        [classroom_id],
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

//menampilkan semua data chat classroom setelah waktu tertentu
exports.findByTime = function (req, res) {
    const classroom_id = req.params.classroom_id
    const day_id = new Date().getDay()
    const time = req.params.time

    connection.query(
        `SELECT * FROM ${table}
        WHERE ${table}.classroom_id = ?
        AND ${table}.day_id = ?
        AND ${table}.time >= ?`,
        [classroom_id, day_id, time],
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

//menambahkan data chat
exports.store = function (req, res) {
    const body = req.body;
    const date = new Date()

    const data = {
        name: body.name,
        chat: body.chat,
        is_teacher: body.is_teacher,
        classroom_id: body.classroom_id,
        user_id: body.user_id,
        day_id: new Date().getDay(),
        time: date.getHours() + ':' + date.getMinutes() + ':' + date.getSeconds()
    };

    connection.query(
        `INSERT INTO ${table} 
        (name, chat, is_teacher, classroom_id, user_id, day_id, time) 
        VALUES(?,?,?,?,?,?,?)`,
        [data.name, data.chat, data.is_teacher, data.classroom_id, data.user_id, data.day_id, data.time],
        function (err, values) {
            if (err) {
                response.error(err.message, res);
            } else {
                response.success(values, res);
            }
        }
    );
};