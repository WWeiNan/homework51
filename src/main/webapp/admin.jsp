<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--<!DOCTYPE html>-->
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<meta name="viewport"
		  content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<meta name='viewport' content="width=device-width,initial-scale=1" />
	<!--上面3个标签必须有，必须放在最前面
            viewport用来适配移动端显示效果
        -->
	<title>云平台管理首页</title>
	<!--引入BootStrap样式-->
	<!-- <link rel="stylesheet" href="docs.min.css">-->
	<!--引入BootStrap样式-->
	<link rel="stylesheet"
		  href="css/bootstrap-theme.min.css" />
	<link rel="stylesheet"
		  href="css/bootstrap.min.css" />

	<!--引入jQuery：Bootstrap的js文件依赖jQuery，所以必须优先引入jQuery-->
	<script src="js/jquery-2.1.3.min.js"></script>
	<!--引入Bootstrap的js文件-->
	<script src="js/bootstrap.min.js"></script>
	<script src="js/highcharts.js"></script>
	<script src="js/modules/exporting.js"></script>

	<script type="text/javascript">
        window.onload=function(){
            var username;
            var status;
            changeUser = function(operate , flag){
                switch (operate) {
                    case "remove":window.location="${pageContext.request.contextPath}/user/delUser.do?username=111";break;
                    case "changeStatu":window.location="修改状态的URL？username=  & status";break;
                    case "findu": document.getElementById("form1").submit();break;
                    default: username=operate; status=flag;
					               
					                  
                }
            };
            updateUser = function(id){
                var utds =$("#updateTr").children();
                var xtds = $("#"+id).children();
                for(var i=0; i<utds.length-1; i++){
                    var uutds = $(utds[i]).children().get(0);
                    if(uutds.name=="accountSource"){
                        var uos = uutds.options;
                        for(var j=0; j<uos.length; j++){
                            var text = xtds[i].innerHTML;
                            if(uos[j].value==text){
                                uos[j].selected=true;
                            }
                        }
                        continue;
                    };
                    if(uutds.name=="status"){
                        var uos = uutds.options;
                        for(var j=0; j<uos.length; j++){
                            var text = $(xtds[i]).text().trim();
                            if(text=="激活"){
                                if(uos[j].value=="0"){
                                    uos[j].selected=true;
                                }
                            }else{
                                if(uos[j].value=="1"){
                                    uos[j].selected=true;
                                }
                            }
                        }
                        continue;
                    };
                    uutds.value=$(xtds[i]).text();
                }
            }

            $(function () {
                var chart;
                $(document).ready(function() {
                    chart = new Highcharts.Chart({
                        chart: {
                            renderTo: 'container',
                            plotBackgroundColor: null,



                            plotBorderWidth: null,
                            plotShadow: false
                        },
                        title: {
                            text: 'Browser market shares at a specific website, 2010'
                        },
                        tooltip: {
                            formatter: function() {
                                return '<b>'+ this.point.name +'</b>: '+ this.percentage +' %';
                            }
                        },
                        plotOptions: {
                            pie: {
                                allowPointSelect: true,
                                cursor: 'pointer',
                                dataLabels: {
                                    enabled: true,
                                    color: '#000000',
                                    connectorColor: '#000000',
                                    formatter: function() {
                                        return '<b>'+ this.point.name +'</b>: '+ this.percentage +' %';
                                    }
                                },
                                showInLegend: true
                            }
                        },
                        series: [{
                            type: 'pie',
                            name: 'Browser share',
                            data: [
                                ['Firefox',   45.0],
                                ['IE',       26.8],
                                {
                                    name: 'Chrome',
                                    y: 12.8,
                                    sliced: true,
                                    selected: true
                                },
                                ['Safari',    8.5],
                                ['Opera',     6.2],
                                ['Others',   0.7]
                            ]
                        }]
                    });
                });

            });




        }
        // 分页查询所有员工
        function  test(){
            var  count=$("#c").val();
            alert(count)
            location.href="${pageContext.request.contextPath}/user/findAllUser.do?count="+count;
        }
        // 模糊查询用户
        function  test1(){
            var  count=$("#c1").val();
            location.href="${pageContext.request.contextPath}/user/findLikeUsername.do?count="+count;
        }
        // 根据主键用户名删除用户
       function delUser(username) {
            if(confirm("确定要删除吗？")){
                 location.href="${pageContext.request.contextPath}/user/delUser.do?username="+username;
            }
        }
        // 上一页
        function showPrevious(currentPage,count,totalPage) {
            if(currentPage>1 &&currentPage<=totalPage){
                var currentPage=currentPage-1;
                location.href="${pageContext.request.contextPath}/user/findAllUser.do?currentPage="+currentPage+"&&count="+count
            }
       }
       // 下一页
       function showNext(currentPage,count,totalPage) {
           if(currentPage>=1 &&currentPage<totalPage){
               var currentPage=currentPage+1;
               location.href="${pageContext.request.contextPath}/user/findAllUser.do?currentPage="+currentPage+"&&count="+count
           }
       }

        // 模糊查询上一页
        function showPreviousLike(currentPage,count,totalPage) {
            if(currentPage>1 &&currentPage<=totalPage){
                var currentPage=currentPage-1;
                location.href="${pageContext.request.contextPath}/user/findLikeUsername.do?currentPage="+currentPage+"&&count="+count
            }
        }
        // 模糊查询下一页
        function showNextLike(currentPage,count,totalPage) {
            if(currentPage>=1 &&currentPage<totalPage){
                var currentPage=currentPage+1;
                location.href="${pageContext.request.contextPath}/user/findLikeUsername.do?currentPage="+currentPage+"&&count="+count
            }
        }



       // 改变用户状态
       function  changeUserStatus(username,status) {
           if("激活"==(status)){
               if(confirm("请问是否确定冻结该用户")){
                   location.href="${pageContext.request.contextPath}/user/changeUserStatus.do?username="+username+"&&userStatus="+status
               }
           }else if("冻结"==(status)){
               if(confirm("请问是否激活该用户")){
                   location.href="${pageContext.request.contextPath}/user/changeUserStatus.do?username="+username+"&&userStatus="+status
               }
           }
       }
        function selectUser(username){
            $.ajax({
                url:"${pageContext.request.contextPath}/user/selectByUsername.do?username="+username,
                type:"GET",
                dataType:"json",

                success:function(user){
                    $("#username").prop("value",user.username);
                    $("#password").prop("value",user.password);
                    $("#phone").prop("value",user.phone);
                    $("#email").prop("value",user.email);
                    $("#systemSource").prop("value",user.systemSource);
                }
            });
            $('#updateUserForm').modal({
                backdrop:false,
                keyboard:true,
                show:false
            });
        }


	</script>`
	<style type="text/css">
		.pagination {
			display: inline-block;
			padding-left: 0;
			margin: 20px 0;
			border-radius: 4px;
		}

		.pagination ul {
			display: inline-block;
			margin-left: 0;
			margin-bottom: 0;
			-webkit-border-radius: 4px;
			-moz-border-radius: 4px;
			border-radius: 4px;
			-webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05);
			-moz-box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05);
			box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05);
		}

		ul>li {
			display: inline;
		}

		li {
			line-height: 20px;
		}

		.pagination ul>li:first-child>a,.pagination ul>li:first-child>span {
			border-left-width: 1px;
			-webkit-border-top-left-radius: 4px;
			-moz-border-radius-topleft: 4px;
			border-top-left-radius: 4px;
			-webkit-border-bottom-left-radius: 4px;
			-moz-border-radius-bottomleft: 4px;
			border-bottom-left-radius: 4px;
		}

		.pagination ul>li>a:hover,.pagination ul>li>a:focus,.pagination ul>.active>a,.pagination ul>.active>span
		{
			background-color: #f5f5f5;
		}

		.pagination ul>li>a,.pagination ul>li>span {
			float: left;
			padding: 4px 12px;
			line-height: 20px;
			text-decoration: none;
			background-color: #ffffff;
			border: 1px solid #dddddd;
			border-left-width: 0;
		}
	</style>

</head>
<body>
<div class="container-fluid" style="width: 1324px">
	<!--标题-->
	<div class="row show-grid">

		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">

					<li style="cursor: pointer"><a class="navbar-brand">云平台运营系统</a></li>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse"
					 id="bs-example-navbar-collapse-1">




					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
												data-toggle="dropdown" role="button" aria-expanded="false">${sessionScope.loginRole}[${sessionScope.loginAdmin
												.username}]
							<span class="caret"></span>
						</a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="#">个人资料</a></li>
								<li class="divider"></li>
								<li><a href="${pageContext.request.contextPath}/exit/exit.do">退出</a></li>
							</ul></li>
					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
		</nav>
	</div>
	<!--左侧菜单-->
	<div class="row show-grid ">
		<div class="col-md-12">
			<div class="table-responsive">
				<div class="row">
					<div class="col-md-1">
						<a class="btn btn-default" type="button" data-toggle="collapse"
						   data-target="#addUserForm"><i
								class="glyphicon glyphicon-plus"></i>添加</a>
					</div>
					<div class="col-md-3 form-group ">
						<form class="form-inline" action="${pageContext.request.contextPath}/user/findLikeUsername.do?"method="post" id="form1">
							<input type="text" class="form-control" placeholder="请输入用户名" name="username" value="">
							<input type="text" style="display: none;" name="pageIndex" value="1">
							<a class="btn btn-default" onclick="changeUser('findu')"><span
									class="glyphicon glyphicon-search" ></span> 搜索</a>
						</form>
					</div>

					<div class="col-md-offset-7">
						<button class="btn btn-default" type="button" data-toggle="modal"
								data-target="#backupUsers">
							<span class="glyphicon glyphicon-floppy-save"></span> 数据备份
						</button>
						<button class="btn btn-default" data-toggle="modal"
								data-target="#recoverUsers">
							<span class="glyphicon glyphicon-floppy-open"></span> 数据恢复
						</button>
					</div>

				</div>
				<div class="form-group col-md-12 collapse" id="addUserForm">
					<div class="well">
						<form action="${pageContext.request.contextPath}/user/addUser.do" method="post">
							<table  class="table-condensed">
								<thead>
								<tr>
									<th><label class=" control-label"
											   for="inputGroupSuccess1">用户名</label></th>
									<th><label class=" control-label"
											   for="inputGroupSuccess1">密码</label></th>
									<th><label class=" control-label"
											   for="inputGroupSuccess1">联系电话</label></th>
									<th><label class=" control-label"
											   for="inputGroupSuccess1">邮箱</label></th>
									<th><label  class=" control-label"
												for="inputGroupSuccess1">系统来源</label></th>
									<th><label class=" control-label"
											   for="inputGroupSuccess1">登陆ip</label></th>
									<th><label class=" control-label"
											   for="inputGroupSuccess1">初始状态</label></th>
								</tr>
								</thead>

								<tbody>
								<tr>
									<td><input required="required" id="inputGroupSuccess1"
											   class="form-control" type="text"
											   aria-describedby="inputGroupSuccess1Status"
											   placeholder="请输入用户名" name="username"/></td>
									<td><input required="required" id="inputGroupSuccess2"
											   class="form-control" type="text"
											   aria-describedby="inputGroupSuccess1Status"
											   placeholder="请输入密码" name="password"/></td>
									<td><input required="required" id="inputGroupSuccess3"
											   class="form-control" type="text"
											   aria-describedby="inputGroupSuccess1Status"
											   placeholder="请输入联系电话" name="phone"/></td>
									<td><input required="required" id="inputGroupSuccess4"
											   class="form-control" type="text"
											   aria-describedby="inputGroupSuccess1Status"
											   placeholder="请输入邮箱" name="email"/></td>
									<td><select required="required" class="form-control" name="systemSource">
										<option disabled="disabled" class="disabled">请选择系统来源</option>
										<option value="业务系统1">业务系统1</option>
										<option value="业务系统2">业务系统2</option>
										<option value="业务系统3">业务系统3</option>
										<option value="云平台运营系统">云平台运营系统</option>
									</select></td>
									<td><input required="required" id="inputGroupSuccess5"
											   class="form-control" type="text"
											   aria-describedby="inputGroupSuccess1Status"
											   placeholder="请输入最后一次登陆ip" name="emailIp"/></td>
									<td><select required="required" class="form-control" name="userStatus">
										<option disabled="block" class="disabled" >请选择初始状态</option>
										<option value="冻结">冻结</option>
										<option value="激活">激活</option>
									</select></td>
									<td colspan="6"><input type="submit" value="保存"
														   class="btn btn-success pull-right" /></td>
								</tr>
								</tbody>
							</table>
						</form>
					</div>
				</div>
				<div class="form-group col-md-12 collapse" id="updateUserForm">
					<div class="well">

						<table class="table-condensed " style="text-align: center;">
							<thead>
							<tr>
								<td class=" control-label"
									for="inputGroupSuccess1">用户名</td>

								<td class=" control-label"
									for="inputGroupSuccess1">联系电话</td>
								<td class=" control-label"
									for="inputGroupSuccess1">邮箱</td>
								<!-- <td class=" control-label"
                                    for="inputGroupSuccess1">系统来源</td>
                                    <td class=" control-label"
                                    for="inputGroupSuccess1">最后一次登陆IP</td> -->
								<!-- <td class=" control-label"
                                    for="inputGroupSuccess1">用户状态</td> -->
							</tr>
							</thead>
							<form id="ff"   class="" action="${pageContext.request.contextPath}/user/updateUser.do" method="post" >
								<tbody>
								<tr id="updateTr">
									<td><input required="required" id="username"
											   class="form-control" type="text"
											   aria-describedby="inputGroupSuccess1Status"
											   readonly="readonly"  name="username" value="${user.username}"/>
									</td>
									<td><input required="required" id="phone"
											   class="form-control" type="text"
											   aria-describedby="inputGroupSuccess1Status"
											   placeholder="请输入联系电话" name="phone" size="11" value="${user.phone}"/></td>
									<td><input required="required" id="email"
											   class="form-control" type="text"
											   aria-describedby="inputGroupSuccess1Status"
											   placeholder="请输入邮箱" name="email" size="25" value="${user.email}"/></td>
									<!-- 	<td><select id="systemSource" required="required" class="form-control" name="systemSource">
                                                <option disabled="disabled" class="disabled">请选择系统来源</option>
                                                <option value="业务系统1" >业务系统1</option>
                                                <option value="业务系统2">业务系统2</option>
                                                <option value="业务系统3">业务系统3</option>
                                                <option value="云平台运营系统">云平台运营系统</option>
                                        </select></td>
                                        <td><input required="required" id="finalip"
                                            class="form-control" type="text"
                                            aria-describedby="inputGroupSuccess1Status"
                                             name="finalip" size="12"/></td> -->
									<!-- <td style="display: none;"><input type="text" value="" name="finalip"></td>
                                    <td style="display: none;"><input type="data" value="" name="finalTime"></td>
                                    <td><select required="required" class="form-control" name="status">
                                            <option disabled="disabled" class="disabled">请选择初始状态</option>
                                            <option value="N">冻结</option>
                                            <option value="Y">可用</option>
                                    </select></td> -->
									<td colspan="6"><input type="submit" value="保存"
														   class="btn btn-success pull-right" /></td>
								</tr>
								</tbody>
							</form>
						</table>

					</div>
				</div>
				<table  style="text-align:center" id="userPager"
						class=" table-bordered table-responsive table table-hover table-condensed">
					<thead>
					<tr class="bg-primary h4">
						<td>用户名</td>
						<td>联系电话</td>
						<td>邮箱</td>
						<td>用户来源</td>
						<td>登陆ip</td>
						<td>账户状态</td>
						<td>编辑</td>
					</tr>
					</thead>
                    alert(${sessionScope.selectAll})
                    alert(${sessionScope.findLike})
                    <c:if test="${sessionScope.findLike==null}">
                        <c:forEach items="${sessionScope.pageBean.userList}" var="ul">
                            <tr class="bg-danger" >
                                <td>${ul.username}</td>
                                <td style="display: none;">${ul.password}</td>
                                <td>${ul.phone}</td>
                                <td>${ul.email}</td>
                                <td>${ul.systemSource}</td>
                                <td>${ul.emailIp}</td>

                                <td>
                                    <a type="button" data-toggle="modal"data-target="#freezUser" class="btn btn-danger btn-sm" onclick="changeUserStatus('${ul.username}','${ul.userStatus}')">${ul.userStatus}</a>
                                </td>
                                <td>
                                    <div class="btn-group" role="group">
                                        <button class="btn btn-default btn-sm" data-toggle="modal"
                                                data-target="#deleteConfirm" onclick="delUser('${ul.username}');">
                                            <span class="glyphicon glyphicon-remove-sign"></span> 删除
                                        </button>

                                        <button class="btn btn-default btn-sm" type="button"
                                                data-toggle="collapse"  data-target="#updateUserForm"  onclick="selectUser('${ul.username}')">
                                            <span class="glyphicon glyphicon-pencil" ></span> 修改

                                        </button>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                 <%--       &lt;%&ndash;移除作用域中的数据&ndash;%&gt;
                        <c:remove var="selectAll" scope="session"/>--%>
                    </c:if>
                    <c:if test="${sessionScope.selectAll==null &&sessionScope.findLike!=null}">
                        <c:forEach items="${sessionScope.queryLike.userList}" var="ul">
                            <tr class="bg-danger" >
                                <td>${ul.username}</td>
                                <td style="display: none;">${ul.password}</td>
                                <td>${ul.phone}</td>
                                <td>${ul.email}</td>
                                <td>${ul.systemSource}</td>
                                <td>${ul.emailIp}</td>

                                <td>
                                    <a type="button" data-toggle="modal"data-target="#freezUser" class="btn btn-danger btn-sm" onclick="changeUserStatus('${ul.username}','${ul.userStatus}')">${ul.userStatus}</a>
                                </td>
                                <td>
                                    <div class="btn-group" role="group">
                                        <button class="btn btn-default btn-sm" data-toggle="modal"
                                                data-target="#deleteConfirm" onclick="delUser('${ul.username}');">
                                            <span class="glyphicon glyphicon-remove-sign"></span> 删除
                                        </button>

                                        <button class="btn btn-default btn-sm" type="button"
                                                data-toggle="collapse"  data-target="#updateUserForm"  onclick="selectUser('${ul.username}')">
                                            <span class="glyphicon glyphicon-pencil" ></span> 修改

                                        </button>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:if>
				</table>
				<!--分页-->
            <c:if test="${sessionScope.selectAll!=null&&sessionScope.findLike==null}">
                alert(33333333333333)
				<div align="center">
					<div class="pagination">
						<ul>

							<li><a href="javascript:void(0)" >每页显示</a></li>
							<li><a href="javascript:void(0)">
								<select id="c"  onchange="test()">
									<option value="0">选择条数</option>
									<option value="2">2</option>
									<option value="5">5</option>
									<option value="10">10</option>
								</select>
							</a>
							</li>
							<li><a href="#">条</a></li>
                            <li><a href="#">当前第${sessionScope.pageBean.currentPage}页</a></li>
							<li><a href="#">共${sessionScope.pageBean.totalPage}页</a></li>
                            <li>
                                <a href="javascript:void(0)" id="previous" onclick="showPrevious(${sessionScope.pageBean.currentPage},${sessionScope.pageBean.count},${sessionScope.pageBean.totalPage})"> 上一页</a>
                                <a href="javascript:void(0)" id="next" onclick="showNext(${sessionScope.pageBean.currentPage},${sessionScope.pageBean.count},${sessionScope.pageBean.totalPage})"> 下一页</a>
                            </li>
                         </c:if>
                        </ul>
                    </div>
                </div>
            <c:if test="${sessionScope.selectAll==null &&sessionScope.findLike!=null}">
                alert(111111)
                    <div align="center">
                        <div class="pagination">
                        <ul>

                        <li><a href="javascript:void(0)" >每页显示</a></li>
                        <li><a href="javascript:void(0)">
                            <select id="c1"  onchange="test1()">
                                <option value="0">选择条数</option>
                                <option value="2">2</option>
                                <option value="5">5</option>
                                <option value="10">10</option>
                            </select>
                        </a>
                        </li>
                        <li><a href="#">条</a></li>
                        <li><a href="#">当前第${sessionScope.queryLike.currentPage}页</a></li>
                        <li><a href="#">共${sessionScope.queryLike.totalPage}页</a></li>
                        <li>
                            <a href="javascript:void(0)"  onclick="showPreviousLike(${sessionScope.queryLike.currentPage},${sessionScope.queryLike.count},${sessionScope.queryLike.totalPage})"> 上一页</a>
                            <a href="javascript:void(0)" onclick="showNextLike(${sessionScope.queryLike.currentPage},${sessionScope.queryLike.count},${sessionScope.queryLike.totalPage})"> 下一页</a>
                        </li>
                </c:if>
                        </ul>
                        </div>
                    </div>
                          <%-- 方案一
                           <c:choose>
                                <c:when test="${sessionScope.pageBean.currentPage>'1' && sessionScope.pageBean.currentPage<=sessionScope.pageBean.totalPage}">
                                    <li><a href="${pageContext.request.contextPath}/user/findAllUser.do?currentPage=${sessionScope.pageBean.currentPage-1}&&count=${sessionScope.pageBean.count}> 上一页</a></li>
                                </c:when>
                            </c:choose>
                             <c:if test="${sessionScope.pageBean.currentPage>='1'&& sessionScope.pageBean.currentPage<sessionScope.pageBean.totalPage}">
                                <li><a href="${pageContext.request.contextPath}/user/findAllUser.do?currentPage=${sessionScope.pageBean.currentPage+1}&&count=${sessionScope.pageBean.count}">下一页</a></li>
                            </c:if>
                            <li><a href="${pageContext.request.contextPath}/user/findAllUser.do?currentPage=${sessionScope.pageBean.totalPage}&&count=${sessionScope.pageBean.count}">尾页</a></li>
--%>
                           <%--方案二
                           <c:if test="${sessionScope.pageBean.currentPage==1}">
							    <li class="previous disabled">
								    <a href="javascript:void(0)"> 上一页</a>
                                </li>
                            </c:if>
                            <c:if test="${sessionScope.pageBean.currentPage!=1}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/user/findAllUser.do?currentPage=${sessionScope.pageBean.currentPage-1}&&count=${sessionScope.pageBean.count}> 上一页</a>
                                </li>
                            </c:if>
                            <c:if test="${sessionScope.pageBean.currentPage==sessionScorp.pageBean.totalPage}">
                                <li class="next disabled">
                                    <a href="javascript:void(0)"> 下一页</a>
                                 </li>
                            </c:if>
                            <c:if test="${sessionScope.pageBean.currentPage!=$sessionScorp.pageBean.totalPage}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/user/findAllUser.do?currentPage=${sessionScope.pageBean.currentPage+1}&&count=${sessionScope.pageBean.count}">下一页</a>
							    </li>
                             </c:if>--%>

				<hr />
			</div>
		</div>
		<%--<!--确认框-->
		<div id="deleteConfirm" role="dialog" tabindex="-1"
			 class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="panel panel-warning">
						<div class="panel-heading">
							<h3>提示信息</h3>
						</div>
						<div class="panel-body">
							<h4>你确认要删除该用户？</h4>

							<div class="pull-right">
								<button class="btn btn-primary" data-dismiss="modal">取消</button>
								<button class="btn btn-primary" data-dismiss="modal" onclick="changeUser('remove')">确定</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--确认框-->
		<div id="freezUser" role="dialog" tabindex="-1" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="panel panel-danger">
						<div class="panel-heading">
							<h3>提示信息</h3>
						</div>
						<div class="panel-body">
							<h4>你确认要解冻该用户吗？</h4>

							<div class="pull-right">
								<button class="btn btn-primary" data-dismiss="modal">取消</button>
								<button class="btn btn-primary" data-dismiss="modal" onclick="changeUser('changeStatu')">确定</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--确认框-->
		<div id="unFreezUser" role="dialog" tabindex="-1" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="panel panel-success">
						<div class="panel-heading">
							<h3>提示信息</h3>
						</div>
						<div class="panel-body">
							<h4>你确认要冻结用户？</h4>

							<div class="pull-right">
								<button class="btn btn-primary" data-dismiss="modal">取消</button>
								<button class="btn btn-primary" data-dismiss="modal" onclick="changeUser('changeStatu')">确定</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--确认框-->
		<div id="backupUsers" role="dialog" tabindex="-1" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="panel panel-info">
						<div class="panel-heading">
							<h3>提示信息</h3>
						</div>
						<div class="panel-body">
							<h4>确定要备份现在的用户数据吗？</h4>

							<div class="pull-right">
								<button class="btn btn-primary" data-dismiss="modal">取消</button>
								<button class="btn btn-primary" data-dismiss="modal" onclick="changeUser('export')">确定</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--确认框-->
		<div id="recoverUsers" role="dialog" tabindex="-1" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="panel panel-info">
						<div class="panel-heading">
							<h3>提示信息</h3>
						</div>
						<div class="panel-body">
							<em>选择要恢复的备份文件？</em>
							<table
									class=" table-responsive table table-hover table-condensed">
								<thead>
								<tr>
									<th>备份文件名</th>
									<th>备份日期</th>
									<th>恢复</th>
								</tr>
								</thead>
								<tbody>
									<tr>
										<td>${item.key}</td>
										<td>${item.value }</td>
										<td>
											<button class="btn btn-success btn-sm" data-dismiss="modal" onclick="changeUser('import','${item.key}')">恢复</button>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>--%>
	</div>
</div>
</body>
</html>
