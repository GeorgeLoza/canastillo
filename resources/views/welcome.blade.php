@extends('layout.app')

@section('titulo')
Dashboard
@endsection

@section('contenido')
    @livewire('consultas.consultausuario')
@livewire('dashboard.resumen')
@endsection
