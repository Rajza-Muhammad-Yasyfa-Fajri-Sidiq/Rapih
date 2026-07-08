<?php

namespace App\Http\Controllers;

use Spatie\Activitylog\Models\Activity;
use Illuminate\Http\Request;

class ActivityLogController extends Controller
{
    public function index(Request $request)
    {
        $query = Activity::with('causer')->latest();
        if ($request->filled('search')) {
            $query->where('description', 'like', '%' . $request->search . '%')
                  ->orWhere('subject_type', 'like', '%' . $request->search . '%');
        }
        $activities = $query->paginate(15)->withQueryString();
        return view('activity-log.index', compact('activities'));
    }
}
