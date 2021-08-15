  
var connection = require('../koneksi');
var mysql = require('mysql');
var md5 = require('md5');
var response = require('../utils/response');
var jwt = require('jsonwebtoken');
var config = require('../config/secret');
var ip = require('ip');
var nodemailer = require('nodemailer')

let smtpTransport = nodemailer.createTransport({
     host: "smtp.gmail.com",
     port: 465,
     secure: true,
     auth: {
          user: "ahmad.saifm95@gmail.com",
          pass: "green@123"
     }
})


var rand, mailOptions, host, link

exports.verifikasi = function (req, res) {
     console.log(req.protocol)
     if ((req.protocol + "://" + req.get('host')) == ("http://" + host)) {
          if (req.query.id == rand) {
               connection.query('UPDATE user SET isVerified=? WHERE email=?', [1, mailOptions.to],
                    function (error, rows, fields) {
                         if (error) {
                              console.log(error)
                              res.end(error)
                         } else {
                              res.end("<h1>Email anda " + mailOptions.to + "telah terverifikasi")
                         }
                    }
               )
          }
          else {
               res.end("<h1>Email anda " + mailOptions.to + "tidak terverifikasi")
          }
     }
}

exports.ubahPassword = function (req, res) {

     //buat input req body
     var data = {
          username: req.body.username,
          currpassword: md5(req.body.currpassword),
          newpassword: md5(req.body.newpassword)
     }

     //jalankan kueri
     var query = "SELECT username,password FROM ?? WHERE ??=?";
     var table = ["users", "username", data.username];

     query = mysql.format(query, table);

     connection.query(query, function (error, rows) {
          if (error) {
               response.error(error.message, res);
          } else {
               if (rows.length == 1) {
                    username = rows[0].username;
                    password = rows[0].password;

                    if (data.currpassword == password) {
                         if (data.newpassword == data.currpassword) {
                              res.json({
                                   success: false,
                                   message: "Password masih sama dengan sebelumnya!"
                              }).end()
                         } else {
                              connection.query('UPDATE users SET password=? WHERE username=?',
                                   [data.newpassword, username],
                                   function (error, rows, fields) {
                                        if (error) {
                                             res.json({
                                                  success: false,
                                                  message: error
                                             }).end()
                                        } else {
                                             res.json({
                                                  success: true,
                                                  message: "Berhasil Update Password!"
                                             }).end()
                                        }
                                   }
                              )
                         }
                    }
                    else {
                         res.json({
                              success: false,
                              message: "Gagal Update Password!"
                         }).end()
                    }
               }
               else {
                    res.json({
                         success: false,
                         message: "Password Salah!"
                    }).end()
               }
          }
     });
}

//controller untuk registrasi user
exports.registrasi = function (req, res) {
     var post = {
          username: req.body.username,
          email: req.body.email,
          password: md5(req.body.password),
          role_id: req.body.role_id,
     }

     var query = "SELECT username FROM ?? WHERE ??=?";
     var table = ["users", "username", post.username];

     query = mysql.format(query, table);

     connection.query(query, function (error, rows) {
          if (error) {
               response.error(error.message, res);
          } else {
               if (rows.length == 0) {
                    var query = "INSERT INTO ?? SET ?";
                    var table = ["users"];
                    query = mysql.format(query, table);
                    connection.query(query, post, function (error, rows) {
                         if (error) {
                              response.error(error.message, res);
                         } else {
                              res.json({
                                   success: true,
                                   isRegistered: false,
                                   message: "Akun berhasil dibuat!"
                              }).end();
                              // //kirimkan email verifikasi
                              // rand = Math.floor((Math.random() * 100) + 54)
                              // host = "localhost:3001"
                              // link = "http://" + host + "/auth/verify?id=" + rand
                              // mailOptions = {
                              //      to: post.email,
                              //      subject: "Verifikasi Email",
                              //      html: "Hallo, <br> Please klik tautan verifikasi berikut <br>" +
                              //           "<a href=" + link + ">Click here to verifikasi</a>"
                              // }

                              // smtpTransport.sendMail(mailOptions, function (error, response) {
                              //      if (error) {
                              //           res.json({
                              //                success: false,
                              //                isRegistered: false,
                              //                message: "Email verifikasi gagal terkirim"
                              //           }).end();
                              //      } else {
                              //           res.json({
                              //                success: true,
                              //                isRegistered: false,
                              //                message: "Email verifikasi berhasil terkirim"
                              //           }).end();
                              //      }
                              // })
                         }
                    });
               } else {
                    res.json({
                         success: false,
                         isRegistered: true,
                         message: "Email anda telah terdaftar!"
                    }).end();
               }
          }
     })
}

// controller untuk login
exports.login = function (req, res) {
     var post = {
          password: req.body.password,
          username: req.body.username
     }

     var query = "SELECT * FROM ?? WHERE ??=? AND ??=?";
     var table = ["users", "password", md5(post.password), "username", post.username];

     query = mysql.format(query, table);

     connection.query(query, function (error, rows) {
          if (error) {
               response.error(error.message, res);
          } else {
               if (rows.length == 1) {
                    var token = jwt.sign({ rows }, config.secret, {
                         //ubah expires dalam ms
                         expiresIn: '2400000'
                    });

                    id_users = rows[0].id;
                    // 1 tambahan row username
                    username = rows[0].username;
                    //2 tambahan row role
                    role_id = rows[0].role_id;

                    // 3 variable expires
                    // var expired = 30000
                    var expired = 2400000
                    var isVerified = rows[0].isVerified

                    var data = {
                         id_users: id_users,
                         access_token: token,
                         ip_address: ip.address()
                    }

                    var query = "INSERT INTO ?? SET ?";
                    var table = ["akses_token"];

                    query = mysql.format(query, table);
                    connection.query(query, data, function (error, rows) {
                         if (error) {
                              response.error(error.message, res);
                         } else {
                              res.json({
                                   success: true,
                                   message: 'Token JWT tergenerate!',
                                   token: token,
                                   //4 tambahkan expired time
                                   expires: expired,
                                   currUser: data.id_users,
                                   user: username,
                                   //3 tambahkan role
                                   role_id: role_id,
                                   isVerified: isVerified
                              });
                         }
                    });
               }
               else {
                    res.json({ "Error": true, "Message": "Email atau password salah!" });
               }
          }
     });
}

// exports.halamanrahasia = function (req, res) {
//      response.error("Halaman ini hanya untuk user dengan role = 2!", res);
// }


//menampilkan semua data users
exports.admin = function (req, res) {
     connection.query('SELECT * FROM users', function (error, rows, fileds) {
          if (error) {
               response.error(error.message, res);
          } else {
               response.success(rows, res)
          }
     });
};