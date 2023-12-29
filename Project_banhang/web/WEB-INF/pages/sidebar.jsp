<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div id="sidebar" class="sidebar-toggle">
	<ul class="nav nav-sidebar">
		<li><a href="${pageContext.request.contextPath}"> <i class="fa fa-home" aria-hidden="true"></i>
				<span>HOME</span>
		</a></li>
		<li role="separator" class="divider"></li>
		<!-- chart types -->
		<li data-toggle="collapse" href="#chart-types" aria-expanded="true"
			aria-controls="chart-types"><a href="#"> <i
				class="fa fa-area-chart" aria-hidden="true"></i><span>STATICS</span>
		</a></li>
		<li>
			<ul id="chart-types" class="sub-menu collapse ${fn:contains(pageContext.request.requestURI,'chart-types') ? 'in' : ''}">
				<li><a href="statics?act=1">Top 5 user purchase</a></li>
				<li><a href="statics?act=2">Top 5 product purchase</a></li>
			</ul>
		</li>
		<li role="separator" class="divider"></li>
		<!--  features -->
		<li data-toggle="collapse" href="#features" aria-expanded="false"
			aria-controls="features"><a href="#"> <i class="fa fa-flask"
				aria-hidden="true"></i> <span>MANAGER</span>
		</a></li>
		<li>
			<ul id="features" class="sub-menu collapse ${fn:contains(pageContext.request.requestURI,'features') ? 'in' : ''}">
				<li><a href="statics?act=3">Manager user</a></li>
			</ul>
		</li>
		
		<!--  /how to  -->
		<li role="separator" class="divider"></li>
	</ul>
</div>