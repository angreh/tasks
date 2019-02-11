var knex = require('../db/knexfile')

var model = {
    table: 'project',
    all: async (clientId) => {
        return await knex( model.table ).where({client:clientId})
    },
    one: async (id) => {
        return await knex( model.table ).where({id:id})
    },
    add: (data,res) => {
        projectData = {
            client: data.clientId,
            title: data.projectName
        }
        knex( model.table )
            .insert(projectData)
            .then(response=>{
                res.send(response)
            })
    },
    update: async (data) => {
        const id = data.id
        delete data.id

        try {
            await knex( model.table )
                .where({id:id})
                .update(data)

            return 200
        } 
        catch {
            return 500
        }
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