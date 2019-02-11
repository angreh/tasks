var createError = require('http-errors'),
	express = require('express'),
	path = require('path'),
	cookieParser = require('cookie-parser'),
	logger = require('morgan'),
	methodOverride = require('method-override')


var indexRouter = require('./routes/index'),
	usersRouter = require('./routes/users'),
	clientRouter = require('./routes/client'),
	projectRouter = require('./routes/project'),
	taskRouter = require('./routes/task'),
	projectComment = require('./routes/commentProject')

var app = express()

// view engine setup
//app.set('views', path.join(__dirname, 'views'))
//app.set('view engine', 'jade')

app.use(logger('dev'))
app.use(express.json())
app.use(express.urlencoded({ extended: false }))
app.use(cookieParser())
app.use(express.static(path.join(__dirname, 'public')))

app.use(
	methodOverride( (req,res)=>{
		if( 
			req.body && 
			typeof req.body == 'object' && 
			'_method' in req.body 
		){
			var method = req.body._method
			delete req.body._method
			return method
		} //if
	})
)

app.use(function(req,res,next){
	// Allow crossdomain request - this is loose as hell / fix later
	res.header('Access-Control-Allow-Origin', '*')
	res.header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept')
	next()
})

app.use( '/', indexRouter )
app.use( '/users', usersRouter )
app.use( '/client', clientRouter )
app.use( '/project', projectRouter )
app.use( '/task', taskRouter )
app.use( '/projectcomment', projectComment )

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  	next(createError(404))
})

// error handler
app.use(function(err, req, res, next) {
	// set locals, only providing error in development
	res.locals.message = err.message
	res.locals.error = req.app.get('env') === 'development' ? err : {}

	// render the error page
	res.status(err.status || 500)
	res.render('error')
})

module.exports = app
