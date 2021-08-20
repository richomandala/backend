'use strict';

var response = require('../utils/response');
var connection = require('../koneksi');

const table = "classworks";

//menampilkan semua data materi
exports.findall = function (req, res) {
  connection.query(
    `SELECT * FROM ${table}`,
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
        if (values.length) {
          response.success(values[0], res);
        } else {
          response.notfound(res);
        }
      }
    }
  );
};

//menampilkan data materi berdasarkan student dan subject matter
exports.findBySubjectMatter = function (req, res) {
  let subject_matter_id = req.params.subject_matter_id;

  connection.query(
    `SELECT * FROM ${table}
        WHERE subject_matter_id=?`,
    [subject_matter_id],
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

//menampilkan data materi berdasarkan student dan subject matter
exports.findByStudentSubjectMatter = function (req, res) {
  let student_id = req.params.student_id;
  let subject_matter_id = req.params.subject_matter_id;

  connection.query(
    `SELECT * FROM ${table}
        WHERE student_id=? AND subject_matter_id=?`,
    [student_id, subject_matter_id],
    function (err, values) {
      if (err) {
        response.error(error.message, res)
      } else {
        if (values.length) {
          response.success(values[0], res);
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
    file_path: body.file_path,
    student_id: body.student_id,
    subject_matter_id: body.subject_matter_id
  };

  connection.query(
    `INSERT INTO ${table} 
        (file_path, student_id, subject_matter_id) 
        VALUES(?,?,?)`,
    [data.file_path, data.student_id, data.subject_matter_id],
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
    file_path: body.file_path,
    student_id: body.student_id,
    subject_matter_id: body.subject_matter_id
  };

  connection.query(
    `UPDATE ${table} SET 
        file_path=?, student_id=?, subject_matter_id=?
        WHERE id=?`,
    [data.file_path, data.student_id, data.subject_matter_id, id],
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