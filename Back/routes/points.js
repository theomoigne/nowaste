var express = require('express');
var router = express.Router();
var InterestPoint = require('../Models/InterestPoint');

router.get('/', function(req, res, next) {
    InterestPoint.find({}, (err, points)=>{
        if(err) console.log(err);
        console.log(points);
        res.status(200).json(points);
        res.end();
    });
});

module.exports = router;