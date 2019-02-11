<template>
    <ul>
        <li v-for="client in clients" v-bind:key="client.id">
            <router-link 
                v-on:click.native="activateTabs" 
                v-bind:to="{ 
                    name: 'client', 
                    params: { 
                        id: client.id 
                    } 
                }">
                    
                {{ client.title }}
            </router-link>
        </li>
    </ul>
</template>

<script>
import axios from 'axios'

export default {
    data() {
        return {
            loading: false,
            clients: null,
            error: null
        }
    },
    created () {
        this.fetchData()
    },
    watch: {
        '$route': 'fetchData'
    },
    methods: {
        async fetchData () {
            this.error = this.clients = null
            this.loading = true

            try 
            {
                const response = await axios.get('http://localhost:3000/client')
                this.clients = response.data
                this.loading = false
            }
            catch ( error ) 
            {
                this.loading = false
                this.error = error.message
            }
        }
    },
    activateTabs () {
        this.$root.$data.activeDivs = [ 'clients','projects' ]
    }
}
</script>
