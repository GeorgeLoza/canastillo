<div>
    
    <figure
            class="  p-3  bg-white border-b border-gray-200 rounded-t-lg md:rounded-t-none md:rounded-ss-lg md:border-e dark:bg-gray-800 dark:border-gray-700">
            <h5 class="mb-2 text-xl font-bold tracking-tight text-gray-900 dark:text-white ">Consultas</h5>

            <div>
                <div class="mb-4">
                    <label for="user-select" class="block text-sm font-medium">Seleccionar Usuario</label>
                    <select id="user-select" class="mt-1 block w-full" wire:model.live="selectedUser">
                        <option value="">-- Selecciona un usuario --</option>
                        @foreach($users as $user)
                            <option value="{{ $user->id }}">{{ $user->name }} {{ $user->lastname }}</option>
                        @endforeach
                    </select>
                </div>
            
                @if($movements)
                    <table class="min-w-full border-collapse border border-gray-300">
                        <thead>
                            <tr>
                                <th class="border border-gray-300 px-4 py-2">Fecha</th>
                                <th class="border border-gray-300 px-4 py-2">Identificador</th>
                                @foreach($items as $item)
                                    <th class="border border-gray-300 px-4 py-2">{{ $item->codigo }}</th>
                                @endforeach
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($movements as $movement)
                                <tr>
                                    <td class="border border-gray-300 px-4 py-2">{{ $movement['fecha'] }}</td>
                                    <td class="border border-gray-300 px-4 py-2">{{ $movement['identificador'] }}</td>
                                    @foreach($items as $item)
                                        <td class="border border-gray-300 px-4 py-2">{{ $movement['items'][$item->id] ?? 0 }}</td>
                                    @endforeach
                                </tr>
                            @endforeach
                        </tbody>
                        <tfoot>
                            <tr>
                                <td class="border border-gray-300 px-4 py-2 font-bold" colspan="2">Total</td>
                                @foreach($items as $item)
                                    <td class="border border-gray-300 px-4 py-2 font-bold">{{ $totals[$item->id] ?? 0 }}</td>
                                @endforeach
                            </tr>
                        </tfoot>
                    </table>
                @endif
            </div>
            
            
            
        </figure>
</div>
