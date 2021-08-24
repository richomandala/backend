'use strict';
const verify = require('./controller/auth/verify');

module.exports = function (app) {

    // Auth
    const auth = require('./controller/auth/login');
    app.route('/auth/login')
        .post(auth.login);

    // routes students
    const students = require('./controller/students');
    app.route('/students')
        .get(verify(), students.findall);
    app.route('/students/findByClass/:id')
        .get(verify(), students.findByClass);
    app.route('/students/:id')
        .get(verify(), students.find);
    app.route('/students')
        .post(verify(), students.store);
    app.route('/students/:id')
        .put(verify(), students.update);
    app.route('/students/:id')
        .delete(verify(), students.destroy);

    // routes teachers
    const teachers = require('./controller/teachers');
    app.route('/teachers')
        .get(verify(), teachers.findall);
    app.route('/teachers/:id')
        .get(verify(), teachers.find);
    app.route('/teachers')
        .post(verify(), teachers.store);
    app.route('/teachers/:id')
        .put(verify(), teachers.update);
    app.route('/teachers/:id')
        .delete(verify(), teachers.destroy);

    // routes class
    const classes = require('./controller/classes');
    app.route('/classes')
        .get(verify(), classes.findall);
    app.route('/classes/findByMajor/:id')
        .get(verify(), classes.findByMajor);
    app.route('/classes/:id')
        .get(verify(), classes.find);
    app.route('/classes')
        .post(verify(), classes.store);
    app.route('/classes/:id')
        .put(verify(), classes.update);
    app.route('/classes/:id')
        .delete(verify(), classes.destroy);

    // routes majors
    const majors = require('./controller/majors');
    app.route('/majors')
        .get(verify(), majors.findall);
    app.route('/majors/:id')
        .get(verify(), majors.find);
    app.route('/majors')
        .post(verify(), majors.store);
    app.route('/majors/:id')
        .put(verify(), majors.update);
    app.route('/majors/:id')
        .delete(verify(), majors.destroy);

    // routes subjects
    const subjects = require('./controller/subjects');
    app.route('/subjects')
        .get(verify(), subjects.findall);
    app.route('/subjects/:id')
        .get(verify(), subjects.find);
    app.route('/subjects')
        .post(verify(), subjects.store);
    app.route('/subjects/:id')
        .put(verify(), subjects.update);
    app.route('/subjects/:id')
        .delete(verify(), subjects.destroy);

    // routes classroom
    const classrooms = require('./controller/classrooms');
    app.route('/classrooms')
        .get(verify(), classrooms.findall);
    app.route('/classrooms/findByClass/:id')
        .get(verify(), classrooms.findByClass);
    app.route('/classrooms/findByTeacher/:id')
        .get(verify(), classrooms.findByTeacher);
    app.route('/classrooms/:id')
        .get(verify(), classrooms.find);
    app.route('/classrooms')
        .post(verify(), classrooms.store);
    app.route('/classrooms/:id')
        .put(verify(), classrooms.update);
    app.route('/classrooms/:id')
        .delete(verify(), classrooms.destroy);

    // routes subject matter
    const subjectMatters = require('./controller/subjectMatters');
    app.route('/subjectMatters')
        .get(verify(), subjectMatters.findall);
    app.route('/subjectMatters/findByClassroom/:id')
        .get(verify(), subjectMatters.findByClassroom);
    app.route('/subjectMatters/:id')
        .get(verify(), subjectMatters.find);
    app.route('/subjectMatters')
        .post(verify(), subjectMatters.store);
    app.route('/subjectMatters/:id')
        .put(verify(), subjectMatters.update);
    app.route('/subjectMatters/:id')
        .delete(verify(), subjectMatters.destroy);

    // routes classworks
    const classworks = require('./controller/classworks');
    app.route('/classworks')
        .get(verify(), classworks.findall);
    app.route('/classworks/findBySubjectMatter/:subject_matter_id')
        .get(verify(), classworks.findBySubjectMatter);
    app.route('/classworks/findByStudentSubjectMatter/:student_id/:subject_matter_id')
        .get(verify(), classworks.findByStudentSubjectMatter);
    app.route('/classworks/:id')
        .get(verify(), classworks.find);
    app.route('/classworks')
        .post(verify(), classworks.store);
    app.route('/classworks/:id')
        .put(verify(), classworks.update);
    app.route('/classworks/:id')
        .delete(verify(), classworks.destroy);

    // routes schedule
    const schedules = require('./controller/schedules');
    app.route('/schedules')
        .post(verify(), schedules.store);
    app.route('/schedules/findByClass/:id')
        .get(verify(), schedules.findByClass);
    app.route('/schedules/getScheduleClass/:class_id')
        .get(verify(), schedules.getScheduleClass);
    app.route('/schedules/findByTeacher/:id')
        .get(schedules.findByTeacher);
    app.route('/schedules/getScheduleTeacher/:teacher_id')
        .get(verify(), schedules.getScheduleTeacher);
    app.route('/schedules/:id')
        .delete(verify(), schedules.destroy);

    // routes days
    const days = require('./controller/days');
    app.route('/days')
        .get(verify(), days.findall);

    // routes times
    const times = require('./controller/times');
    app.route('/times')
        .get(verify(), times.findall);

    // routes chat
    const roomchats = require('./controller/roomchats');
    app.route('/roomchats/:classroom_id')
        .get(verify(), roomchats.findall);
    app.route('/roomchats/:classroom_id/:time')
        .get(verify(), roomchats.findByTime);
    app.route('/roomchats')
        .post(verify(), roomchats.store);
}