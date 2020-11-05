<style>
.skin-blue .main-header .logo, .skin-blue .main-header .navbar, a.logo:hover {
	background-color: #070707 !important;
}
.main-header .logo {
	height: 84px !important;
}
.sidebar{
	padding-top: 40px;
}
.navbar-custom-menu{
	margin-top: 13px;
}
.sidebar-toggle{
	margin-top: 14px;
}
</style>
<header class="main-header">
	<!-- Logo -->
	<a href="{{url('/')}}" class="logo">
	  <!-- mini logo for sidebar mini 50x50 pixels -->
	  <span class="logo-mini"><img src="{{ asset('/images/invlogo.png') }}" alt="CoreCMS" style="width:77%;margin-top: 22px;" /></span>
	  <!-- logo for regular state and mobile devices -->
	  <span class="logo-lg"><img src="{{ asset('/images/inv_big.png') }}" alt="CoreCMS" style="width:99%;margin-top: 16px;" /></span>
	</a>

	<!-- Header Navbar -->
	<nav class="navbar navbar-static-top" role="navigation">
	  <!-- Sidebar toggle button-->
	  <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
	    <span class="sr-only">Toggle navigation</span>
	  </a>
	  <!-- Navbar Right Menu -->
	  <div class="navbar-custom-menu">
	    <ul class="nav navbar-nav">

	      	{{-- @include('layouts.backend.header-notification') --}}
	      	@if(UserHelper::checkUserRole(Auth::user()->group_id, 'notifications')) 
	      		@include('layouts.backend.header-notification')
	      	@endif
	      	<!-- User Account Menu -->
	      	<li class="dropdown user user-menu">
		        <!-- Menu Toggle Button -->
		        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
		          	<!-- The user image in the navbar-->
	                @if(file_exists(public_path() . "/uploads/users/".Auth::user()->profile_img) && Auth::user()->profile_img != "")
	                  <img src="{{ asset("/uploads/users/".Auth::user()->profile_img) }}" class="user-image" alt="User Image"/>
	                @else
	                  <img src="{{ asset('/images/user-default-160x160.jpg') }}" class="user-image" alt="User Image"/>          
	                @endif  		          
		          <!-- hidden-xs hides the username on small devices so only the image appears. -->
		          <span class="hidden-xs"><?= Auth::user()->username ?></span>
		        </a>
		        <ul class="dropdown-menu">
		          <!-- The user image in the menu -->
		          <li class="user-header">
		            
		            @if(file_exists(public_path() . "/uploads/users/".Auth::user()->profile_img) && Auth::user()->profile_img != "")
	                  <img src="{{ asset("/uploads/users/".Auth::user()->profile_img) }}" class="img-circle" alt="User Image"/>
	                @else
	                  <img src="{{ asset('/images/user-default-160x160.jpg') }}" class="img-circle" alt="User Image1"/>      
	                @endif  		   
		            <p><?= Auth::user()->firstname ?> <?= Auth::user()->lastname ?></p>
		          </li>
		          <!-- Menu Body -->

		          <!-- <li class="user-body">
		            <div class="row">
		              <div class="col-xs-4 text-center">
		                <a href="#">Followers</a>
		              </div>
		              <div class="col-xs-4 text-center">
		                <a href="#">Sales</a>
		              </div>
		              <div class="col-xs-4 text-center">
		                <a href="#">Friends</a>
		              </div>
		            </div>
		          </li> -->

		          <!-- Menu Footer-->
		          <li class="user-footer">
		            <div class="pull-right" style="margin-left: 5px;">
		              <a href="{{ route('user/profile') }}" class="btn btn-default btn-flat">Profile</a>
		            </div>
		            <div class="pull-right">
		            	<!-- <a href="#" class="btn btn-default btn-flat">Sign out</a> -->

	                    <a class="btn btn-default btn-flat" href="{{ route('logout') }}"
	                       onclick="event.preventDefault();
	                                     document.getElementById('logout-form').submit();">
	                        {{ __('Logout') }}
	                    </a>

	                    <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
	                        @csrf
	                    </form>		              
		            </div>
		          </li>
		        </ul>
	      	</li>

		    <!-- Control Sidebar Toggle Button -->
		    <!-- <li><a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a> -->
	      </li>
	    </ul>
	  </div>
	</nav>
</header>