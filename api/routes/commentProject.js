var express 	= require('express'),
	router 		= express.Router(),
	comments	= require('../models/commentProject')

router.get('/:id', async (req, res) => {
	res.send( await comments.all(req.params.id) )
})
// router.get('/:id/details', async (req, res) => {
// 	res.send( await project.one(req.params.id) )
// })
router.post('/', async (req, res) => {
	res.send( await comments.add(req.body) )
})
// router.delete('/remove', (req,res) => {
// 	project.remove(req.body.id, res)
// })


module.exports = router