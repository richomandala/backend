'use strict';

var response = require('../utils/response');
var connection = require('../koneksi');

const table = "presences";

//menampilkan semua data chat classroom
exports.find = function (req, res) {
    const schedule_id = req.params.schedule_id
    const user_id = req.params.user_id

    connection.query(
        `SELECT * FROM ${table}
        WHERE ${table}.schedule_id = ?
        AND ${table}.user_id = ?`,
        [schedule_id, user_id],
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

//menambahkan data chat
exports.store = function (req, res) {
    const body = req.body;
    const date = new Date()

    const data = {
        photo: body.photo,
        schedule_id: body.schedule_id,
        time: date.getHours() + ':' + date.getMinutes() + ':' + date.getSeconds(),
        user_id: body.user_id
    };

    connection.query(
        `INSERT INTO ${table} 
        (photo, schedule_id, time, user_id) 
        VALUES(?,?,?,?)`,
        [data.photo, data.schedule_id, data.time, data.user_id],
        function (err, values) {
            if (err) {
                response.error(err.message, res);
            } else {
                response.success(values, res);
            }
        }
    );
};