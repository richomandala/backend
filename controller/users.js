'use strict';

const passwordHash = require('password-hash');
const connection = require('../koneksi');

const table = "users";

exports.store = function (data, callback) {
    const user = {
        username: data.username,
        email: data.email,
        password: passwordHash.generate(data.password),
        role_id: data.role_id
    };

    connection.query(
        `INSERT INTO ${table} 
        (username, email, password, role_id) 
        VALUES(?,?,?,?)`,
        [user.username, user.email, user.password, user.role_id],
        function (error, results) {
            if (error) {
                return callback({
                    error: true,
                    message: error
                });
            } else {
                return callback({
                    error: false,
                    id: results.insertId
                });
            }
        }
    );
};

exports.destroy = function (id, callback) {
    connection.query(
        `DELETE FROM ${table} 
        WHERE id=?`,
        [id],
        function (error, results) {
            if (error) {
                return callback({
                    error: true,
                    message: error
                });
            } else {
                return callback({
                    error: false,
                    message: results
                });
            }
        }
    );
};