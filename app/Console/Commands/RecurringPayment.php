<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\User;
use App\Models\Goal;
use App\Models\GoalHistory;
use App\Models\Payment;
use App\Models\TemporaryWallet;
use App\Models\Wallet;
use App\Models\Tranasaction;
use Carbon\Carbon;

class RecurringPayment extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'recurring:payment';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        try 
        {
            $stripe = \Stripe\Stripe::setApiKey('sk_test_51KqBmOL0gJLA6ttq4MZB4olAA4u8VVZy5HVl3Qr9dhw8vj9HUgVhuEfNoCZqo8VVMRiKHsjRXfOz0qooLlrt08iy00QjeWkBmS');
            $users = User::with('goal')->get();
            foreach($users as $user)
            {
                
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
                            // echo ;die;
                            if( $days == '8')
                            {
                                $charge = \Stripe\Charge::create([
                                    'amount' => $user->goal->amount_per_deduction*100,
                                    'currency' => 'usd',
                                    'customer' => $user->stripe_id,
                                ]);

                                Payment::create([
                                    'amount' => $payment->amount + $user->goal->amount_per_deduction,
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
                                    Payment::where('customer_id',$user->stripe_id)->delete();
                                    Tranasaction::create([
                                        'user_id' => $user->id,
                                        'amount' => $wallet->amout + $temporarywallet->amount,
                                        'date' => date('M-d-Y'),
                                        'reason' => 'Goal Complete',
                                        'type' => 'Credit',
                                        'status' => 'Credit',
                                    ]);
                                    GoalHistory::create([
                                        'goal_name' => $user->goal->goal_name,
                                        'amount_save' => $user->goal->amount_save,
                                        'plan' => $user->goal->plan,
                                        'starting_date' => $user->goal->starting_date,
                                        'ending_date' => $user->goal->ending_date,
                                        'number_deduction' => $user->goal->number_deduction,
                                        'amount_per_deduction' => $user->goal->amount_per_deduction,
                                        'cnd' => 1,
                                        'user_id' => $user->id,
                                        'created_at' => date('Y-m-d')
                                    ]);

                                    Tranasaction::create([
                                        'user_id' => $user->id,
                                        'amount' => $wallet->amout + $temporarywallet->amount,
                                        'date' => date('M-d-Y'),
                                        'reason' => 'Goal Complete',
                                        'type' => 'Credit',
                                        'status' => 'Credit',
                                    ]);
                                    $user->goal->delete();
                                    $wallet->update([
                                        'amount' => $wallet->amout + $temporarywallet->amount,
                                    ]);

                                    $user->update([
                                        'is_goal' => 0
                                    ]);

                                    $temporarywallet->update([
                                        'amount' => 0,
                                    ]);
                                }
                            }

                            if($days == '15')
                            {

                                $penalty =  $user->goal->amount_save / 10;
                                $chargeamount = $user->goal->amount_per_deduction + $penalty;
                                $charge = \Stripe\Charge::create([
                                    'amount' => $chargeamount*100,
                                    'currency' => 'usd',
                                    'customer' => $user->stripe_id,
                                ]);

                                Payment::create([
                                    'amount' => $payment->amount + $user->goal->amount_per_deduction,
                                    'penalty' => $penalty,
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
                                    Payment::where('customer_id',$user->stripe_id)->delete();
                                    GoalHistory::create([
                                        'goal_name' => $user->goal->goal_name,
                                        'amount_save' => $user->goal->amount_save,
                                        'plan' => $user->goal->plan,
                                        'starting_date' => $user->goal->starting_date,
                                        'ending_date' => $user->goal->ending_date,
                                        'number_deduction' => $user->goal->number_deduction,
                                        'amount_per_deduction' => $user->goal->amount_per_deduction,
                                        'cnd' => 1,
                                        'user_id' => $user->id,
                                        'created_at' => date('Y-m-d')
                                    ]);
                                    Tranasaction::create([
                                        'user_id' => $user->id,
                                        'amount' => $wallet->amout + $temporarywallet->amount,
                                        'date' => date('M-d-Y'),
                                        'reason' => 'Goal Complete',
                                        'type' => 'Credit',
                                        'status' => 'Credit',
                                    ]);
                                    $user->goal->delete();
                                    $wallet->update([
                                        'amount' => $wallet->amout + $temporarywallet->amount,
                                    ]);

                                    $user->update([
                                        'is_goal' => 0
                                    ]);

                                    $temporarywallet->update([
                                        'amount' => 0,
                                    ]);
                                }
                            }
                            
                            if($days == '22')
                            {

                                $penalty =  $user->goal->amount_save / 10;
                                $chargeamount = $user->goal->amount_per_deduction + $penalty;
                                $charge = \Stripe\Charge::create([
                                    'amount' => $chargeamount*100,
                                    'currency' => 'usd',
                                    'customer' => $user->stripe_id,
                                ]);

                                Payment::create([
                                    'amount' => $payment->amount + $user->goal->amount_per_deduction,
                                    'penalty' => $penalty,
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
                                    Payment::where('customer_id',$user->stripe_id)->delete();
                                    GoalHistory::create([
                                        'goal_name' => $user->goal->goal_name,
                                        'amount_save' => $user->goal->amount_save,
                                        'plan' => $user->goal->plan,
                                        'starting_date' => $user->goal->starting_date,
                                        'ending_date' => $user->goal->ending_date,
                                        'number_deduction' => $user->goal->number_deduction,
                                        'amount_per_deduction' => $user->goal->amount_per_deduction,
                                        'cnd' => 1,
                                        'user_id' => $user->id,
                                        'created_at' => date('Y-m-d')
                                    ]);
                                    Tranasaction::create([
                                        'user_id' => $user->id,
                                        'amount' => $wallet->amout + $temporarywallet->amount,
                                        'date' => date('M-d-Y'),
                                        'reason' => 'Goal Complete',
                                        'type' => 'Credit',
                                        'status' => 'Credit',
                                    ]);
                                    $user->goal->delete();
                                    $wallet->update([
                                        'amount' => $wallet->amout + $temporarywallet->amount,
                                    ]);

                                    $user->update([
                                        'is_goal' => 0
                                    ]);

                                    $temporarywallet->update([
                                        'amount' => 0,
                                    ]);
                                }
                            }

                            if($days == '29')
                            {

                                $penalty =  $user->goal->amount_save / 10;
                                $chargeamount = $user->goal->amount_per_deduction + $penalty;
                                $charge = \Stripe\Charge::create([
                                    'amount' => $chargeamount*100,
                                    'currency' => 'usd',
                                    'customer' => $user->stripe_id,
                                ]);

                                Payment::create([
                                    'amount' => $payment->amount + $user->goal->amount_per_deduction,
                                    'penalty' => $penalty,
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
                                    Payment::where('customer_id',$user->stripe_id)->delete();
                                    GoalHistory::create([
                                        'goal_name' => $user->goal->goal_name,
                                        'amount_save' => $user->goal->amount_save,
                                        'plan' => $user->goal->plan,
                                        'starting_date' => $user->goal->starting_date,
                                        'ending_date' => $user->goal->ending_date,
                                        'number_deduction' => $user->goal->number_deduction,
                                        'amount_per_deduction' => $user->goal->amount_per_deduction,
                                        'cnd' => 1,
                                        'user_id' => $user->id,
                                        'created_at' => date('Y-m-d')
                                    ]);
                                    Tranasaction::create([
                                        'user_id' => $user->id,
                                        'amount' => $wallet->amout + $temporarywallet->amount,
                                        'date' => date('M-d-Y'),
                                        'reason' => 'Goal Complete',
                                        'type' => 'Credit',
                                        'status' => 'Credit',
                                    ]);
                                    $user->goal->delete();
                                    $wallet->update([
                                        'amount' => $wallet->amout + $temporarywallet->amount,
                                    ]);

                                    $user->update([
                                        'is_goal' => 0
                                    ]);

                                    $temporarywallet->update([
                                        'amount' => 0,
                                    ]);
                                }
                            }
                        }
                    
                        if($user->goal->plan == 'bi-weekly')
                        {
                            // return $user->stripe_id;
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
                                    Payment::where('customer_id',$user->stripe_id)->delete();
                                    GoalHistory::create([
                                        'goal_name' => $user->goal->goal_name,
                                        'amount_save' => $user->goal->amount_save,
                                        'plan' => $user->goal->plan,
                                        'starting_date' => $user->goal->starting_date,
                                        'ending_date' => $user->goal->ending_date,
                                        'number_deduction' => $user->goal->number_deduction,
                                        'amount_per_deduction' => $user->goal->amount_per_deduction,
                                        'cnd' => 1,
                                        'user_id' => $user->id,
                                        'created_at' => date('Y-m-d')
                                    ]);
                                    Tranasaction::create([
                                        'user_id' => $user->id,
                                        'amount' => $wallet->amout + $temporarywallet->amount,
                                        'date' => date('M-d-Y'),
                                        'reason' => 'Goal Complete',
                                        'type' => 'Credit',
                                        'status' => 'Credit',
                                    ]);
                                    $user->goal->delete();
                                    $user->update([
                                        'is_goal' => 0
                                    ]);

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
                                    Payment::where('user_id',$user->id)->delete();
                                    GoalHistory::create([
                                        'goal_name' => $user->goal->goal_name,
                                        'amount_save' => $user->goal->amount_save,
                                        'plan' => $user->goal->plan,
                                        'starting_date' => $user->goal->starting_date,
                                        'ending_date' => $user->goal->ending_date,
                                        'number_deduction' => $user->goal->number_deduction,
                                        'amount_per_deduction' => $user->goal->amount_per_deduction,
                                        'cnd' => 1,
                                        'user_id' => $user->id,
                                        'created_at' => date('Y-m-d')
                                    ]);
                                    Tranasaction::create([
                                        'user_id' => $user->id,
                                        'amount' => $wallet->amout + $temporarywallet->amount,
                                        'date' => date('M-d-Y'),
                                        'reason' => 'Goal Complete',
                                        'type' => 'Credit',
                                        'status' => 'Credit',
                                    ]);
                                    $user->goal->delete();
                                    $wallet->update([
                                        'amount' => $wallet->amout + $temporarywallet->amount,
                                    ]);

                                    $user->update([
                                        'is_goal' => 0
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
        catch(\Stripe\Exception\CardException $e) {
            // Display the error message to the customer
            return response()->json(['error'=>$e->getMessage()]);
        }

    }
}
// amount \
// date
// reason
// type {'dabit/cradit'}
// status
// user id
