var vm = new Vue({
    el: '#commentForm',
    data:{
        username:'',
        email:'',
        password:'',
        confirmpassword:'',
        captcha:''
    },
    methods:{
        submit: function(){
                axios({
                    method: "POST",
                    url: "http://localhost:8080/blog/servlet/HomeServlet?method=register",
                    data: {
                            username: this.username,
                            email:this.email,
                            password:this.password,
                    },
                    transformRequest: [function(data) {
                        // Do whatever you want to transform the data
                        let ret = ''
                        for(let it in data) {
                            // 如果要发送中文 编码
                            ret += encodeURIComponent(it) + '=' + encodeURIComponent(data[it]) + '&'
                        }
                        return ret
                    }],
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded'
                    }
                }).then(response => {
                    var data = response.data
                    console.log(data)
                    if(data>0)alert("注册成功！")
                    else alert("注册失败")
                    window.location.href = "http://localhost:8080/blog/home/index.html";
            }).catch(error => console.log(error))
        }
    }
})