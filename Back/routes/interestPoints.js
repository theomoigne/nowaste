var express = require('express');
var router = express.Router();
var InterestPointFactory = require('../factories/interestPointsFactory').default;

router.get('/', async function (req, res, next) {
    try {
        var InterestPoints = await InterestPointFactory.getInterestPoints();
        res.status(200).json(InterestPoints);
    } catch (err) {
        res.status(500).json(err);
    }
    res.end();
});

router.get('/', async function (req, res, next) {
    try {
        // For a geo point given as [lng: 1, lat: 1]
        var rangePosition = {
            lng: [0,2],
            lat: [0,2]
        }
        var InterestPoints = await InterestPointFactory.getInterestPointsFollowPosition(rangePosition);
        res.status(200).json(InterestPoints);
    } catch (err) {
        res.status(500).json(err);
    }
    res.end();
});

module.exports = router;