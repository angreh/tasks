var knex = require('../db/knexfile')

var model = {
    table: 'project_comment',
    all: async (projectId) => {
        return await knex( model.table ).where({project:projectId})
    },
    // one: async (id) => {
    //     return await knex( model.table ).where({id:id})
    // },
    add: async (data) => {
        const commentData = {
            user: data.clientId,
            project: data.project,
            comment: data.comment
        }
        return await knex( model.table ).insert(commentData)
    },
    // remove: (id,res) => {
    //     knex( model.table )
    //         .where({id:id})
    //         .del()
    //         .then(() => {
    //             res.sendStatus(200)
    //         })
    // }
}

module.exports = model