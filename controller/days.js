'use strict';

var response = require('../utils/response');
var connection = require('../koneksi');

const table = "days";

//menampilkan semua data hari
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