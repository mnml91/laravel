<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class DkaController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        return view('dka.index');
    }

    /**
     * @return array
     */
    public function chartPieData()
    {
        return [
            'labels' => ['march', 'april', 'may', 'june'],
            'datasets' => [
                [
                    'label' => '2019',
                    'backgroundColor' => ['#F26202', '#D01919', '#EAAE00', '#B5CC18'],
                    'data' => [rand(0, 1000), rand(0, 1000), rand(0, 1000), rand(0, 1000)]
                ],
            ]
        ];
    }

    /**
     * @return array
     */
    public function chartLineData()
    {
        return [
            'labels' => ['march', 'april', 'may', 'june'],
            'datasets' => [
                [
                    'label' => '2018',
                    'backgroundColor' => '#F26202',
                    'data' => [rand(0, 1000), rand(0, 1000), rand(0, 1000), rand(0, 1000)]
                ],
                [
                    'label' => '2019',
                    'backgroundColor' => '#B5CC18',
                    'data' => [rand(0, 1000), rand(0, 1000), rand(0, 1000), rand(0, 1000)]
                ],
                [
                    'label' => '2020',
                    'backgroundColor' => '#EAAE00',
                    'data' => [rand(0, 1000), rand(0, 1000), rand(0, 1000), rand(0, 1000)]
                ],
            ]
        ];
    }
}
