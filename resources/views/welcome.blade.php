@extends('layout.app')

@section('titulo')
<div></div>
    <h1>Dashboard</h1>
    <div></div>
@endsection

@section('contenido')
    @livewire('consultas.consultausuario')
{{-- @livewire('dashboard.resumen') --}}
@endsection
