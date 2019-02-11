<template>
    <div class="inner-content">
        <div class="left">
            <h1>{{ $t('Client') }}</h1>
            <h2>{{ name }}</h2>
            <p v-show="!edit" v-html="description" v-on:click="switchEdit"></p>
            <div v-show="!edit" v-on:click="switchEdit"><i class="material-icons">edit</i></div>
            <div v-show="edit">
                <textarea 
                    id="client-description"
                    v-model="description"
                    v-on:keyup="textAreaAdjust"
                ></textarea><br>
                <el-button v-on:click="update">{{ $t('Save') }}</el-button>
            </div>
            <br>
            <br>
        </div>
        <div class="right">
            <h1>Additional data</h1>
            <br>
            <br>
            <el-button 
                v-on:click="remove" 
                type="danger" 
                plain>
                
                {{ $t('Delete') }}
            </el-button>
        </div>
    </div>
</template>

<script>
import axios from 'axios'

export default {
    data () {
        return {
            id: '',
            name: '',
            description: '',
            edit: false
        }
    },
    created () {
        this.fetchData()
    },
    watch: {
        '$route': 'fetchData'
    },
    methods: {
        switchEdit () {
            this.edit = !this.edit
            if(this.description) this.description = this.description.replace( /(<br>)/g, "\r\n" )
            if(this.edit) setTimeout(()=>{this.textAreaAdjust()},300)
        },
        textAreaAdjust () {
            const textArea = document.getElementById('client-description')
            textArea.style.height = "inherit";
            textArea.style.height = textArea.scrollHeight + "px";
            textArea.focus()
        },
        async fetchData () {
            this.id = this.$route.params.id

            const response = await axios.get( 'http://localhost:3000/client/' + this.id )
            this.name = response.data[0].title
            this.description = response.data[0].description
        },
        async update () {
            await axios.post('http://localhost:3000/client', {
                id: this.id,
                description: (this.description)?this.description.replace( /(?:\r\n|\r|\n)/g, '<br>' ):'',
                _method: 'put'
            })
            this.edit = !this.edit
            this.fetchData()
        },
        async remove () {
            try 
            {
                await this.$confirm(
                    'This will permanently delete the project. Continue?',
                    'Warning',
                    {
                        confirmButtonText: 'Delete',
                        cancelButtonText: 'Cancel',
                        type: 'warning'
                    }
                )
            }
            catch {
                this.$message({
                    type: 'info',
                    message: 'Delete canceled'
                })
                return
            }

            await axios.post( 'http://localhost:3000/client/remove', {
                id: this.id,
                _method: 'delete'
            })
            document.location.hash = '/'
            this.$message({
                type: 'success',
                message: 'Delete completed'
            })
        }
    }
}
</script>

<style>
    #default-content h1 {
        padding: 10px 0 0 0;
    }
    #default-content h2 {
        padding-bottom: 20px;
    }
</style>