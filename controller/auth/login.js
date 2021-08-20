'use strict';

const passwordHash = require('password-hash');
const connection = require('../../koneksi');
const jwt = require('jsonwebtoken');
const config = require('../../config/secret');
const response = require('../../utils/response');
const ip = require('ip');

const table = "users";

exports.login = function (req, res) {
    const body = req.body;

    const username = body.username;
    const password = body.password;

    connection.query(
        `SELECT * FROM ${table}
        WHERE ${table}.username=? OR ${table}.email=?`,
        [username, username],
        function (err, values) {
            if (err) {
                response.error(error.message, res)
            } else {
                if (values.length > 0) {
                    const user = values[0];
                    const verify = passwordHash.verify(password, user.password);
                    if (verify) {
                        const expiry = 2400000
                        const token = jwt.sign({ user }, config.secret, {
                            expiresIn: expiry
                        });
                        const data = {
                            token,
                            expired: Date.now() + expiry,
                            ip_address: ip.address(),
                            user_id: user.id
                        };
                        connection.query(
                            `INSERT INTO token_access 
                            (token, expired, ip_address, user_id) 
                            VALUES(?,?,?,?)`,
                            [data.token, data.expired, data.ip_address, data.user_id],
                            function (err, values) {
                                if (err) {
                                    response.error(err.message, res);
                                } else {
                                    if (user.role_id == '3') {
                                        connection.query(
                                            `SELECT * FROM students
                                            WHERE user_id = ?`,
                                            [user.id],
                                            function(err, values) {
                                                if (err) {
                                                    response.error(err.message, res);
                                                } else {
                                                    let result = {
                                                        token: token,
                                                        role_id: user.role_id,
                                                        user_id: user.id,
                                                        student_id: values[0].id,
                                                        class_id: values[0].class_id,
                                                        username: user.username,
                                                        email: user.email
                                                    }
                                                    response.success(result, res);
                                                }
                                            }
                                        );
                                    } else if (user.role_id == '2') {
                                        connection.query(
                                            `SELECT * FROM teachers
                                            WHERE user_id = ?`,
                                            [user.id],
                                            function(err, values) {
                                                if (err) {
                                                    response.error(err.message, res);
                                                } else {
                                                    let result = {
                                                        token: token,
                                                        role_id: user.role_id,
                                                        user_id: user.id,
                                                        teacher_id: values[0].id,
                                                        username: user.username,
                                                        email: user.email
                                                    }
                                                    response.success(result, res);
                                                }
                                            }
                                        );
                                    } else {
                                        let result = {
                                            token,
                                            user_id: user.id,
                                            role_id: user.role_id,
                                            username: user.username,
                                            email: user.email
                                        };
                                        response.success(result, res);
                                    }
                                }
                            }
                        );
                    } else {
                        response.error('Password salah', res);
                    }
                } else {
                    response.error('User tidak ditemukan', res);
                }
            }
        }
    );
};
