<template>
    <div>
        <h1>{{ $t("System") }}</h1>

        <page-list />

        <h1 class="link" v-on:click="addClient">
            {{ $t("Clients") }}
            <i class="material-icons">add_circle_outline</i>
        </h1>

        <client-list />
        
    </div>
</template>

<script>
import axios from 'axios'

import PageList from './pages/PageList'
import ClientList from './clients/ClientList'

export default {
    data () {
        return {
            loading: false,
            clients: null,
            error: null,
            clientName: ''
        }
    },
    components: {
        'page-list': PageList,
        'client-list': ClientList
    },
    methods: {
        async addClient () {
            try {
                const response = await this.$prompt( 
                    this.$t('Name of new client'), 
                    this.$t('Client'), {
                        confirmButtonText: this.$t('Add'),
                        cancelButtonText: this.$t('Cancel')
                    }
                )
                this.clientName = response.value
            }
            catch {
                this.$message({
                    type: 'info',
                    message: this.$t('Add was canceled')
                })
                return
            }

            if( this.clientName )
            {
                await axios.post(
                    'http://localhost:3000/client',
                    {
                        name: this.clientName
                    }
                )
                this.fetchData()
                
                this.$message({
                    type: 'success',
                    message: this.$t('Add was complete with success')
                })
            }
        }
    }
}
</script>

<style>
#clients {
    position: absolute;
    top: 0;
    bottom: 0;
    background: rgb(54, 58, 61);
    width: 200px;
    height: 100%;
    z-index: 5;
    transform: translateX(-190px);
    transition: all 0.5s;
}
#clients.active {
    transform: translateX(0);
}
#clients.unlogged {
    transform: translateX(-190px);
}
#clients a.router-link-exact-active.router-link-active {
    font-weight: 900;
    color: rgb(13, 166, 255);
}
#clients h1 {
    color: #aaa;
}
#clients li a {
    color: #ddd;
}
</style>

