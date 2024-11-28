<div>
    <div class="relative w-full max-w-md max-h-full">
        <!-- Modal content -->
        <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
            <!-- Modal header -->
            <div class="flex items-center justify-between p-4 md:p-3 border-b rounded-t dark:border-gray-600">
                <h3 class="text-lg font-semibold text-gray-900 dark:text-white capitalize">
                    Crear nuevo usuario
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

                <div class="flex gap-2">
                    <div class=" w-1/2">
                        <label for="name"
                            class="block mb-1 text-sm font-medium text-gray-900 dark:text-white capitalize">nombre</label>
                        <input type="text" id="name" wire:model="name"
                            class="block w-full p-2 text-gray-900 border border-gray-300 rounded-lg bg-gray-50 text-xs focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                            value="{{ old('name') }}">
                        @error('name')
                            <p class="mt-2 text-sm text-red-600 dark:text-red-500"> {{ $message }}</p>
                        @enderror
                    </div>

                    <div class=" w-1/2">
                        <label for="lastname"
                            class="block mb-1 text-sm font-medium text-gray-900 dark:text-white capitalize">Apellido</label>
                        <input type="text" id="lastname" wire:model="lastname"
                            class="block w-full p-2 text-gray-900 border border-gray-300 rounded-lg bg-gray-50 text-xs focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                            value="{{ old('lastname') }}">
                        @error('lastname')
                            <p class="mt-2 text-sm text-red-600 dark:text-red-500"> {{ $message }}</p>
                        @enderror
                    </div>
                </div>

                <div class="flex gap-2">
                    <div class=" w-1/2">
                        <label for="rol"
                            class="block mb-1 text-sm font-medium text-gray-900 dark:text-white capitalize">Rol</label>
                        <select id="rol" wire:model="rol" value="{{ old('rol') }}"
                            class="block w-full p-2 mb-6 text-sm text-gray-900 border border-gray-300 rounded-lg bg-gray-50 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                            <option selected>Escoge un rol</option>
                            <option value="admi">Admi</option>
                            <option value="jef">Jefatura</option>
                            <option value="despachador">Despachador</option>
                            <option value="transporte">Transporte</option>
                            <option value="cliente">Cliente</option>
                        </select>
                        @error('rol')
                            <p class="mt-2 text-sm text-red-600 dark:text-red-500"> {{ $message }}</p>
                        @enderror
                    </div>

                    <div class=" w-1/2">
                        <label for="almacen_id"
                            class="block mb-1 text-sm font-medium text-gray-900 dark:text-white capitalize">Almacen</label>
                        <select id="almacen_id" wire:model="almacen_id" value="{{ old('almacen_id') }}"
                            class="block w-full p-2 mb-6 text-sm text-gray-900 border border-gray-300 rounded-lg bg-gray-50 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                            <option selected>Escoge un almacen</option>
                            @foreach ($almacenes as $almacen)
                                <option value="{{ $almacen->id }}">{{ $almacen->nombre }}</option>
                            @endforeach
                        </select>
                        @error('rol')
                            <p class="mt-2 text-sm text-red-600 dark:text-red-500"> {{ $message }}</p>
                        @enderror
                    </div>

                </div>

                <div class="flex gap-2">
                    <div class=" w-1/2">
                        <label for="login"
                            class="block mb-1 text-sm font-medium text-gray-900 dark:text-white capitalize">Login</label>
                        <input type="text" id="login" wire:model="login"
                            class="block w-full p-2 text-gray-900 border border-gray-300 rounded-lg bg-gray-50 text-xs focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                            value="{{ old('login') }}">
                        @error('login')
                            <p class="mt-2 text-sm text-red-600 dark:text-red-500"> {{ $message }}</p>
                        @enderror
                    </div>

                    <div class="w-1/2">
                        <label for="password"
                            class="block mb-1 text-sm font-medium text-gray-900 dark:text-white capitalize">Password</label>
                        <div class="relative">
                            <input type="{{ $showPassword ? 'text' : 'password' }}" id="password"
                                wire:model="password"
                                class="block w-full p-2 text-gray-900 border border-gray-300 rounded-lg bg-gray-50 text-xs focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                                value="{{ old('password') }}">
                            <button type="button" wire:click="$toggle('showPassword')"
                                class="absolute inset-y-0 right-0 flex items-center pr-3">

                                @if ($showPassword)
                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                        stroke-width="1.5" stroke="currentColor" class="h-4 w-4">
                                        <path stroke-linecap="round" stroke-linejoin="round"
                                            d="M2.036 12.322a1.012 1.012 0 0 1 0-.639C3.423 7.51 7.36 4.5 12 4.5c4.638 0 8.573 3.007 9.963 7.178.07.207.07.431 0 .639C20.577 16.49 16.64 19.5 12 19.5c-4.638 0-8.573-3.007-9.963-7.178Z" />
                                        <path stroke-linecap="round" stroke-linejoin="round"
                                            d="M15 12a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z" />
                                    </svg>
                                @else
                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                        stroke-width="1.5" stroke="currentColor" class="h-4 w-4">
                                        <path stroke-linecap="round" stroke-linejoin="round"
                                            d="M3.98 8.223A10.477 10.477 0 0 0 1.934 12C3.226 16.338 7.244 19.5 12 19.5c.993 0 1.953-.138 2.863-.395M6.228 6.228A10.451 10.451 0 0 1 12 4.5c4.756 0 8.773 3.162 10.065 7.498a10.522 10.522 0 0 1-4.293 5.774M6.228 6.228 3 3m3.228 3.228 3.65 3.65m7.894 7.894L21 21m-3.228-3.228-3.65-3.65m0 0a3 3 0 1 0-4.243-4.243m4.242 4.242L9.88 9.88" />
                                    </svg>
                                @endif


                            </button>
                        </div>
                        @error('password')
                            <p class="mt-2 text-sm text-red-600 dark:text-red-500"> {{ $message }}</p>
                        @enderror
                    </div>
                </div>

                <p class="text-blue-500 cursor-pointer" wire:click="$toggle('mostrarDiv')">+ Agregar mas informacion
                </p>
                @if ($mostrarDiv)
                    <div class="my-2">
                        <div class="flex gap-2">
                            <div class=" w-1/2">
                                <label for="telefono"
                                    class="block mb-1 text-sm font-medium text-gray-900 dark:text-white capitalize">Telefono</label>
                                <input type="phone" id="telefono" wire:model="telefono"
                                    class="block w-full p-2 text-gray-900 border border-gray-300 rounded-lg bg-gray-50 text-xs focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                                    value="{{ old('telefono') }}">
                                @error('telefono')
                                    <p class="mt-2 text-sm text-red-600 dark:text-red-500"> {{ $message }}</p>
                                @enderror
                            </div>

                            <div class=" w-1/2">
                                <label for="direccion"
                                    class="block mb-1 text-sm font-medium text-gray-900 dark:text-white capitalize">Direccion</label>
                                <input type="text" id="direccion" wire:model="direccion"
                                    class="block w-full p-2 text-gray-900 border border-gray-300 rounded-lg bg-gray-50 text-xs focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                                    value="{{ old('direccion') }}">
                                @error('direccion')
                                    <p class="mt-2 text-sm text-red-600 dark:text-red-500"> {{ $message }}</p>
                                @enderror
                            </div>
                        </div>
                        <div class="flex gap-2">
                            <div class=" w-1/2">
                                <label for="ruta"
                                    class="block mb-1 text-sm font-medium text-gray-900 dark:text-white capitalize">Ruta</label>
                                <input type="phone" id="ruta" wire:model="ruta"
                                    class="block w-full p-2 text-gray-900 border border-gray-300 rounded-lg bg-gray-50 text-xs focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                                    value="{{ old('ruta') }}">
                                @error('ruta')
                                    <p class="mt-2 text-sm text-red-600 dark:text-red-500"> {{ $message }}</p>
                                @enderror
                            </div>

                            <div class=" w-1/2">
                                <label for="placa"
                                    class="block mb-1 text-sm font-medium text-gray-900 dark:text-white capitalize">Placa</label>
                                <input type="text" id="placa" wire:model="placa"
                                    class="block w-full p-2 text-gray-900 border border-gray-300 rounded-lg bg-gray-50 text-xs focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                                    value="{{ old('placa') }}">
                                @error('placa')
                                    <p class="mt-2 text-sm text-red-600 dark:text-red-500"> {{ $message }}</p>
                                @enderror
                            </div>
                        </div>
                    </div>
                @endif
                <button type="submit"
                    class="block text-white  items-center bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
                    Agregar

                </button>

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
