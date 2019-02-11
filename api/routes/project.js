var express = require('express'),
	router = express.Router(),
	project = require('../models/project')

/* GET users listing. */
router.get('/:id', async (req, res) => {
	res.send( await project.all(req.params.id) )
})
router.get('/:id/details', async (req, res) => {
	res.send( await project.one(req.params.id) )
})
router.post('/', (req, res) => {
	project.add(req.body,res)
})
router.put('/', async (req,res)=>{
	res.sendStatus( await project.update(req.body) )
})
router.delete('/remove', (req,res) => {
	project.remove(req.body.id, res)
})


module.exports = router