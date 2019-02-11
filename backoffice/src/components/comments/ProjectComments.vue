<template>
    <div>
        <ul>
            <li v-for="comment in comments" v-bind:key="comment.id">
                - {{ comment.comment }}
            </li>
        </ul>

        <div class="form">
            <textarea v-model="comment" placeholder="Comment aqui"></textarea>
            <button v-on:click="addComment">Enviar</button>
        </div>
    </div>
</template>

<script>
import axios from 'axios'

export default {
    data () {
        return {
            loading: false,
            comments: null,
            comment: '',
            error: null
        }
    },
    created () {
        this.fetchData()
    },
    methods: {
        async fetchData () {
            this.error = this.clients = null
            this.loading = true

            try 
            {
                const response = await axios.get( 'http://localhost:3000/projectcomment/' + this.$route.params.projectid )
                this.comments = response.data
                this.loading = false
            }
            catch ( error ) 
            {
                this.loading = false
                this.error = error.message
            }
        },
        async addComment () {
            if( this.comment )
            {
                await axios.post(
                    'http://localhost:3000/projectcomment',
                    {
                        comment: this.comment,
                        project: this.$route.params.projectid,
                        user: 1
                    }
                )
                this.fetchData()
                this.comment = ''
            }
        }
    }
}
</script>