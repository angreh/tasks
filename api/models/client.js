var knex = require('../db/knexfile')

var model = {
    table: 'client',
    all: async () => {
        return await knex( model.table )
    },
    one: async (id) => {
        return await knex( model.table ).where({id:id})
    },
    add: (name,res) => {
        knex( model.table )
            .insert({title:name})
            .then(response => {
                res.send(response)
            })
    },
    update: (data,res) => {
        const id = data.id
        delete data.id
        knex( model.table )
            .where({id:id})
            .update(data)
            .then(() => {
                res.sendStatus(200)
            })
    },
    remove: (id,res) => {
        knex( model.table )
            .where({id:id})
            .del()
            .then(() => {
                res.sendStatus(200)
            })
    }
}

module.exports = model