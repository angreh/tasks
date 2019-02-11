var knex = require('../db/knexfile')

var model = {
    table: 'task',
    all: async (projectId) => {
        return await knex( model.table ).where({project:projectId})
    },
    one: async (taskId) => {
        return await knex( model.table ).where({id:taskId})
    },
    add: (data,res) => {
        projectData = {
            project: data.projectId,
            title: data.taskName,
            status: 1
        }
        knex( model.table )
            .insert(projectData)
            .then(response=>{
                res.send(response)
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