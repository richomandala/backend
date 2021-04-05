'use strict';

module.exports = function (app) {
    var jsonku = require('./controller');

    // routes siswa
    const siswa = require('./controller/siswa');
    app.route('/siswa')
        .get(siswa.findall);
    app.route('/siswa/:id')
        .get(siswa.find);
    app.route('/siswa')
        .post(siswa.store);
    app.route('/siswa/:id')
        .put(siswa.update);
    app.route('/siswa/:id')
        .delete(siswa.destroy);

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