<div class="container mx-auto">
    <figure
        class="p-3 bg-white border-b border-gray-200 rounded-lg md:border-e dark:bg-gray-700 dark:border-gray-700">
        <h5 class="mb-2 text-xl font-bold tracking-tight text-gray-900 dark:text-gray-100">Consultas</h5>

        <div>
            <div class="mb-5">
                <label for="user-select" class="block text-base font-medium text-gray-700 dark:text-gray-200 m-4">
                    Filtro de movimientos por usuario
                </label>
                <select id="user-select" wire:model.live="selectedUser" 
                        class="mt-1 p-2 rounded block  bg-white  text-gray-900 dark:bg-gray-800 dark:border-gray-600 dark:text-gray-100 focus:ring-blue-500 focus:border-blue-500">
                    <option value="">-- Selecciona un usuario --</option>
                    @foreach($users as $user)
                        <option value="{{ $user->id }}">{{ $user->name }} {{ $user->lastname }}</option>
                    @endforeach
                </select>
            </div>

            @if($movements)
                <table class="min-w-full  table-auto ">
                    <thead>
                        <tr class="bg-gray-100 dark:bg-gray-800 ">
                            <th class="  px-4 py-2 text-gray-900 dark:text-gray-100">Fecha</th>
                            <th class=" px-4 py-2 text-gray-900 dark:text-gray-100">Identificador</th>
                            @foreach($items as $item)
                                <th class=" px-4 py-2 text-gray-900 dark:text-gray-100">{{ $item->codigo }}</th>
                            @endforeach
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($movements as $movement)
                            <tr class="bg-white dark:bg-gray-700">
                                <td class=" px-4 py-2 text-gray-900 dark:text-gray-100">{{ $movement['fecha'] }}</td>
                                <td class=" px-4 py-2 text-gray-900 dark:text-gray-100">{{ $movement['identificador'] }}</td>
                                @foreach($items as $item)
                                    <td class=" px-4 py-2 text-gray-900 dark:text-gray-100">
                                        {{ $movement['items'][$item->id] ?? 0 }}
                                    </td>
                                @endforeach
                            </tr>
                        @endforeach
                    </tbody>
                    <tfoot>
                        <tr class="bg-gray-100 dark:bg-gray-800">
                            <td class=" px-4 py-2 font-bold text-gray-900 dark:text-gray-100" colspan="2">
                                Total
                            </td>
                            @foreach($items as $item)
                                <td class=" px-4 py-2 font-bold text-gray-900 dark:text-gray-100">
                                    {{ $totals[$item->id] ?? 0 }}
                                </td>
                            @endforeach
                        </tr>
                    </tfoot>
                </table>
            @endif
        </div>
    </figure>
</div>
