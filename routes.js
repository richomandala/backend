'use strict';

module.exports = function (app) {
    var jsonku = require('./controller');

    app.route('/')
        .get(jsonku.index);

    app.route('/tampil')
        .get(jsonku.tampilsemuausers);

    app.route('/tampil/:id')
        .get(jsonku.tampilberdasarkanid);
        
    app.route('/tambah')
        .post(jsonku.tambahUsers);

    app.route('/ubah')
        .put(jsonku.ubahUsers);

    app.route('/hapus')
        .delete(jsonku.hapusUsers);

    app.route('/login')
        .post(jsonku.loginUsers);
}