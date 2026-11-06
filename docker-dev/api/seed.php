<?php

require '/app/vendor/autoload.php';
$app = require '/app/bootstrap/app.php';
$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

// The existing seeders insert fixed users and products; run only on an empty database.
if (!App\Models\User::query()->exists() && !App\Models\Product::query()->exists()) {
    Illuminate\Support\Facades\DB::transaction(function () use ($kernel) {
        $status = $kernel->call('db:seed', ['--force' => true]);
        echo $kernel->output();
        if ($status !== 0) {
            throw new RuntimeException('No se pudieron cargar los datos iniciales.');
        }
    });
    exit(0);
}

echo "Datos existentes: se omiten los seeders.\n";
