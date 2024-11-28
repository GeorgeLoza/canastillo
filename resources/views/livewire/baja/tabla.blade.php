<div>


    <div class="relative overflow-x-auto shadow-md sm:rounded-lg">
        <table class="w-full text-xs text-left rtl:text-right text-gray-500 dark:text-gray-400">
            <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
                <tr>
                    <th scope="col" class="px-2 py-1">
                        #
                    </th>
                    <th scope="col" class="px-2 py-1">
                        Tiempo
                    </th>
                    <th scope="col" class="px-2 py-1">
                        Identificador
                    </th>
                    <th scope="col" class="px-2 py-1">
                        almacen
                    </th>
                    <th scope="col" class="px-2 py-1">
                        usuario
                    </th>
                    <th scope="col" class="px-2 py-1">
                        observaciones
                    </th>
                    <th scope="col" class="px-2 py-1">
                        accion
                    </th>
                </tr>
            </thead>
            <tbody>
                @foreach ($movimientos as $movimiento)
                    <tr
                        class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600">
                        <th scope="row"
                            class="px-2 py-1.5 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                            {{ $loop->iteration }}
                        </th>
                        <td class="px-2 py-1.5">
                            {{ $movimiento->tiempo }}
                        </td>
                        <td class="px-2 py-1.5">
                            {{ $movimiento->identificador }}
                        </td>
                        <td class="px-2 py-1.5">
                            {{ $movimiento->almacen->nombre }}
                        </td>
                        <td class="px-2 py-1.5">
                            {{ $movimiento->despachador->name }} {{ $movimiento->despachador->lastname }}
                        </td>
                        <td class="px-2 py-1.5">
                            {{ $movimiento->observaciones }}
                        </td>
                        <td class="px-2 py-1.5">
                            <div class="flex gap-3">

                                <button wire:click="toggleRow({{ $movimiento->id }})"
                                    class="text-blue-600 hover:underline">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"
                                        class="w-5 h-5 fill-green-500">
                                        <path
                                            d="M288 32c-80.8 0-145.5 36.8-192.6 80.6C48.6 156 17.3 208 2.5 243.7c-3.3 7.9-3.3 16.7 0 24.6C17.3 304 48.6 356 95.4 399.4C142.5 443.2 207.2 480 288 480s145.5-36.8 192.6-80.6c46.8-43.5 78.1-95.4 93-131.1c3.3-7.9 3.3-16.7 0-24.6c-14.9-35.7-46.2-87.7-93-131.1C433.5 68.8 368.8 32 288 32zM144 256a144 144 0 1 1 288 0 144 144 0 1 1 -288 0zm144-64c0 35.3-28.7 64-64 64c-7.1 0-13.9-1.2-20.3-3.3c-5.5-1.8-11.9 1.6-11.7 7.4c.3 6.9 1.3 13.8 3.2 20.7c13.7 51.2 66.4 81.6 117.6 67.9s81.6-66.4 67.9-117.6c-11.1-41.5-47.8-69.4-88.6-71.1c-5.8-.2-9.2 6.1-7.4 11.7c2.1 6.4 3.3 13.2 3.3 20.3z" />
                                    </svg>
                                </button>
                                <!-- Botón para editar el movimiento completo -->



                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"
                                    class="w-5 h-5 fill-blue-500"
                                    wire:click="$dispatch('openModal', {component: 'baja.editar', arguments: {id: {{ $movimiento->id }}}})">
                                    <path
                                        d="M362.7 19.3L314.3 67.7 444.3 197.7l48.4-48.4c25-25 25-65.5 0-90.5L453.3 19.3c-25-25-65.5-25-90.5 0zm-71 71L58.6 323.5c-10.4 10.4-18 23.3-22.2 37.4L1 481.2C-1.5 489.7 .8 498.8 7 505s15.3 8.5 23.7 6.1l120.3-35.4c14.1-4.2 27-11.8 37.4-22.2L421.7 220.3 291.7 90.3z" />
                                </svg>

                                <!-- Botón para eliminar el movimiento completo -->
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"
                                    class="w-4 h-4 fill-red-600" wire:click="deleteMovimiento({{ $movimiento->id }})"
                                    wire:confirm="Esta seguro que desea borrar la compra?">
                                    <path
                                        d="M135.2 17.7L128 32 32 32C14.3 32 0 46.3 0 64S14.3 96 32 96l384 0c17.7 0 32-14.3 32-32s-14.3-32-32-32l-96 0-7.2-14.3C307.4 6.8 296.3 0 284.2 0L163.8 0c-12.1 0-23.2 6.8-28.6 17.7zM416 128L32 128 53.2 467c1.6 25.3 22.6 45 47.9 45l245.8 0c25.3 0 46.3-19.7 47.9-45L416 128z" />
                                </svg>
                            </div>
                        </td>
                    </tr>
                    <!-- Subtabla para mostrar los detalles del movimiento -->
                    @if ($expandedRow === $movimiento->id)
                        <tr class="">
                            <td colspan="6" class="p-0">
                                <table class="w-full bg-gray-50 dark:bg-gray-700">
                                    <thead>
                                        <tr>
                                            <th class="px-2 py-1.5">#</th>
                                            <th class="px-2 py-1.5">Ítem</th>
                                            <th class="px-2 py-1.5">Cantidad</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($movimiento->detalles as $detalle)
                                            <tr
                                                class="bg-white dark:bg-gray-800 hover:bg-gray-50 dark:hover:bg-gray-600">
                                                <td class="px-2 py-1.5">
                                                    {{ $loop->iteration }}
                                                </td>
                                                <td class="px-2 py-1.5">
                                                    {{ $detalle->item->codigo }} {{ $detalle->item->tipo }}
                                                    {{ $detalle->item->tamaño }} {{ $detalle->item->color }}
                                                </td>

                                                <td class="px-2 py-1.5">
                                                    {{ $detalle->cantidad }}
                                                </td>

                                            </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                    @endif
                @endforeach

            </tbody>
        </table>
    </div>


    <div wire:loading>
        <div
            class="fixed inset-0 flex items-center justify-center bg-gray-50 bg-opacity-75 dark:bg-gray-800 dark:bg-opacity-75 z-50">
            <div role="status">
                <svg aria-hidden="true" class="w-16 h-16 text-gray-200 animate-spin dark:text-gray-600 fill-blue-600"
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
</div>
