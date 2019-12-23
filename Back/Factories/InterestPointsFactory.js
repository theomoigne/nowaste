var InterestPoint = require('../models/interestPointModel');

var getInterestPoints = async () => {
    try {
        return await InterestPoint.find({}).exec();
    } catch (err){
        console.log(err);
        throw err;
    }
}

module.exports = {
    getInterestPoints
}