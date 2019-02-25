<html>
<head>
    <base href="http://localhost:8080/blog/"><link rel="icon" href="static/img/wy_img2.jpg" type="image/x-icon"/>
</head>
<body>
<h2>Hello World!</h2>
<form action="/blog/servlet/TestServlet" method="post">
    <input type="submit" value="submit"/>
</form>

<form action="/blog/servlet/HomeServlet?method=register" method="post">
    <input type="submit" value="submit2"/>
</form>
</body>
</html>
