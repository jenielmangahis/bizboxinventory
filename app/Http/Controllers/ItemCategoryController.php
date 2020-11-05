<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\Auth;

use App\ItemCategory;

use View;
use Hash;
use Hashids;

use Session;

class ItemCategoryController extends Controller
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
            $item_category_query = ItemCategory::query();

            if($search_by != '' && $search_field != '') {
                $item_category_query = $item_category_query->where('item_categories.'.$search_by, 'like', '%' . $search_field . '%');
                $item_category = $item_category_query->paginate(15);
            }            
        } else {
            $item_category = ItemCategory::paginate(15);
        }

        return view('item_category.index',[
        	'item_category' => $item_category,
            'search_field' => $search_field
        ]); 
    }

    public function create()
    {
        return view('item_category.create', [
            
        ]);
    }

    public function store(Request $request)
    {
        if ($request->isMethod('post'))
        {
            $this->validate($request, [
                'item_category_name'           => 'required'      
             ]);

            $itemCategory                 = new ItemCategory;
            $itemCategory->item_category_name           = $request->input('item_category_name');
            $itemCategory->save();

            Session::flash('message', 'You have successfully created new item category');
            Session::flash('alert_class', 'alert-success');
            return redirect('item_category');

        }else{
            Session::flash('message', 'Unable to create new item category');
            Session::flash('alert_class', 'alert-danger');
            return redirect('item_category/create');            
            return redirect('item_category');
        }
    }

    public function edit($id)
    {     
        $id = Hashids::decode($id)[0];
        $item_category   = ItemCategory::where('id', '=', $id)->first();

        return view('item_category.edit', [
            'item_category' => $item_category
        ]);
    }

    public function update(Request $request)
    {
        if ($request->isMethod('post'))
        {
            $this->validate($request, [
                'item_category_name'           => 'required'       
             ]);

            $id = Hashids::decode($request->input('id'))[0];
            $item_category = ItemCategory::find($id);
            if($item_category) {
                $item_category->item_category_name = $request->input('item_category_name');
                $item_category->save();

                Session::flash('message', 'Item Category has been updated');
                Session::flash('alert_class', 'alert-success');
                return redirect('item_category');
            }
        }

        Session::flash('message', 'Unable to update item category');
        Session::flash('alert_class', 'alert-danger');
        return redirect('item_category');
    }

    public function destroy(Request $request)
    {
        if ($request->isMethod('post'))
        {
            $id = $request->input('id');
            $id = Hashids::decode($id)[0];
            $item_category = ItemCategory::find($id);

            if($item_category) {   
                $item_category->delete();
                Session::flash('message', "Delete Successful");
                Session::flash('alert_class', 'alert-success');
                return redirect('item_category');
            }
        }
    } 
}
