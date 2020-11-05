<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Contact;
use App\ContactBusinessInformation;
use App\ContactBrokerInformation;
use App\ContactLoanInformation;
use App\ContactCallTracker;
use App\Workflow;
use App\ContactEvent;
use App\CompanyUser;
use App\EventType;
use App\NoteType;
use App\MailMessaging;
use App\EmailTemplate;
use App\ContactNote;
use App\ContactBankAccount;
use App\ContactCreditCard;
use App\ContactTask;
use App\State;
use App\ContactDocs;
use App\ContactHistory;
use App\ContactAdvance;
use App\ContactUser;
use App\User;
use App\ContactAdvancePayment;

use UserHelper;

use View;
use Hash;
use Hashids;

use Session;
use Route;

class DashboardController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');  
        $this->middleware(function ($request, $next) {

            $user_id  = Auth::user()->id;
            $group_id = Auth::user()->group_id;

            if($group_id == 1 || $group_id == 2 || $group_id ){
                if(Session::has('message')) {
                    Session::flash('message', Session::get('message'));
                    Session::flash('alert_class', 'alert-danger');                      
                }
            }         

            return $next($request);     
        });  
		   
    }

    public function index(Request $request)
    {
        
        return view('dashboard.index',[
            
        ]); 
    }
}