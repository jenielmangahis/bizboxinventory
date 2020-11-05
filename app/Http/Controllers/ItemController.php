<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\Auth;

use App\Item;
use App\ItemCategory;

use View;
use Hash;
use Hashids;

use Session;

class ItemController extends Controller
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
            $item_query = Item::query();

            if($search_by != '' && $search_field != '') {
                $item_query = $item_query->where('items.'.$search_by, 'like', '%' . $search_field . '%');
                $item = $item_query->paginate(15);
            }            
        } else {
            $item = Item::paginate(15);
        }

        return view('item.index',[
        	'item' => $item,
            'search_field' => $search_field
        ]); 
    }

    public function create()
    {
        $itemCategories = ItemCategory::get();

        return view('item.create', [
            'itemCategories' => $itemCategories
        ]);
    }

    public function store(Request $request)
    {
        if ($request->isMethod('post'))
        {
            $this->validate($request, [
                'item_category_id'           => 'required',
                'item_name'           => 'required',
                'stock'           => 'required',
                'price'           => 'required',   
             ]);

            $item                 = new Item;
            $item->item_category_id = $request->input('item_category_id');
            $item->item_name        = $request->input('item_name');
            $item->item_description = $request->input('item_description');
            $item->stock            = $request->input('stock');
            $item->price            = $request->input('price');
            $item->save();

            Session::flash('message', 'You have successfully created new item');
            Session::flash('alert_class', 'alert-success');
            return redirect('item');

        }else{
            Session::flash('message', 'Unable to create new item');
            Session::flash('alert_class', 'alert-danger');
            return redirect('item/create');            
            return redirect('item');
        }
    }

    public function edit($id)
    {    
        $id   = Hashids::decode($id)[0];
        $item = Item::where('id', '=', $id)->first();

        $itemCategories = ItemCategory::get();

        return view('item.edit', [
            'item' => $item,
            'itemCategories' => $itemCategories
        ]);
    }

    public function update(Request $request)
    {
        if ($request->isMethod('post'))
        {
            $this->validate($request, [
                'item_category_id'           => 'required',
                'item_name'           => 'required',
                'stock'           => 'required',
                'price'           => 'required',   
             ]);

            $id  = Hashids::decode($request->input('id'))[0];
            $item = Item::find($id);
            if($item) {
                $item->item_category_id = $request->input('item_category_id');
                $item->item_name        = $request->input('item_name');
                $item->item_description = $request->input('item_description');
                $item->stock            = $request->input('stock');
                $item->price            = $request->input('price');
                $item->save();

                Session::flash('message', 'Item has been updated');
                Session::flash('alert_class', 'alert-success');
                return redirect('item');
            }
        }

        Session::flash('message', 'Unable to update item');
        Session::flash('alert_class', 'alert-danger');
        return redirect('item');
    }

    public function destroy(Request $request)
    {
        if ($request->isMethod('post'))
        {
            $id = $request->input('id');
            $id = Hashids::decode($id)[0];
            $item = Item::find($id);

            if($item) {   
                $item->delete();
                Session::flash('message', "Delete Successful");
                Session::flash('alert_class', 'alert-success');
                return redirect('item');
            }
        }
    } 
}
