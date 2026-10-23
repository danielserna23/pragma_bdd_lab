# Pragma BDD Lab

Proyecto Flutter de ejemplo para automatizar pruebas de interfaz con [SuuprTest](https://suuprtests.duupr.io/).

[Repositorio en GitHub](https://github.com/danielserna23/pragma_bdd_lab)

## Requisitos

- Flutter y Dart instalados.
- Un emulador o dispositivo Android disponible para ejecutar las pruebas.
- La aplicación SuuprTest instalada en el dispositivo.

## Instalar SuuprTest

Agrega el paquete de desarrollo al proyecto:

```sh
flutter pub add suupr_tests
```

También puedes declararlo directamente en `pubspec.yaml`:

```yaml
dependencies:
  suupr_tests: 1.0.0-beta.6
```

Importa el paquete donde lo necesites:

```dart
import 'package:suupr_tests/suupr_tests.dart';
```

Más información: [suupr_tests en pub.dev](https://pub.dev/packages/suupr_tests).

## Configurar el CLI

Agrega el paquete de CLI como dependencia de desarrollo:

```sh
dart pub add dev:suupr_tests_cli
```

Activa el ejecutable global:

```sh
dart pub global activate suupr_tests_cli
```

Si el comando no está disponible, agrega el directorio de ejecutables de Dart al `PATH`:

```sh
export PATH="$PATH:$HOME/.pub-cache/bin"
```

Más información: [suupr_tests_cli en pub.dev](https://pub.dev/packages/suupr_tests_cli).

## Ejecutar una prueba

Desde la raíz del proyecto, ejecuta el CLI indicando la ruta de la aplicación, el identificador del dispositivo y el archivo JSON del escenario:

```sh
suupr_tests_cli run --app-path . --device-id emulator-5554 test/suuprtest/e1_login_exitoso.json
```

Reemplaza `emulator-5554` por el identificador de tu dispositivo y verifica que el archivo del escenario exista en `test/suuprtest/`.

## Descargar SuuprTest

[Visita SuuprTest](https://suuprtests.duupr.io/).
