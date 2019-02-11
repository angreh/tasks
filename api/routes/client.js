var express = require('express'),
	router = express.Router(),
	client = require('../models/client')

/* GET users listing. */
router.get('/', async (req, res) => {
	res.send( await client.all() )
})
router.get('/:id', async (req,res) => {
	res.send( await client.one(req.params.id) )
})
router.post('/', (req, res) => {
	client.add(req.body.name,res)
})
router.put('/', (req,res)=>{
	client.update(req.body,res)
})
router.delete('/remove', (req,res) => {
	client.remove(req.body.id, res)
})
// router.all('/remove', (req,res)=>{
// 	console.log(req);
// })
module.exports = router