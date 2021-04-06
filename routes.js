'use strict';

module.exports = function (app) {
    var jsonku = require('./controller');

    // routes student
    const student = require('./controller/students');
    app.route('/student')
        .get(student.findall);
    app.route('/student/:id')
        .get(student.find);
    app.route('/student')
        .post(student.store);
    app.route('/student/:id')
        .put(student.update);
    app.route('/student/:id')
        .delete(student.destroy);
    
    // routes classes
    const classes = require('./controller/classes');
    app.route('/classes')
        .get(classes.findall);
    app.route('/classes/:id')
        .get(classes.find);
    app.route('/classes')
        .post(classes.store);
    app.route('/classes/:id')
        .put(classes.update);
    app.route('/classes/:id')
        .delete(classes.destroy);

    // app.route('/')
    //     .get(jsonku.index);

    // app.route('/tampil')
    //     .get(jsonku.tampilsemuausers);

    // app.route('/tampil/:id')
    //     .get(jsonku.tampilberdasarkanid);
        
    // app.route('/tambah')
    //     .post(jsonku.tambahUsers);

    // app.route('/ubah')
    //     .put(jsonku.ubahUsers);

    // app.route('/hapus')
    //     .delete(jsonku.hapusUsers);

    // app.route('/login')
    //     .post(jsonku.loginUsers);
}