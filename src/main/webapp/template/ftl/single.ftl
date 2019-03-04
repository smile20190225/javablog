<!DOCTYPE html>
<html lang="en">
<head>
    <base href="http://localhost:8080/blog/">
    <link rel="icon" href="static/img/wy_img2.jpg" type="image/x-icon"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>来读一篇文章吧~</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width">
    <link rel="stylesheet" href="static/css/bootstrap.min.css">
    <link rel="stylesheet" href="static/css/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="static/css/style.css" id="theme-styles">
</head>
<body>
<div id="singlevm">
    <header>
        <div class="widewrapper masthead">
            <div class="container">
                <a href="home/index.html" id="logo">
                    <img src="static/img/logo.png" alt="clean Blog">
                </a>

                <div id="mobile-nav-toggle" class="pull-right">
                    <a href="#" data-toggle="collapse" data-target=".clean-nav .navbar-collapse">
                        <i class="fa fa-bars"></i>
                    </a>
                </div>

                <nav class="pull-right clean-nav">
                    <div class="collapse navbar-collapse">
                        <ul class="nav nav-pills navbar-nav">
                            <li>
                                <a href="home/index.html">首页</a>
                            </li>
                            <li>
                                <a href="home/about.html">关于我们</a>
                            </li>
                            <li>
                                <a href="home/contact.html">联系我们</a>
                            </li>
                        </ul>
                    </div>
                </nav>

            </div>
        </div>

        <div class="widewrapper subheader">
            <div class="container">
                <div class="clean-breadcrumb">
                    <a href="#">Blog</a>
                    <span class="separator">&#x2F;</span>
                    <a href="#">Bootstrap</a>
                    <span class="separator">&#x2F;</span>
                    <a href="#">HTML Template</a>
                </div>


                <div class="clean-searchbox">
                    <form action="#" method="get" accept-charset="utf-8">
                        <input class="searchfield" id="searchbox" type="text" placeholder="Search">
                        <button class="searchbutton" type="submit">
                            <i class="fa fa-search"></i>
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </header>

    <div class="widewrapper main">
        <div class="container">
            <div class="row">
                <div class="col-md-8 blog-main">
                    <article class="blog-post">
                        <header>

                            <div class="lead-image">
                                <img src="static/img/single-post.jpg" alt="" class="img-responsive">

                            </div>
                        </header>
                        <div class="body">
                            <h1>${article.title}</h1>
                            <div class="meta">
                                <i class="fa fa-user"></i> <a href="'user/index.html?bloggerid='+articleUser.userid">${articleUser.username}</a>
                                <i class="fa fa-calendar"></i>${article.publictime}
                                <i class="fa fa-comments"></i>
                                <span class="data">
                                    <a href="#comments">${article.commentcount} Comments</a>
                                </span>
                            </div>${article.content}</div>
                    </article>

                    <aside class="social-icons clearfix">
                        <h3>Share on </h3>
                        <a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i class="fa fa-twitter"></i></a> <a href="#"><i class="fa fa-google"></i></a>
                    </aside>

                    <aside class="comments" id="comments">
                        <hr>

                        <h2><i class="fa fa-comments"></i> ${article.commentcount} 评论</h2>


                        <#list ucSet as uc>
                            <article class="comment">
                                <header class="clearfix">
                                    <img src="static/img/avatar.png" alt="A Smart Guy" class="avatar">
                                    <div class="meta">
                                        <h3><a href="#">${uc.username}</a></h3>
                                        <span class="date">${uc.commenttime}
                                    </span>
                                        <span class="separator">
                                        -
                                    </span>
                                        <a class="reply-link">回复</a>
                                    </div>
                                </header>
                                <div class="body">
                                    <#if uc.commentcontent??>
                                        ${uc.commentcontent}
                                    </#if>
                                </div>
                            </article>

                            <#if uc.replyid??>
                                <article class="comment reply">
                                    <header class="clearfix">
                                        <img src="static/img/avatar.png" alt="A Smart Guy" class="avatar">
                                        <div class="meta">
                                            <h3><a href="#">${uc.realname}</a></h3>
                                            <span class="date">${uc.replytime}
                                                </span>
                                        </div>
                                    </header>
                                    <div class="body">
                                        ${uc.replycontent}
                                    </div>
                                </article>
                            </#if>
                        </#list>


                        <aside class="create-comment" id="create-comment">
                            <hr>

                            <h2><i class="fa fa-pencil"></i>我想说两句</h2>

                            <form action="servlet/HomeServlet?method=addComment" onsubmit="return check()" method="post">
                                <#if loginUser??>
                                    <input type="hidden" name="userid" value="loginUser.userid">
                                    <input type="hidden" name="articleid" value="article.articleid">
                                    <input type="hidden" name="where" value="0">
                                </#if>
                                <textarea rows="4" name="commentcontent" id="comment-body" placeholder="Your Message" class="form-control input-lg"></textarea>
                                <div class="buttons clearfix">
                                    <button type="submit" class="btn btn-xlarge btn-clean-one" >提交评论</button>
                                </div>
                            </form>
                        </aside>
                </div>
                <aside class="col-md-4 blog-aside">

                    <div class="aside-widget">
                        <header>
                            <h3>最热门文章</h3>
                        </header>
                        <div class="body">
                            <ul class="clean-list">
                                <#assign index=0/>
                                <#list hotSet?sort_by("commentcount") as hotArticle>
                                    <li><a href="${hotArticle.url}">${hotArticle.title}</a></li>
                                <#assign index=index+1/>
                                <#if index==6><#break></#if>
                                </#list>
                            </ul>
                        </div>
                    </div>

                    <div class="aside-widget">
                        <header>
                            <h3>最新发表文章</h3>
                        </header>
                        <div class="body">
                            <ul class="clean-list">

                                <#assign index=0/>
                                <#list newSet?sort_by("publictime")?reverse as newArticle>
                                    <li><a href="${newArticle.url}">${newArticle.title}</a></li>
                                    <#assign index=index+1/>
                                    <#if index==5><#break></#if>
                                </#list>
                            </ul>
                        </div>
                    </div>

                    <div class="aside-widget">
                        <header>
                            <h3>Tags</h3>
                        </header>
                        <div class="body clearfix">
                            <ul class="tags">
                                <li><a href="#">HTML5</a></li>
                                <li><a href="#">CSS3</a></li>
                                <li><a href="#">COMPONENTS</a></li>
                                <li><a href="#">TEMPLATE</a></li>
                                <li><a href="#">PLUGIN</a></li>
                                <li><a href="#">BOOTSTRAP</a></li>
                                <li><a href="#">TUTORIAL</a></li>
                                <li><a href="#">UI/UX</a></li>
                            </ul>
                        </div>
                    </div>
                </aside>
            </div>
        </div>
    </div>

    <footer>
        <div class="widewrapper footer">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 footer-widget">
                        <h3> <i class="fa fa-user"></i>About</h3>

                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab animi laboriosam nostrum consequatur fugiat at, labore praesentium modi, quasi dolorum debitis reiciendis facilis, dolor saepe sint nemo, earum molestias quas.</p>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolorum, error aspernatur assumenda quae eveniet.</p>
                    </div>

                    <div class="col-md-4 footer-widget">
                        <h3> <i class="fa fa-pencil"></i> Recent Post</h3>
                        <ul class="clean-list">
                            <li><a href="">Clean - Responsive HTML5 Template</a></li>
                            <li><a href="">Responsive Pricing Table</a></li>
                            <li><a href="">Yellow HTML5 Template</a></li>
                            <li><a href="">Blackor Responsive Theme</a></li>
                            <li><a href="">Portfolio Bootstrap Template</a></li>
                            <li><a href="">Clean Slider Template</a></li>
                        </ul>
                    </div>

                    <div class="col-md-4 footer-widget">
                        <h3> <i class="fa fa-envelope"></i>Contact Me</h3>

                        <p>Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet.</p>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil fugiat, cupiditate veritatis excepturi tempore explicabo.</p>
                        <div class="footer-widget-icon">
                            <i class="fa fa-facebook"></i><i class="fa fa-twitter"></i><i class="fa fa-google"></i>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <div class="widewrapper copyright">
            Copyright 2015
        </div>
    </footer>
</div>
<script src="static/js/jquery.min.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<script src="static/js/modernizr.js"></script>
<script>
    function check(){
        if(isLogin == 0){
            alert("请先登录再评论")
            return false;
        }
        return true;
    }
</script>

</body>
</html>