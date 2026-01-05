<?php
namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class NewSeader extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        for ($i = 1; $i <= 10; $i++) {
            \DB::table('new_table')->insert([
                'title' => fake() ->sentence(6),
                'body' => fake() ->text(200),
            ]);
        }
    }
}


?>