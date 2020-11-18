<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

use App\Item;
use App\Inventory;

use View;
use Hash;
use Hashids;

use Session;

class InventoryController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');       
        $this->middleware(function ($request, $next) {

            /*$user_id  = Auth::user()->id;
            $group_id = Auth::user()->group_id;
            $module   = 'settings';
            $with_permission = UserHelper::checkUserRole($group_id, $module); 
            if(!$with_permission) {
                Session::flash('message', 'You have no permission to access the '. $module . ' page.');
                Session::flash('alert_class', 'alert-danger');                
                return redirect('dashboard');
            }*/

            return $next($request);     
        });           
    }

    public function index(Request $request)
    {
        $search_by    = $request->input('search_by');
        $search_field = $request->input('search_field');  

        if($search_by != '' && $search_field != '') {
            $inventory_query = Inventory::query();

            if($search_by != '' && $search_field != '') {
                $inventory_query = $inventory_query->where('inventories.'.$search_by, 'like', '%' . $search_field . '%');
                $inventory = $inventory_query->paginate(15);
            }            
        } else {
            $inventory = Inventory::paginate(15);
        }

        return view('inventory.index',[
        	'inventory' => $inventory,
            'search_field' => $search_field
        ]); 
    }

    public function create()
    {    	
    	$items = Item::get();

        return view('inventory.create', [
            'items' => $items
        ]);
    }

    public function store(Request $request)
    {
        if ($request->isMethod('post'))
        {
            $this->validate($request, [
                'inventory_date'           => 'required',
                'item_id'           => 'required'
             ]);

            $item = Item::where('id', '=', $request->input('item_id'))->first();

            if( $item ){
            	$error = false;
            	$previous_stock = $item->stock;

            	if( $request->input('in') > 0 ){            		            		
            		$new_stock   = $item->stock + $request->input('in');
            		$item->stock = $new_stock;
            	}

            	if( $request->input('out') > 0 ){
            		if( $request->input('out') > $item->stock ){
            			$error = true;

            			Session::flash('message', 'Stock is lower than out quantity');
            			Session::flash('alert_class', 'alert-danger');
            		}else{
            			$new_stock   = $item->stock - $request->input('out');
            			$item->stock = $new_stock;
            		}
            	}

            	if( !$error ){
		            $item->save();

		            $inventory          = new Inventory;
		            $inventory->item_id = $request->input('item_id');
		            $inventory->inventory_date = $request->input('inventory_date');
		            $inventory->in  = $request->input('in');
		            $inventory->out = $request->input('out');
		            $inventory->previous_stock = $previous_stock;
		            $inventory->new_stock = $new_stock;
		            $inventory->save();

		            Session::flash('message', 'You have successfully created new inventory');
		            Session::flash('alert_class', 'alert-success');
		            return redirect('inventory');
            	}else{
            		return redirect('inventory/create');   
            	}

            }else{
            	Session::flash('message', 'Cannot find item');
            	Session::flash('alert_class', 'alert-danger');
            	return redirect('inventory/create');   
            }

        }else{
            Session::flash('message', 'Unable to create new item');
            Session::flash('alert_class', 'alert-danger');
            return redirect('inventory');
        }
    }
}
