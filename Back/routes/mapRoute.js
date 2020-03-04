const express = require('express');
const router = express.Router();
const osmsm = require('osm-static-maps');

router.get('/', async function (req, res, next) {
    try {
        var data = { lat: 2.1841, lng: -80.343 };
        const imageBinaryBuffer = await osmsm({data});

        res.set('Content-Type', 'image/png');
        res.status(200).send(imageBinaryBuffer).end();

    } catch (e) {
        res.status(500).end();
    }
});

module.exports = router;