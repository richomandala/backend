'use strict';

exports.success = function (values, res) {
  var data = {
    'message': 'Success',
    'status': 200,
    'timestamp': new Date(),
    'data': values
  };
  res.status(200);
  res.json(data);
  res.end();
};

exports.notfound = function (res) {
  var data = {
    'message': 'Not Found',
    'status' : 404,
    'timestamp' : new Date()
  };
  res.json(data);
  res.end;
}

exports.error = function (values, res) {
  var data = {
    'message': 'Error',
    'status': 500,
    'timestamp': new Date(),
    'error': values
  };
  res.status(500);
  res.json(data);
  res.end();
};