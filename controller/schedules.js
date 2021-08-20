'use strict';

var response = require('../utils/response');
var connection = require('../koneksi');

const table = "schedules";

//menampilkan semua data jadwal berdasarkan kelas
exports.findByClass = function (req, res) {
    const id = req.params.id
    
    connection.query(
        `SELECT ${table}.*, grade, class, subject, name, time_start, time_end, day FROM ${table}
        JOIN classes ON ${table}.class_id = classes.id
        JOIN subjects ON ${table}.subject_id = subjects.id
        JOIN classrooms ON (${table}.class_id = classrooms.class_id AND ${table}.subject_id = classrooms.subject_id)
        JOIN teachers ON classrooms.teacher_id = teachers.id
        JOIN times ON ${table}.time_id = times.id
        JOIN days ON ${table}.day_id = days.id
        WHERE ${table}.class_id = ?`,
        [id],
        function (err, values) {
            if (err) {
                response.error(error.message, res)
            } else {
                if (values.length) {
                    response.success(values, res);
                } else {
                    response.notfound(res);
                }
            }
        }
    );
};

//menampilkan semua data jadwal berdasarkan guru
exports.findByTeacher = function (req, res) {
    const id = req.params.id
    
    connection.query(
        `SELECT ${table}.*, grade, class, subject, name, time_start, time_end, day FROM ${table}
        JOIN classes ON ${table}.class_id = classes.id
        JOIN subjects ON ${table}.subject_id = subjects.id
        JOIN classrooms ON (${table}.class_id = classrooms.class_id AND ${table}.subject_id = classrooms.subject_id)
        JOIN teachers ON classrooms.teacher_id = teachers.id
        JOIN times ON ${table}.time_id = times.id
        JOIN days ON ${table}.day_id = days.id
        WHERE classrooms.teacher_id = ?`,
        [id],
        function (err, values) {
            if (err) {
                response.error(error.message, res)
            } else {
                if (values.length) {
                    response.success(values, res);
                } else {
                    response.notfound(res);
                }
            }
        }
    );
};

//menambahkan data jadwal
exports.store = function (req, res) {
    const body = req.body;

    const data = {
        class_id: body.class_id,
        day_id: body.day_id,
        time_id: body.time_id,
        subject_id: body.subject_id,
    };

    connection.query(
        `INSERT INTO ${table} 
          (time_id, day_id, class_id, subject_id) 
          VALUES(?,?,?,?)`,
        [data.time_id, data.day_id, data.class_id, data.subject_id],
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