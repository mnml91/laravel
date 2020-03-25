<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class DkaController extends Controller
{
    public function index()
    {
        return view('dka.index');
    }

    /**
     * @return array
     */
    public function chartData()
    {
        return [
            'labels' => ['march', 'april', 'may', 'june'],
            'datasets' => [
                [
                    'label' => 'Sels',
                    'backgroundColor' => ['#F26202', '#D01919', '#EAAE00', '#B5CC18'],
                    'data' => [rand(0, 1000), rand(0, 1000), rand(0, 1000), rand(0, 1000)]
                ]
            ]
        ];
    }
}
