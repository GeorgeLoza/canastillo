<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Controller;

class LoginController extends Controller
{

    // Constructor del controlador

    public function index()
    {
        if (Auth::check()) {
            // Redirige al usuario a la página principal o al dashboard si ya está autenticado
            return redirect()->intended('/');
        }
        return view('auth.login');
    }
    public function store(Request $request)
    {

        $credentials = $request->only('login', 'password');

        if (Auth::attempt($credentials)) {
            $request->session()->regenerate();
            return redirect()->intended('/');
        }

        return back()->withErrors([
            'login' => 'Las credenciales no son correctas.',
        ]);
    }
    public function cerrar(Request $request)
    {
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return redirect('/');
    }
}
