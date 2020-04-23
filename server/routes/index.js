const express = require('express');
const router = express.Router();
const path = require('path');

/* GET home page. */

router.get('/', function (req, res) {
  res.sendFile(path.join(__dirname, '../public/dist', 'index.html'));
});

module.exports = router;
