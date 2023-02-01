<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Auth;
use Validator;
use App\Models\UserCardDetail;
class UserCardController extends Controller
{
    
    public function __construct()
    {
          $stripe = \Stripe\Stripe::setApiKey('sk_test_51KqBmOL0gJLA6ttq4MZB4olAA4u8VVZy5HVl3Qr9dhw8vj9HUgVhuEfNoCZqo8VVMRiKHsjRXfOz0qooLlrt08iy00QjeWkBmS');
    }
    public function addcard(Request $request)
    {
        try{
            $input = $request->all();
            $customer = \Stripe\Customer::create([
                'source' => $input["token"]["id"],
                'email' => Auth::user()->email,
            ]);
            $user = User::find(Auth::user()->id);
            $user->stripe_id = $customer["id"];
            $user->pm_last_four = $input["token"]["card"]["last4"];
            $user->pm_type = $input["token"]["card"]["brand"];
            $user->save();
            return response()->json($user, 200);
        }
        catch(\Exception $e){
          return response()->json(["success" => false, 'error'=>$e->getMessage()],500);
        }


        
        // $response =  \Stripe\Token::create([
        //     'card' => [
        //       'number' => '4242424242424242',
        //       'exp_month' => 1,
        //       'exp_year' => 2024,
        //       'cvc' => '314',
        //     ],
        //   ]);

        
   

        //  $charge = \Stripe\Charge::create([
        //     'amount' => 1000*100,
        //     'currency' => 'usd',
        //     'customer' => "cus_NC4RFLkNbm5KAA",
        // ]);
        
        // Payment::create([

        // ]);

        // return response()->json($charge, 200);
        // $valid = Validator::make($request->all(),[
        //     'card_name'=>'required|string',
        //     'card_number'=>'required|numeric|digits:16',
        //     'exp_month'=>'required|numeric|digits:2',
        //     'exp_year'=>'required|numeric|digits:2',
        //     'cvv'=>'required|numeric|digits:3',
        // ]);
        // if( $valid->fails())
        // {
        //     return response()->json(['success'=>true , 'error'=> $valid->errors()]);
        // }
        //  $user =User::with(['user_card'])->find(Auth::id());
        // if($user->user_card == null){
        //   $user->user_card()->create([
        //         'card_name' => $request->card_name,
        //         'card_number' =>$request->card_number,
        //         'exp_month' =>$request->exp_month,
        //         'exp_year' =>$request->exp_year,
        //         'cvv' =>$request->cvv                
        //     ]);
        //     $response['user_info'] = User::with(['user_card'])->find(Auth::id());
        //     return response()->json(['success'=>true , 'response'=> $response]);
        // }else{
        //     $response['user_info'] =User::with(['user_card'])->find(Auth::id());
        //     $response['error'] = 'Your card is already Uploaded';
        //     return response()->json(['success'=>true , 'response'=> $response]);
        // } 
        
        
        
    }
}
