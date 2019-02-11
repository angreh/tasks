var app = require('express')(),
    http = require('http').Server(app),
    io = require('socket.io')(http)

// app.use(function(req,res,next){
//     // Allow crossdomain request - this is loose as hell / fix later
//     res.header('Access-Control-Allow-Origin', '*')
//     res.header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept')
//     next()
// })

// app.get( '/' , ( req, res ) => {
//     res.send('Hello world')
// })

io.on( 'connection', socket => {
    console.log('User connected')
    socket.on( 'chat message', msg => {
        console.log(msg)
        io.emit( 'chat message', msg )
    })
})

http.listen( 3030, () => {
    console.log('Listening 3030')
})