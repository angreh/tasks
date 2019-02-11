<template>
    <div>
        <div class="login-card">
            <h2>Login</h2>

            <label for="email">{{ $t('Email') }}</label>
            <input type="text" id="email">

            <label for="password">{{ $t('Password') }}</label>
            <input type="text" id="password">

            <div class="buttons">
                <button
                    v-on:click="login"
                >
                Login
                </button>
            </div>
        </div><!-- .login-card -->
    </div>
</template>

<script>
export default {
	methods: {
        login () {
            this.$store.state.unlogged = false
            this.$root.$router.push({ 
                name: 'home'
            })
        }
    }
}
</script>

<style>
.login-card {
    width: 300px;
    position: absolute;
    left: 50%;
    margin-left: -150px;
    top: 100px;
}
.login-card input[type='text'] {
    display: block;
    box-sizing: border-box;
    width: 100%;
    margin: 0 0 20px 0;
}
.login-card .buttons {
    text-align: right;
}
</style>
