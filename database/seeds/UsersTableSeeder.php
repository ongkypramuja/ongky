<?php

use Illuminate\Database\Seeder;

class UsersTableSeeder extends Seeder
{

    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {
        

        \DB::table('users')->delete();
        
        \DB::table('users')->insert(array (
            0 => 
            array (
                'id' => 1,
                'full_name' => 'suarti',
                'email' => 'suarti@gmail.com',
                'password' => '12345',
                'prev_password' => NULL,
                'address_id' => 1,
                'phone' => '01711001133',
                'created_at' => '2019-02-09',
                'updated_at' => '2019-02-09',
            ),
            
        ));
        
        
    }
}