<form class="md:w-1/2 space-y-5" wire:submit.prevent='editarVacante'>

    <div>
        <x-input-label for="titulo" :value="__('Titulo Vacante')" />

        <x-text-input id="titulo" class="block mt-1 w-full" type="text" wire:model="titulo" :value="old('titulo')" placeholder="Titulo Vacante" />

        @error('titulo')
            <livewire:mostrar-alerta :message="$message" />
        @enderror
    </div>

    <div>
        <x-input-label for="salario" :value="__('Salario Mensual')" />

        <select id="salario" wire:model="salario" class="rounded-md shadow-sm border-gray-300 focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 w-full">
            <option value="">-- Seleccione el salario --</option>
            @foreach ($salarios as $salario)
                <option value="{{$salario->id}}">{{$salario->salario}}</option>
            @endforeach
        </select>

        @error('salario')
            <livewire:mostrar-alerta :message="$message" />
        @enderror
    </div>

    <div>
        <x-input-label for="categoria" :value="__('Categoria')" />

        <select id="categoria" wire:model="categoria" class="rounded-md shadow-sm border-gray-300 focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 w-full">
            <option value="">-- Seleccione la categoria --</option>
            @foreach ($categorias as $categoria)
                <option value="{{$categoria->id}}">{{$categoria->categoria}}</option>
            @endforeach
        </select>

        @error('categoria')
            <livewire:mostrar-alerta :message="$message" />
        @enderror
    </div>

    <div>
        <x-input-label for="empresa" :value="__('Empresa')" />

        <x-text-input id="empresa" class="block mt-1 w-full" type="text" wire:model="empresa" :value="old('empresa')" placeholder="Empresa: ej. Netflix, Uber, Shopify" />

        @error('empresa')
            <livewire:mostrar-alerta :message="$message" />
        @enderror
    </div>

    <div>
        <x-input-label for="ultimo_dia" :value="__('Ultimo dia para postularse')" />

        <x-text-input id="ultimo_dia" class="block mt-1 w-full" type="date" wire:model="ultimo_dia" :value="old('ultimo_dia')" />

        @error('ultimo_dia')
            <livewire:mostrar-alerta :message="$message" />
        @enderror
    </div>

    <div>
        <x-input-label for="descripcion" :value="__('Descripcion Puesto')" />

        <textarea id="descripcion" wire:model="descripcion" :value="old('ultimo_dia')" placeholder="Descripcion general del puesto, experiencia" 
            class="rounded-md shadow-sm border-gray-300 focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 w-full h-72"></textarea>
        
        @error('descripcion')
            <livewire:mostrar-alerta :message="$message" />
        @enderror
    </div>

    <div>

        <div class="my-5 w-80">
            <x-input-label :value="__('Imagen Actual')" />

            <img src="{{asset('storage/vacantes/' . $imagen)}}" alt="{{"Imagen de Vacante " . $titulo}}">
        </div>

        <x-input-label for="imagen" :value="__('Nueva Imagen')" />

        <x-text-input id="imagen" class="block mt-1 w-full" type="file" wire:model="imagen_nueva" accept="image/*" />

        <div class="my-5 w-80">
            @if($imagen_nueva)
                Imagen nueva:
                <img src="{{$imagen_nueva->temporaryUrl()}}" >
            @endif
        </div>

        @error('imagen_nueva')
            <livewire:mostrar-alerta :message="$message" />
        @enderror
    </div>

    <x-primary-button class="w-full justify-center">
        {{ __('Guardar cambios') }}
    </x-primary-button>

</form>