var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var schema = {
    name: String,
    creationDate: Date,
    dueDate: Date,
    type: String,
    lat: Number,
    lng: Number
};

var interestPoint = new Schema(schema);

module.exports = mongoose.model('InterestPoint', interestPoint, 'InterestPoints');