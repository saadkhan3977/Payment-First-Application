<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Api\BaseController as BaseController;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Payment;
use App\Models\Goal;
use App\Models\TemporaryWallet;
use App\Models\Wallet;
use Illuminate\Support\Facades\Auth;
use Validator;
use App\Mail\SendVerifyCode;
use Mail;
use Carbon\Carbon;
use Twilio\Rest\Client; 
use Hash;
use Image;
use File;
use Stripe\Customer;

class RegisterController extends BaseController
{

    public function __construct()
    {
          $stripe = \Stripe\Stripe::setApiKey('sk_test_51KqBmOL0gJLA6ttq4MZB4olAA4u8VVZy5HVl3Qr9dhw8vj9HUgVhuEfNoCZqo8VVMRiKHsjRXfOz0qooLlrt08iy00QjeWkBmS');
    }

    public function register(Request $request)
    {
		$validator = Validator::make($request->all(), [
            'first_name' => 'required|string',
            'last_name' => 'required|string',
            'phone' => 'required|numeric|unique:users',
            'country' => 'required|string',
            'email' => 'required|email|unique:users',			
            'password' => 'required|min:8',
            'c_password' => 'required|same:password',
			'photo' => 'image|mimes:jpeg,png,jpg,bmp,gif,svg|max:2048',
        ]);      
        if($validator->fails())
        {
		 return $this->sendError($validator->errors()->first());

        }
		$profile = null;
				if($request->hasFile('photo')) 
				{$file = request()->file('photo');
				$fileName = md5($file->getClientOriginalName() . time()) . "PayMefirst." . $file->getClientOriginalExtension();
				$file->move('uploads/user/profiles/', $fileName);  
				$profile = asset('uploads/user/profiles/'.$fileName);
				}
        $input = $request->except(['c_password'],$request->all());
        $input['password'] = bcrypt($input['password']);
        $input['photo'] = $profile;
    	$input['email_verified_at'] = Carbon::now();
		$input['is_goal'] = false;
        $input['email_code'] = mt_rand(9000, 9999);
        $user = User::create($input);

        TemporaryWallet::create([
            'user_id' => $user->id,
            'amount' => 0,
        ]);
        
        Wallet::create([
            'user_id' => $user->id,
            'pending_amount' => 0,
            'amount' => 0,
            'withdraw' => 0,
        ]);
        
        Mail::to($user->email)->send(new SendVerifyCode($input['email_code']));
        $token =  $user->createToken('app_api')->accessToken;
		return response()->json(['success'=>true,'message'=>'User register successfully' ,'token'=>$token,'user_info'=>$user]);
    }

    public function login(Request $request)
    {   
        if(!empty($request->email) || !empty($request->password))
        {
            $validator = Validator::make($request->all(), [
                'email' => 'required|email|exists:users',
                'password' => 'required',        
            ]);  
            if($validator->fails()){
				return $this->sendError($validator->errors()->first());
            }
            $user = User::firstWhere('email',$request->email);
            // if($user->email_verified_at != null)
            // {
                if(Auth::attempt(['email' => $request->email, 'password' => $request->password])){ 
                    $user = User::with(['goal','temporary_wallet','wallet','payments'])->where('id',Auth::user()->id)->first(); 
                    $users = Auth::user();
                    $token =  $users->createToken('app_api')->accessToken; 
		            return response()->json(['success'=>true,'message'=>'User Logged In successfully' ,'token'=>$token,'user_info'=>$user]);
               } 
                else{ 
				return $this->sendError('Unauthorised User');

                } 

        //     }else{
		// return $this->sendError('Email Not Verified , Check Email');

        //     }

        }else{
		return $this->sendError('Email & Password are Required');

        }
      
    }

    public function me()
    {
        $user = User::with(['goal','temporary_wallet','wallet','payments'])->where('id',Auth::user()->id)->first(); 
        return response()->json(['success'=>true,'message'=>'User Fetch successfully','user_info'=>$user]);
    }
    public function logout()
    {
        if(Auth::check())
        {
            $user = Auth::user()->token();
            $user->revoke();
            $success['success'] =true; 
            return $this->sendResponse($success, 'User Logout successfully.');
        }else{
            return $this->sendError('No user in Session .');
        }
    }
    public function user(Request $request)
    {
        if(Auth::check())
        {
            $success['user_info'] = $request->user();
        return $this->sendResponse($success, 'Current user successfully.');
        }
        else{
            return $this->sendError('No user in Session .');
        }
    }
    public function verify(Request $request)
    {
		$validator = Validator::make($request->all(),['email_code'=>'required']);
        if($validator->fails()){
            return $this->sendError($validator->errors()->first());       
            }
        $user = User::firstWhere('email_code',$request->email_code);
        if($user == null)
        {
            return $this->sendError('Token Expire or Invalid');
        }else{
            $user->update(['email_verified_at'=>Carbon::now(),'email_code'=>null]);
            $success['success'] =true; 
            return $this->sendResponse($success, 'Email verified Successfully');
        }
    }
    public function change_password(Request $request)
    {
      try{
      $validator = Validator::make($request->all(),[
          'current_password' => 'required',
          'new_password' => 'required|same:confirm_password|min:8',
          'confirm_password' => 'required',
      ]);
      if($validator->fails()){
        return $this->sendError($validator->errors()->first());       
        }
        $user = Auth::user();

      if (!Hash::check($request->current_password,$user->password)) {
        return $this->sendError(['error'=>'Current Password Not Matched']);
      }
      $user->password = Hash::make($request->new_password);
      $user->save();
      return response()->json(['success'=>true,'message'=>'Password Successfully Changed','user_info'=>$user]);
         }catch(\Eception $e){
           return $this->sendError($e->getMessage());    
        }
    }   

    public function noauth(){
	 return $this->sendError('session destroyed , Login to continue!');
	
	}

    public function cron()
    {

        $users = User::with('goal')->get();
        foreach($users as $user)
        {
            // $customer = Customer::retrieve($user->stripe_id);
            // $balance = $customer->balance;
            // print_r($balance);die;

            // if ($balance !== null) {
            //     // Proceed with checking the balance
            // }
            if($user->goal)
            {
                $payment = Payment::where('customer_id',$user->stripe_id)->orderBy('id','desc')->first();                
                
                $days = Carbon::parse($payment->created_at)->diffInDays(Carbon::now());
                $temporarywallet = TemporaryWallet::where('user_id',$user->id)->first();
                $wallet = Wallet::where('user_id',$user->id)->first();
                
                if($user->goal->cnd < $user->goal->number_deduction)
                {
                    if($user->goal->plan == 'Weekly')
                    {
                        if($days > '7')
                        {
                            $charge = \Stripe\Charge::create([
                                'amount' => $user->goal->amount_per_deduction*100,
                                'currency' => 'usd',
                                'customer' => $user->stripe_id,
                            ]);

                            Payment::create([
                                'amount' => $user->goal->amount_per_deduction,
                                'customer_id' => $user->stripe_id,
                                'currency' => 'usd',
                            ]);
                            $user->goal->update([
                                'cnd' => $user->goal->cnd + 1
                            ]);

                            $temporarywallet->update([
                                'amount' => $temporarywallet->amount + $user->goal->amount_per_deduction,
                            ]);

                            if($user->goal->cnd == $user->goal->number_deduction)
                            {
                                $wallet->update([
                                    'amount' => $wallet->amout + $temporarywallet->amount,
                                ]);

                                $temporarywallet->update([
                                    'amount' => 0,
                                ]);
                            }
                        }
                    }
                    
                    if($user->goal->plan == 'bi-weekly')
                    {
                        if($days > '14')
                        {
                            $charge = \Stripe\Charge::create([
                                'amount' => $user->goal->amount_per_deduction*100,
                                'currency' => 'usd',
                                'customer' => $user->stripe_id,
                            ]);

                            Payment::create([
                                'amount' => $user->goal->amount_per_deduction,
                                'customer_id' => $user->stripe_id,
                                'currency' => 'usd',
                            ]);
                            $user->goal->update([
                                'cnd' => $user->goal->cnd + 1
                            ]);
                            $temporarywallet->update([
                                'amount' => $temporarywallet->amount + $user->goal->amount_per_deduction,
                            ]);

                            if($user->goal->cnd == $user->goal->number_deduction)
                            {
                                $wallet->update([
                                    'amount' => $wallet->amout + $temporarywallet->amount,
                                ]);

                                $temporarywallet->update([
                                    'amount' => 0,
                                ]);
                            }
                        }
                    }
                    
                    if($user->goal->plan == 'Monthly')
                    {
                        if($monthdays > '30')
                        {
                            $charge = \Stripe\Charge::create([
                                'amount' => $user->goal->amount_per_deduction*100,
                                'currency' => 'usd',
                                'customer' => $user->stripe_id,
                            ]);

                            Payment::create([
                                'amount' => $user->goal->amount_per_deduction,
                                'customer_id' => $user->stripe_id,
                                'currency' => 'usd',
                            ]);
                            $user->goal->update([
                                'cnd' => $user->goal->cnd + 1
                            ]);
                            $temporarywallet->update([
                                'amount' => $temporarywallet->amount + $user->goal->amount_per_deduction,
                            ]);
                            
                            if($user->goal->cnd == $user->goal->number_deduction)
                            {
                                $wallet->update([
                                    'amount' => $wallet->amout + $temporarywallet->amount,
                                ]);

                                $temporarywallet->update([
                                    'amount' => 0,
                                ]);
                            }
                        }
                    }
                }
            }
        }
    }

}
