<template>
	<div id="app">

		<div id="clients" v-bind:class="{ active: clientsIsActive, unlogged: $store.state.unlogged }">
			<Menu/>
			<br><br>
			<div v-on:click="changeLang" style="user-select: none; cursor: pointer;"><h1>pt-br/en</h1></div>
			<div v-on:click="logout" style="user-select: none; cursor: pointer;"><h1>Logout</h1></div>
		</div>

		<div id="projects" v-bind:class="{ active: projectsIsActive, unlogged: $store.state.unlogged }">
			<transition>
				<router-view :key="$route.fullPath"/>
			</transition>
		</div>

		<div id="tasks" v-bind:class="{ active: tasksIsActive, hidden: taskIsActive, unlogged: $store.state.unlogged }">
			<transition>
				<router-view name="tasks" :key="$route.fullPath"/>
			</transition>
		</div>

		<div id="task" v-bind:class="{ active: taskIsActive, hidden: tasksIsActive, unlogged: $store.state.unlogged }">
			<router-view name="task"/>
		</div>

		<div id="default-content" v-bind:class="{ large: tasksIsActive, unlogged: $store.state.unlogged }">
			<transition>
				<router-view name="content" :key="$route.fullPath"/>
			</transition>
		</div>

		<!-- <ChatApp /> -->

	</div><!-- #app -->
</template>

<script>
import Menu from './components/menu/Menu.vue'
import ChatApp from './components/ChatApp.vue'

export default {
	data () {
		return {
			clientsIsActive: false,
			projectsIsActive: false,
			tasksIsActive: false,
			taskIsActive: false
		}
	},
	components: {
		Menu,
		ChatApp
	},
	created () {
		this.getActiveTabs()
		this.unlogged = true
		this.$root.$router.push({ 
			name: 'login'
		})
	},
	watch: {
		'$route': 'getActiveTabs'
	},
	methods: {
		getActiveTabs () {
			var activeTabs = this.$root.$data.activeDivs
			this.clientsIsActive = ( activeTabs.indexOf('clients') == -1 )?false:true
			this.projectsIsActive = ( activeTabs.indexOf('projects') == -1 )?false:true
			this.tasksIsActive = ( activeTabs.indexOf('tasks') == -1 )?false:true
			this.taskIsActive = ( activeTabs.indexOf('task') == -1 )?false:true
		},
		changeLang () {
			var currentLang = this.$i18n.locale
			if( currentLang == 'pt-br' )
			{
				this.$i18n.locale = 'en'
			} else {
				this.$i18n.locale = 'pt-br'
			}
		},
        logout () {
            this.$store.state.unlogged = true
            this.$root.$router.push({ 
                name: 'login'
            })
        }
	}

}
</script>


<style>
	@import "https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.min.css";
	@import "https://fonts.googleapis.com/icon?family=Material+Icons";
	@import "https://fonts.googleapis.com/css?family=Raleway:100,200,300,400,500,600,700,800,900&amp;subset=latin-ext";

	* {
		padding: 0;
		margin: 0;
		font-family: 'Raleway', Arial, Helvetica, sans-serif;
		font-size: 15px;
		font-weight: 400;
		outline: none !important;
	}
	body {
		background: rgb(25, 27, 31);
	}
	html, body {
		height: 100%;
		position: relative;
		width: 100%;
		overflow-x: hidden;
	}
	p {
		line-height: 23px;
	}
	ul {
		list-style: none;
	}
	a.link,
	h1.link {
		display: flex;
	}

	h1 {
		padding: 10px 0 20px;
		font-size: 13px;
		font-weight: 500;
		font-family: 'Raleway', Arial, Helvetica, sans-serif;
		font-weight: 300;
		line-height: 14px;
	}
	h2 {
		font-family: 'Raleway', Arial, Helvetica, sans-serif;
		font-weight: 900;
		font-size: 32px;
	}
	h1.link:hover {
		color: rgb(13, 166, 255) !important;
		cursor: pointer;
	}
	h1 i {
		margin-left: 10px;
	}
	.material-icons {
		font-size: 13px;
		vertical-align: baseline;
	}
	.material-icons.back {
		border: 1px solid;
		border-color: inherit;
		border-radius: 10px;
		margin-left: 10px;
		font-size: 11px;
		line-height: 11px;
		height: 11px;
	}

	#app {
		top: 0;
	}

	#app > div {
		padding: 10px 20px 0 25px;
		box-sizing: border-box;
		box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.5);
	}
	li {
		margin-bottom: 10px;
	}
	a {
		text-decoration: none;
		color: #222;
	}
	a:hover {
		color: rgb(13, 166, 255) !important;
	}

	button {
		padding: 5px 13px 3px 10px;
		background: #555;
		border: 1px solid #444;
		color: #fff;
		margin-bottom: 15px;
	}
	button:hover {
		background: rgb(13, 166, 255);
		color: #222;
	}

	input {
		padding: 3px 8px;
		width: 180px;
		box-sizing: border-box;
		border: #aaa 1px solid;
		margin-top: 20px;
	}
	textarea {
		background: transparent;
		border: none;
		box-sizing: border-box;
		width: 100%;
		color: rgb(13, 166, 255);
		resize: none;
		overflow: hidden;
		line-height: 23px;
	}
	#default-content {
		position: absolute;
		top: 0;
		left: 0;
		bottom: 0;
		transform: translatex(420px);
		z-index: 1;
		width: calc( 100% - 420px );
		transition: all .5s;
		color: #ccc;
	}
	#default-content h1 {
		color: #999;
	}
	#default-content.large {
		transform: translatex(360px);
		width: calc( 100% - 360px );
	}
	#default-content.unlogged {
		transform: translatex(33px);
		width: calc( 100% - 33px );
	}
	#default-content > div {
		position: absolute;
		top: 0;
		box-sizing: border-box;
		padding: 10px;
		width: calc( 100% - 50px );
		height: 100%;
	}

	.project-page {
		position: absolute;
		top: 10px;
		width: calc( 100% - 50px )
	}

	.v-enter-active, .v-leave-active {
		transition: opacity 1s;
	}
	.v-enter, .v-leave-to /* .fade-leave-active below version 2.1.8 */ {
		opacity: 0;
	}
	#chat {
		position: fixed;
		z-index: 200;
		bottom: 0;
		height: 200px;
		width: 50%;
		background-color: rgb(255, 223, 164);
	}
	.el-message {
		top: auto !important;
		bottom: 20px;
		-webkit-box-pack: center;
		-ms-flex-pack: center;
		justify-content: center;
	}
	.el-message-box {
		vertical-align: top !important;
		margin-top: 30px;
	}
	.el-button {
		color: #fff !important;
		background: transparent !important;
		border-color: #fff !important;
	}
	.el-message-box .el-button {
		color: #606266 !important;
		border-color: #dcdfe6 !important;
	}
	.el-button:hover {
		color: #fff !important;
		background: rgb(0, 79, 124) !important;
		border-color: rgb(0, 79, 124) !important;
	}
	.el-button--danger {
		color: #fff !important;
		background: transparent !important;
		border-color: #fff !important;
	}
	.el-button--danger:hover {
		color: #fff !important;
		background: #f56c6c !important;
		border-color: #f56c6c !important;
	}
	.inner-content {
        position: relative;
    }
	.inner-content .left {
		width: 65%;
		float: left;
	}
	.inner-content .right {
		width: 30%;
		float: right;
		text-align: right;
		padding-top: 10px;
	}
</style>
