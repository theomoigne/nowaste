var app = require('../../app');
var request = require('supertest');
var agent = request.agent(app);
var db = require('../../factories/databaseMariaFactory');

const getPoints = () => 
    new Promise((resolve, error) => 
        agent.get('/api/points/')
        .end((err, res) => 
            err ? error(err) : resolve(res)
        )
    )

const getPointsNear = (position) => 
    new Promise((resolve, error) => 
        agent.get('/api/points/nearMe')
            .send({position})
            .end((err, res) => 
                err ? error(err) : resolve(res)
            )
    )

const regiterDummy = (data) => 
    new Promise((resolve, error) => 
        agent.post('/api/users/register')
            .send(data)
            .end((err, res) => 
                err ? error(err) : resolve(res)
            )
    )

const loginDummy = (data) => 
    new Promise((resolve, error) => 
        agent.post('/api/users/login')
            .send(data)
            .end((err, res) => 
                err ? error(err) : resolve (res)
            )
    )

const loginDummyWithToken = (token) => 
    new Promise((resolve, error) => 
        agent.post('/api/users/login')
            .set('Authorization', token)
            .end((err, res) => 
                err ? error(err) : resolve(res)
            )
    )

const loginDummyWithDataAndToken = (token, data) => 
    new Promise((resolve, error) => 
        agent.post('/api/users/login')
            .set('Authorization', token)
            .send(data)
            .end((err, res) => 
                err ? error(err) : resolve(res)
            )
    )


const deleteDummy = (data) =>
    new Promise((resolve, error) => 
        db.query(`delete from users where name='${data.name}' and email='${data.email}'`) 
            .then(res => resolve() )
            .catch(err =>  error(err) )
    );

const getMap = (data) => 
    new Promise((resolve, error) =>
        agent.get('/api/map')
            .send(data)
            .end((err, res) => 
                err ? error(err) : resolve(res)
            )
    );


module.exports = {
    getPoints,
    getPointsNear,
    regiterDummy,
    loginDummy,
    loginDummyWithToken,
    loginDummyWithDataAndToken,
    deleteDummy,
    getMap
}