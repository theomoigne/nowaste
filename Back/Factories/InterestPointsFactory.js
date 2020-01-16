var InterestPoint = require('../models/interestPointModel');

var getInterestPoints = async () => {
    try {
        return await InterestPoint.find({}).exec();
    } catch (err) {
        console.log(err);
        throw err;
    }
}

var getInterestPointsFollowPosition = async (rangePosition) => {
    try {
        return await InterestPoint.find({
            "coordinates.0": {
                $range: rangePosition.lng
            },
            "coordinates.1": {
                $range: rangePosition.lat
            }
        }).exec();
    } catch (err) {
        console.log(err);
        throw err;
    }
}

module.exports = {
    getInterestPoints,
    getInterestPointsFollowPosition
}