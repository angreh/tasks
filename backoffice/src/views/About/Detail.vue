<template>
	<div class="about project-page">
		<h1>This is an about page</h1>
		<p>
			Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque vehicula semper nisi, vel 
			mattis lorem ornare id. Maecenas accumsan, dolor sed egestas ultrices, lorem diam malesuada 
			diam, nec scelerisque augue mi nec dui. 
		</p>

		<div 
			class="loading"
			v-if="loading">

			Loading ...
		</div>

		<div 
			class="error"
			v-if="error">

			{{ error }}
		</div>

		<div 
			class="client"
			v-if="client">

			<h5 v-for="c in client" v-bind:key="c.id">
				{{ c.title }}
			</h5>
		</div>
	</div>
</template>

<script>
import axios from 'axios'

export default {
	data () {
		return {
			loading: false,
			client: null,
			error: null
		}
	},
	created () {
		this.fetchData()
	},
	watch: {
		'$route': 'fetchData()'
	},
	methods: {
		async fetchData () {
			this.error = this.client = null
			this.loading = true

			try
			{
				const response = await axios.get('http://localhost:3000/client')
				this.client = response.data
				this.loading = false
			}
			catch ( error ) {
				this.loading = false;
				this.error = error.message
			}
		}
	}
}
</script>




