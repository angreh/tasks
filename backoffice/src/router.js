import Vue from 'vue'
import Router from 'vue-router'

// import views
import ClientProjects from './views/Client/Projects.vue'
import ClientDetails from './views/Client/Details.vue'
import ProjectTasks from './views/Project/Tasks.vue'
import ProjectDetails from './views/Project/Details.vue'
import Task from './views/Task/Content.vue'

Vue.use(Router)

export default new Router({
	routes: [
		{ 
			path: '/',
			name: 'home',
			components: {
				default() { return import(/* webpackChunckName: "home-details" */ './views/Home/Detail.vue') },
				content() { return import(/* webpackChunckName: "home-content" */ './views/Home/Content.vue') }
			} 
		},
		{
			path: '/login',
			name: 'login',
			components: {
				content () { return import(/* webpackChunckName: "login" */ './views/Login/Login.vue') }
			}
		},
		{
			path: '/about',
			name: 'about',
			// lazy-loaded
			components: {
				default () { return import(/* webpackChunkName: "about-detail" */ './views/About/Detail.vue') },
				content () { return import(/* webpackChunkName: "about-content" */ './views/About/Content.vue') }
			}
		},
		{ 
			path: '/client/:id/projects', 
			name: 'client', 
			components: {
				default: ClientProjects,
				content: ClientDetails
			},
			props: true 
		},
		{ 
			path: '/client/:id/project/:projectid/tasks', 
			name: 'project', 
			components: { 
				tasks: ProjectTasks,
				content: ProjectDetails
			},
			props: true
		},
		{ 
			path: '/client/:id/project/:projectid/task/:taskid', 
			name: 'task', 
			components: { 
				task: Task
			},
			props: true 
		}
	]
})
