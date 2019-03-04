
var app = new Vue({
    el: '#app',
    data: {
        message: 'Hello Vue!'
    }
})

var app2 = new Vue({
    el:'#app-2',
    data: {
        items:[
            {pi: 'one'},
            {pi: 'two'},
            {pi: 'three'}
        ]
    }
})

var app3 = new Vue({
        el: '#app-3',
        data: {
            message3: 'i love you .'
        },
        methods: {
            reverseMassage: function(){
                this.message3 = this.message3.split(' ').reverse().join(' ')
            }
        }
    }
)