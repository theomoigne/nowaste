var express = require('express');
var router = express.Router();
var InterestPointFactory = require('../factories/interestPointsFactory');

router.get('/', async function(req, res, next) {
    try {
        var InterestPoints = await InterestPointFactory.getInterestPoints();
        res.status(200).json(InterestPoints);
    } catch (err) {
        res.status(500).json(err);
    }
    res.end();
});

module.exports = router;