<template>
    <div class="inner-content">
        <div class="left">

            <h1>{{ $t('Task') }}</h1>
            <h2>{{ title }}</h2>

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

            <div style="clear:both;">
                <el-tabs v-model="activeName">
                    <el-tab-pane label="Comments" name="first">
                        <project-comments />
                    </el-tab-pane>
                    <el-tab-pane label="Files" name="second">Files</el-tab-pane>
                    <el-tab-pane label="Log" name="third">Log</el-tab-pane>
                </el-tabs>
            </div>

        </div>
        <div class="right">
            <h1>Additional data</h1>
            <br>
            Data início e fim <br>
            Tempo gasto <br>
            Usuários <br>
            <br>
            <el-button 
                v-on:click="remove" 
                type="danger" 
                plain>
                
                {{ $t('Delete') }}
            </el-button>
        </div>

    </div><!-- .inner-content -->
</template>

<script>
import axios from 'axios'
import ProjectComments from '../../components/comments/ProjectComments.vue'

export default {
    data () {
        return {
            activeName: 'first',
            id: '',
            title: '',
            edit: false,
            description: ''
        }
    },
    components: {
		'project-comments': ProjectComments
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
            this.id = this.$route.params.projectid

            const response = await axios.get( 'http://localhost:3000/project/' + this.id + '/details' )
            this.title = response.data[0].title
            this.description = response.data[0].description
        }, // fetchData
        async update () {
            await axios.post('http://localhost:3000/project', {
                id: this.id,
                description: (this.description)?this.description.replace( /(?:\r\n|\r|\n)/g, '<br>' ):'',
                _method: 'put'
            })
            this.edit = !this.edit
            this.fetchData()
        },
        async remove () {
            try {
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

            await axios.post( 'http://localhost:3000/project/remove', {
                id: this.id,
                _method: 'delete'
            })
            
            this.$root.$data.activeDivs = [ 'clients', 'projects' ]
            this.$root.$router.push({ 
                name: 'client', 
                params: { 
                    id: this.$route.params.id
                } 
            })
            this.$message({
                type: 'success',
                message: 'Delete completed'
            })
        } // remove
    }
}
</script>

<style>
.el-tabs {
    padding-top: 60px;
}
.el-tabs__nav-wrap::after {
    background-color: #555 !important;
}
.el-tabs__item {
    color: #777 !important;
}
.el-tabs__item.is-active {
    color: rgb(13, 166, 255) !important;
}
</style>