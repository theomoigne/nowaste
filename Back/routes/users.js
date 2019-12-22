var express = require('express');
var router = express.Router();
//var db = require('./Database/DBFactory');

/* GET users listing. */
router.get('/', function(req, res, next) {
  res.end();
});

module.exports = router;
