var express = require('express');
var router = express.Router();
const studentController = require('../controllers/studentController');

/* GET home page. */
router.get('/', studentController.studentsList);
router.post('/add-student', studentController.studentsAdd);
module.exports = router;
