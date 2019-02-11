<template>
    <div class="inner-content">
        <div class="left">
            <h1>{{ $t('Task') }}</h1>
            <h2>{{ taskTitle }}</h2>

            <p>{{ taskStatus }}</p>

            <h1
                v-on:click="back"
                class="link"
            >
                {{ $t('Back') }}
                <i class="material-icons back">arrow_back</i>
            </h1>
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
    </div><!-- .inner-content -->
</template>

<script>
import axios from 'axios'

export default {
    data () {
        return {
            taskTitle: '',
            taskStatus: '',
            taskId: null
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
            this.taskId = this.$route.params.taskid

            const response = await axios.get( 'http://localhost:3000/task/' + this.taskId )
          
            this.taskTitle = response.data[0].title
            this.taskStatus = response.data[0].status
        },
        activateTabs() {
            this.$root.$data.activeDivs = [ 'tasks' ]
        },
        async remove () {
            try {
                await this.$confirm(
                    'This will permanently delete the task. Continue?',
                    'Warning',
                    {
                        confirmButtonText: 'Delete',
                        cancelButtonText: 'Cancel',
                        type: 'warning'
                    }
                )
            } catch {
                this.$message({
                    type: 'info',
                    message: 'Delete canceled'
                })
                return //abort the action
            }

            await axios.post( 'http://localhost:3000/task/remove', {
                id: this.taskId,
                _method: 'delete'
            })

            this.$root.$data.activeDivs = [ 'tasks' ]
            this.$root.$router.push({ 
                name: 'project', 
                params: { 
                    id: this.$route.params.id,
                    projectid: this.$route.params.projectid
                } 
            })
            this.$message({
                type: 'success',
                message: 'Delete completed'
            })

        },
        back () {
            this.activateTabs()
            this.$root.$router.push({ 
                name: 'project', 
                params: { 
                    id:this.$route.params.id,
                    tasksid:this.taskId
                }
            })
        }
    }
}
</script>

<style>
	#task {
		position: absolute;
		top: 0;
		bottom: 0;
		background: rgb(0, 79, 124);
		transition: all 0.5s;
		width: 420px;
		overflow-x: hidden;
		left: 0;
		z-index: 2;
        color: #fff;
	}
	#task.hidden {
		width: 360px;
	}
	#task.active {
		left: 30px;
		width: calc( 100% - 30px );
	}
    #task.unlogged {
        transform: translateX(-387px);
        background-color: rgb(13, 166, 255)
    }
    #task h1 {
        padding: 10px 0 0 0;
    }
    #task h2 {
        padding-bottom: 30px;
    }
</style>
