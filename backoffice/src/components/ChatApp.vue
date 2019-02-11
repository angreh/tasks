<template>
    <div id="chat">
        chat
        <button v-on:click="chat">Message</button>
        <div id="receiver" v-html="chatContent"></div>
    </div>
</template>

<script>
import io from 'socket.io-client'

export default {
    data () {
        return {
            socket: null,
            chatContent: ''
        }
    },
    created () {
        this.socket = io('http://localhost:3030')
        this.socket.on( 'chat message', msg => {
            this.chatContent += msg + "<br>"
        })
    },
    methods: {
        chat () {
            this.socket.emit( 'chat message', 'aloha' )
            console.log('send')
        }
    }
}
</script>

