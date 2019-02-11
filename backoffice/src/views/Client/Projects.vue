<template>
    <div class="project-page">
        <h1 class="link" v-on:click="addProject">
            {{ $t("Projects") }}
            <i class="material-icons">add_circle_outline</i>
        </h1>

        <div v-if="projects.length">
            <ul>
                <li v-for="project in projects" v-bind:key="project.id">
                    <router-link v-on:click.native="activateTabs" v-bind:to="{ name: 'project', params: { id: clientId, projectid: project.id } }">{{ project.title }}</router-link>
                </li>
            </ul>
        </div>
        <div v-else>
            {{ $t("This client has not a project yet") }}
        </div>
        <br>

    </div>
</template>

<script>
import axios from 'axios'

export default {
    data () {
        return {
            projectName: '',
            clientId: '',
            projects: {}
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
            this.clientId = this.$route.params.id

            const response = await axios.get( 'http://localhost:3000/project/' + this.clientId )
            this.projects = response.data
        },
        async addProject () {
            try {
                const response = await this.$prompt( 
                    this.$t('Title of new project'), 
                    this.$t('Project'),
                    {
                        confirmButtonText: this.$t('Add'),
                        cancelButtonText: this.$t('Cancel')
                    }
                )
                this.projectName = response.value
            }
            catch {
                this.$message({
                    type: 'info',
                    message: this.$t('Add was canceled')
                })
                return
            }
            if( this.projectName && this.clientId )
            {
                await axios.post(
                    'http://localhost:3000/project',
                    {
                        clientId: this.clientId,
                        projectName: this.projectName
                    }
                )
                this.fetchData()

                this.$message({
                    type: 'success',
                    message: this.$t('Add was complete with success')
                })
            }
        },
        activateTabs() {
            this.$root.$data.activeDivs = [ 'tasks' ]
        }
    }
}
</script>

<style>
#projects {
    position: absolute;
    top: 0;
    bottom: 0;
    background: rgb(44, 46, 49);
    left: 200px;
    width: 200px;
    z-index: 4;
    transform: translateX(-380px);
    transition: all 0.5s;
}
#projects.active {
    transform: translateX(0);
}
#projects.unlogged {
    transform: translateX(-380px);
}
#projects h1 {
    color: #999;
}
#projects li a {
    color: #bbb;
}
</style>
