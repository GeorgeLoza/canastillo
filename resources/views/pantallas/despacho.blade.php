@extends('layout.app')

@section('titulo')
    <div></div>
    <h1>Despachos</h1>
    <!--Boton Crear -->
    <button class="px-2 py-1 bg-green-500 rounded-lg text-xs text-white uppercase"
        onclick="Livewire.dispatch('openModal', { component: 'despacho.crear' })">
        nuevo</button>
@endsection

@section('contenido')
@livewire('despacho.tabla')
@endsection
