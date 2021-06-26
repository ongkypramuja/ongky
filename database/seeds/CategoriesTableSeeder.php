<?php

use Illuminate\Database\Seeder;

class CategoriesTableSeeder extends Seeder
{

    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {
        

        \DB::table('categories')->delete();
        
        \DB::table('categories')->insert(array (
            0 => 
            array (
                'id' => 1,
                'name' => 'kue basah',
                'type' => 'kue basah',
                'created_at' => '2019-02-09',
                'updated_at' => '2019-02-09',
            ),
           
        ));
        
        
    }
}