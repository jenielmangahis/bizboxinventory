	<ul class="sidebar-menu" data-widget="tree">
		
	    <li class="header">ADMIN</li>
	    <!-- Optionally, you can add icons to the links -->
	    @if(UserHelper::checkUserRole(Auth::user()->group_id, 'dashboard'))
	    	<?php 
	    		$action     = Route::current()->getAction();
	    		$controller = class_basename($action['controller']);
				list($controller, $action) = explode('@', $controller);	    		
	    	?>
		    <li <?php echo $controller == 'DashboardController' ? 'class="active"' : ''; ?>>
		    	<a href="{{route('dashboard')}}"><i class="fa fa-dashboard"></i> <span>Dashboard </span></a>
		    </li>
		    <li <?php echo $controller == 'ItemController' ? 'class="active"' : ''; ?>>
		    	<a href="{{route('item')}}"><i class="fa fa-list-alt"></i> <span>Items </span></a>
		    </li>
		    <li <?php echo $controller == 'InventoryController' ? 'class="active"' : ''; ?>>
		    	<a href="{{route('inventory')}}"><i class="fa fa-list-alt"></i> <span>Inventory </span></a>
		    </li>
	    @endif
	    @if(UserHelper::checkUserRole(Auth::user()->group_id, 'user_management'))   
		    <li class="treeview">
		      <a href="#"><i class="fa fa-gear"></i> <span>Settings</span>
		        <span class="pull-right-container">
		            <i class="fa fa-angle-left pull-right"></i>
		          </span>
		      </a>
		      <ul class="treeview-menu">
		      	<li <?php echo Route::current()->getName() == 'users' ? 'class="active"' : ''; ?>><a href="{{route('users')}}"><i class="fa fa-circle"></i>Users</a></li>
		      	<li <?php echo Route::current()->getName() == 'item_category' ? 'class="active"' : ''; ?>><a href="{{route('item_category')}}"><i class="fa fa-circle"></i>Item Categories</a></li>
		      </ul>
		    </li>
	    @endif
	</ul>