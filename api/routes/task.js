var express = require('express'),
	router = express.Router(),
	model = require('../models/task')

/* GET users listing. */
router.get('/:id', async (req, res) => {
	res.send( await model.one(req.params.id,res) )
})
router.get('/project/:id', async (req, res) => {
	res.send( await model.all(req.params.id) )
})
router.post('/', (req, res) => {
	model.add(req.body,res)
})
router.delete('/remove', (req,res) => {
	model.remove(req.body.id, res)
})

module.exports = router