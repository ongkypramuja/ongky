<?php

use Illuminate\Database\Seeder;

class ProductsTableSeeder extends Seeder
{

    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {
        

        \DB::table('products')->delete();
        
        \DB::table('products')->insert(array (
            0 => 
            array (
                'id' => 1,
            'name' => 'klepon',
                'image_name' => 'basah01.jpg',
                'description' => '<div class="ng-scope">
<p>rasanyan enak</p>
</div>',
                'colors' => '#c0c0c0',
                'price' => 214200,
                'discount' => 205000,
                'tag' => 'New',
                'category_id' => 1,
                'created_at' => '2019-02-09',
                'updated_at' => '2019-02-09',
            ),
            
        ));
        
        
    }
}