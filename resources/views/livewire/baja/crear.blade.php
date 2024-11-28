<div>
    <div class="relative w-full max-w-md max-h-full">
        <!-- Modal content -->
        <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
            <!-- Modal header -->
            <div class="flex items-center justify-between p-4 md:p-3 border-b rounded-t dark:border-gray-600">
                <h3 class="text-lg font-semibold text-gray-900 dark:text-white capitalize">
                    Registrar Baja
                </h3>
                <button type="button" wire:click="cerrar"
                    class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ms-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white">
                    <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none"
                        viewBox="0 0 14 14">
                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6" />
                    </svg>
                    <span class="sr-only">Close modal</span>
                </button>
            </div>
            <!-- Modal body -->
            <form class="p-4 md:p-5 text-left" wire:submit="save" novalidate>
                <!-- Almacen Select -->
                <div class="">
                    <label for="almacen_id"
                        class="block mb-1 text-sm font-medium text-gray-900 dark:text-white capitalize">Almacen</label>
                    <select id="almacen_id" wire:model="almacen_id" value="{{ old('tipo') }}"
                        class="block w-full p-2 mb-6 text-sm text-gray-900 border border-gray-300 rounded-lg bg-gray-50 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                        <option selected>Escoge un tipo</option>
                        @foreach ($almacenes as $almacen)
                            <option value="{{ $almacen->id }}">{{ $almacen->nombre }}</option>
                        @endforeach
                    </select>
                    @error('almacen_id')
                        <p class="mt-2 text-sm text-red-600 dark:text-red-500"> {{ $message }}</p>
                    @enderror
                </div>



                <!-- Identificador -->

                <div class="">
                    <label for="identificador"
                        class="block mb-1 text-sm font-medium text-gray-900 dark:text-white capitalize">#
                        Comprobante</label>
                    <input type="text" id="identificador" wire:model="identificador"
                        class="block w-full p-2 text-gray-900 border border-gray-300 rounded-lg bg-gray-50 text-xs focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                        value="{{ old('identificador') }}">
                    @error('identificador')
                        <p class="mt-2 text-sm text-red-600 dark:text-red-500"> {{ $message }}</p>
                    @enderror
                </div>

                <!-- Observaciones -->


                <div class="">
                    <label for="observaciones"
                        class="block mb-1 text-sm font-medium text-gray-900 dark:text-white capitalize">Observaciones</label>
                    <input type="text" id="observaciones" wire:model="observaciones"
                        class="block w-full p-2 text-gray-900 border border-gray-300 rounded-lg bg-gray-50 text-xs focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                        value="{{ old('observaciones') }}">
                    @error('observaciones')
                        <p class="mt-2 text-sm text-red-600 dark:text-red-500"> {{ $message }}</p>
                    @enderror
                </div>


                <!-- Detalles del Movimiento -->
                <div>
                    <h3 class="text-lg font-semibold mt-4">Detalles del Movimiento</h3>
                    <button type="button" wire:click="addDetalle"
                        class="mt-2 bg-blue-500 text-white rounded-md px-2 py-1">Agregar Detalle</button>

                    @foreach ($detalles as $index => $detalle)
                        <div class="flex items-center mt-2 space-x-2">
                            <select wire:model="detalles.{{ $index }}.item_id"
                                class="block w-full p-2  text-sm text-gray-900 border border-gray-300 rounded-lg bg-gray-50 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                                <option>Seleccione un ítem</option>
                                @foreach ($items as $item)
                                    <option value="{{ $item->id }}">{{ $item->codigo }} {{ $item->tipo }}
                                        {{ $item->tamaño }} {{ $item->color }}</option>
                                @endforeach
                            </select>
                            <input type="number" wire:model="detalles.{{ $index }}.cantidad"
                                class="block w-full p-2 text-sm text-gray-900 border border-gray-300 rounded-lg bg-gray-50 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                                placeholder="Cantidad" min="1" />
                            <button type="button" wire:click="removeDetalle({{ $index }})"
                                class="bg-red-500 text-white rounded-md px-2 py-1">Eliminar</button>
                        </div>
                        @error('detalles.' . $index . '.item_id')
                            <span class="text-red-500 text-sm">{{ $message }}</span>
                        @enderror
                        @error('detalles.' . $index . '.cantidad')
                            <span class="text-red-500 text-sm">{{ $message }}</span>
                        @enderror
                    @endforeach
                </div>

                <!-- Botón para guardar -->
                <div class="mt-4">
                    <button type="submit" class="w-full bg-green-600 text-white rounded-md px-4 py-2">Crear</button>
                </div>
                <div wire:loading>
                    <div
                        class="fixed inset-0 flex items-center justify-center bg-gray-50 bg-opacity-75 dark:bg-gray-800 dark:bg-opacity-75 z-50">
                        <div role="status">
                            <svg aria-hidden="true"
                                class="w-16 h-16 text-gray-200 animate-spin dark:text-gray-600 fill-blue-600"
                                viewBox="0 0 100 101" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path
                                    d="M100 50.5908C100 78.2051 77.6142 100.591 50 100.591C22.3858 100.591 0 78.2051 0 50.5908C0 22.9766 22.3858 0.59082 50 0.59082C77.6142 0.59082 100 22.9766 100 50.5908ZM9.08144 50.5908C9.08144 73.1895 27.4013 91.5094 50 91.5094C72.5987 91.5094 90.9186 73.1895 90.9186 50.5908C90.9186 27.9921 72.5987 9.67226 50 9.67226C27.4013 9.67226 9.08144 27.9921 9.08144 50.5908Z"
                                    fill="currentColor" />
                                <path
                                    d="M93.9676 39.0409C96.393 38.4038 97.8624 35.9116 97.0079 33.5539C95.2932 28.8227 92.871 24.3692 89.8167 20.348C85.8452 15.1192 80.8826 10.7238 75.2124 7.41289C69.5422 4.10194 63.2754 1.94025 56.7698 1.05124C51.7666 0.367541 46.6976 0.446843 41.7345 1.27873C39.2613 1.69328 37.813 4.19778 38.4501 6.62326C39.0873 9.04874 41.5694 10.4717 44.0505 10.1071C47.8511 9.54855 51.7191 9.52689 55.5402 10.0491C60.8642 10.7766 65.9928 12.5457 70.6331 15.2552C75.2735 17.9648 79.3347 21.5619 82.5849 25.841C84.9175 28.9121 86.7997 32.2913 88.1811 35.8758C89.083 38.2158 91.5421 39.6781 93.9676 39.0409Z"
                                    fill="currentFill" />
                            </svg>
                            <span class="sr-only">Loading...</span>
                        </div>
                    </div>


                </div>
            </form>
        </div>
    </div>


</div>
