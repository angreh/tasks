var options = {
		development: {
			client: 'mysql',
			connection: {
				host: 'localhost',
				user: 'angreh',
				password: '12345678',
				database: 'tasks'
			}
		},
		production: {
			client: 'mysql',
			connection: {
				host: 'localhost',
				user: 'angreh',
				password: '12345678',
				database: 'tasks'
			}
		}
	},
	environment = process.env.NODE_ENV || 'development',
	config = options[environment]

module.exports = require('knex')(config)