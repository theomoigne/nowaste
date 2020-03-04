var assert = require('assert');
const calls = require('./utils/apiCalls');

var response;

describe('/map tests', () => {
    describe('#GET /map', () => {

        before((done) => {
            calls.getMap({})
            .then(res => {
                response = res;
                done();
            }).catch(done);
        });

        it('GET /map expect response have status 200', (done) => {
            assert.equal(response.status, 200);
            done();
        });

        it('GET /map expect response header Content-Type is PNG', (done) => {
            assert.ok(response.headers['content-type'].includes("image/png"));
            done();
        });
    });
});