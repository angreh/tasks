<template>
    <div class="page-tasks">
        <h1 class="link" v-on:click="addTask()">
            {{ $t("Tasks") }}
            <i class="material-icons">add_circle_outline</i>
        </h1>
        
        <div v-if="tasks.length">
            <ul>
                <li v-for="task in tasks" v-bind:key="task.id">
                    <router-link
                        v-on:click.native="activateTabs()"
                        v-bind:to="{ 
                            name: 'task', 
                            params: { 
                                id: clientId,
                                projectid: projectId,
                                taskid: task.id
                            } 
                        }">
                        
                        <span>[#{{ task.id }}]</span> {{ task.title }}
                    </router-link>
                </li>
            </ul>
        </div>
        <div v-else>
            {{ $t('This project has not tasks') }}
        </div>

        <br>

        <router-link 
            class="link"
            v-on:click.native="activateTabsBack()"
            v-bind:to="{ 
                name: 'client', 
                params: { 
                    id:this.$route.params.id,
                }
            }">
            {{ $t('Back') }}
            <i class="material-icons back">arrow_back</i>
        </router-link>


    </div>
</template>

<script>
import axios from 'axios'

export default {
    data () {
        return {
            taskName: '',
            projectId: '',
            clientId: '',
            tasks: {}
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
            this.projectId = this.$route.params.projectid
            this.clientId = this.$route.params.id

            const response = await axios.get( 'http://localhost:3000/task/project/' + this.projectId )
            this.tasks = response.data
        },
        async addTask () {
            try {
                const newTaskName = await this.$prompt( 
                    this.$t('Title of new task'), 
                    this.$t('Task'),
                    {
                        confirmButtonText: this.$t("Add"),
                        cancelButtonText: this.$t("Cancel")
                    }
                )
                this.taskName = newTaskName.value
            }
            catch {
                this.$message({
                    type: 'info',
                    message: this.$t('Add was canceled')
                })
                return
            }

            if( this.projectId && this.taskName )
            {
                await axios.post(
                    'http://localhost:3000/task',
                    {
                        projectId: this.projectId,
                        taskName: this.taskName
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
            this.$root.$data.activeDivs = [ 'task' ]
        },
        activateTabsBack() {
            this.$root.$data.activeDivs = [ 'clients','projects' ]
        }
    }
}
</script>

<style>
#tasks {
    position: absolute;
    top: 0;
    bottom: 0;
    background: rgb(37, 40, 43);
    width: 330px;
    transition: all .5s;
    overflow-x: hidden;
    left: 0px;
    transform: translateX(80px);
    z-index: 3;
}
#tasks.active {
    transform: translateX(20px);
    left: 0px;
}
#tasks.hidden {
    transform: translateX(-300px);
    left: 0px;
}
#tasks.unlogged {
    transform: translateX(-300px);
}
.page-tasks {
    position: absolute;
    top: 10px;
    width: 280px;
}
#tasks li a span,
#tasks a.link,
#tasks h1 {
    color: #777;
    font-size: 12px;
}
#tasks,
#tasks li a {
    color: #aaa;
}
</style>
