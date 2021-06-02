'use strict';

module.exports = function (app) {

    // routes students
    const students = require('./controller/students');
    app.route('/students')
        .get(students.findall);
    app.route('/students/findByClass/:id')
        .get(students.findByClass);
    app.route('/students/:id')
        .get(students.find);
    app.route('/students')
        .post(students.store);
    app.route('/students/:id')
        .put(students.update);
    app.route('/students/:id')
        .delete(students.destroy);

    // routes teachers
    const teachers = require('./controller/teachers');
    app.route('/teachers')
        .get(teachers.findall);
    app.route('/teachers/:id')
        .get(teachers.find);
    app.route('/teachers')
        .post(teachers.store);
    app.route('/teachers/:id')
        .put(teachers.update);
    app.route('/teachers/:id')
        .delete(teachers.destroy);

    // routes class
    const classes = require('./controller/classes');
    app.route('/classes')
        .get(classes.findall);
    app.route('/classes/findByMajor/:id')
        .get(classes.findByMajor);
    app.route('/classes/:id')
        .get(classes.find);
    app.route('/classes')
        .post(classes.store);
    app.route('/classes/:id')
        .put(classes.update);
    app.route('/classes/:id')
        .delete(classes.destroy);

    // routes majors
    const majors = require('./controller/majors');
    app.route('/majors')
        .get(majors.findall);
    app.route('/majors/:id')
        .get(majors.find);
    app.route('/majors')
        .post(majors.store);
    app.route('/majors/:id')
        .put(majors.update);
    app.route('/majors/:id')
        .delete(majors.destroy);

    // routes subjects
    const subjects = require('./controller/subjects');
    app.route('/subjects')
        .get(subjects.findall);
    app.route('/subjects/:id')
        .get(subjects.find);
    app.route('/subjects')
        .post(subjects.store);
    app.route('/subjects/:id')
        .put(subjects.update);
    app.route('/subjects/:id')
        .delete(subjects.destroy);

    // routes classroom
    const classrooms = require('./controller/classrooms');
    app.route('/classrooms')
        .get(classrooms.findall);
    app.route('/classrooms/:id')
        .get(classrooms.find);
    app.route('/classrooms')
        .post(classrooms.store);
    app.route('/classrooms/:id')
        .put(classrooms.update);
    app.route('/classrooms/:id')
        .delete(classrooms.destroy);

    // routes subject matter
    const subjectMatters = require('./controller/subjectMatters');
    app.route('/subjectMatters')
        .get(subjectMatters.findall);
    app.route('/subjectMatters/:id')
        .get(subjectMatters.find);
    app.route('/subjectMatters')
        .post(subjectMatters.store);
    app.route('/subjectMatters/:id')
        .put(subjectMatters.update);
    app.route('/subjectMatters/:id')
        .delete(subjectMatters.destroy);

    // routes classworks
    const classworks = require('./controller/classworks');
    app.route('/classworks')
        .get(classworks.findall);
    app.route('/classworks/:id')
        .get(classworks.find);
    app.route('/classworks')
        .post(classworks.store);
    app.route('/classworks/:id')
        .put(classworks.update);
    app.route('/classworks/:id')
        .delete(classworks.destroy);
}