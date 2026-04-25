# NYAPU / TDIT FromFile Audit

## 1. Resumen ejecutivo

- En este repositorio **no existen** las carpetas `Mods/TDIT - Portraits for Extras/` ni `Mods/TDIT - Portraits for Vendors/`, por lo que no fue posible inspeccionar sus `content.json`/assets locales directamente.
- Sí existe el paquete `nyapu/extracted/Nyapu-style TDIT-40531-1-0-1-1767799752/Nyapu TDIT/`, y contiene retratos para los targets reportados (`DesertTrader_Default`, `OldMariner_Default`, `Raccoon_Default`, etc.).
- Sin embargo, **Nyapu TDIT no es válido como Content Patcher pack en su estado actual**: tanto `manifest.json` como `content.json` tienen comas finales inválidas en JSON.
- Conclusión técnica: Nyapu TDIT parece ser la cobertura correcta de assets para Extras/Central Station, pero **primero requiere saneo JSON**; además, falta validar localmente el paquete base `TDIT - Portraits for Extras` (no presente en este workspace).

## 2. Warnings confirmados

Warnings reportados por SMAPI (según tu log) y auditados contra la cobertura de `Nyapu TDIT`:

- `TDIT - Portraits for Extras > Load Portraits/DesertTrader_Default`
- `TDIT - Portraits for Extras > Load Portraits/OldMariner_Default`
- `TDIT - Portraits for Extras > Load Portraits/Raccoon_Default`
- y otros targets equivalentes de la misma familia (`*_Default`, `OldMariner_*`, etc.)

Estado de reproducción en este repo:

- No se puede re-ejecutar el warning exacto aquí porque no están las carpetas `Mods/TDIT - Portraits for Extras` / `Vendors`.
- Sí se confirma que `Nyapu TDIT` incluye los PNG para esos targets (por ejemplo `assets/DesertTrader_Default.png`, `assets/OldMariner_Default.png`, `assets/Raccoon_Default.png`).

## 3. Tabla de assets faltantes

> Criterio: se listan los targets de `Nyapu TDIT/content.json` que normalmente aparecen en warnings de Extras/Central Station cuando faltan PNG base. Dado que `Mods/TDIT - Portraits for Extras` y `Vendors` no están en este repo, esas columnas quedan en `N/A (carpeta ausente)`.

| Target | FromFile | Archivo esperado | Existe en TDIT Extras | Existe en TDIT Vendors | Existe en Nyapu TDIT | Clasificación target |
|---|---|---|---|---|---|---|
| `Portraits/DesertTrader_Default` | `assets/{{TargetWithoutPath}}.png` | `assets/DesertTrader_Default.png` | N/A (carpeta ausente) | N/A (carpeta ausente) | Sí | Extras |
| `Portraits/OldMariner_Default` | `assets/{{TargetWithoutPath}}.png` | `assets/OldMariner_Default.png` | N/A (carpeta ausente) | N/A (carpeta ausente) | Sí | Extras |
| `Portraits/Raccoon_Default` | `assets/{{TargetWithoutPath}}.png` | `assets/Raccoon_Default.png` | N/A (carpeta ausente) | N/A (carpeta ausente) | Sí | Extras |
| `Portraits/OldMariner_GhostBlue` | `assets/{{TargetWithoutPath}}.png` | `assets/OldMariner_GhostBlue.png` | N/A (carpeta ausente) | N/A (carpeta ausente) | Sí | Extras |
| `Portraits/OldMariner_GhostGrey` | `assets/{{TargetWithoutPath}}.png` | `assets/OldMariner_GhostGrey.png` | N/A (carpeta ausente) | N/A (carpeta ausente) | Sí | Extras |
| `Portraits/DesertTrader_RacerGuy` | `assets/{{TargetWithoutPath}}.png` | `assets/DesertTrader_RacerGuy.png` | N/A (carpeta ausente) | N/A (carpeta ausente) | Sí | Extras |
| `Portraits/DesertTrader_Scholar` | `assets/{{TargetWithoutPath}}.png` | `assets/DesertTrader_Scholar.png` | N/A (carpeta ausente) | N/A (carpeta ausente) | Sí | Extras |
| `Portraits/Welwick_Default` | `assets/{{TargetWithoutPath}}.png` | `assets/Welwick_Default.png` | N/A (carpeta ausente) | N/A (carpeta ausente) | Sí | Extras |
| `Portraits/PainterLupini_Default` | `assets/{{TargetWithoutPath}}.png` | `assets/PainterLupini_Default.png` | N/A (carpeta ausente) | N/A (carpeta ausente) | Sí | Extras |
| `Portraits/Curator` | `assets/{{TargetWithoutPath}}.png` | `assets/Curator.png` | N/A (carpeta ausente) | N/A (carpeta ausente) | Sí | Extras |
| `Portraits/CSPurseDog_Default` | `assets/{{TargetWithoutPath}}.png` | `assets/CSPurseDog_Default.png` | N/A (carpeta ausente) | N/A (carpeta ausente) | Sí | Central Station |
| `Portraits/CSFlamingo_Default` | `assets/{{TargetWithoutPath}}.png` | `assets/CSFlamingo_Default.png` | N/A (carpeta ausente) | N/A (carpeta ausente) | Sí | Central Station |
| `Portraits/CSGiftShop_Default` | `assets/{{TargetWithoutPath}}.png` | `assets/CSGiftShop_Default.png` | N/A (carpeta ausente) | N/A (carpeta ausente) | Sí | Central Station |
| `Portraits/CSFoodCourt_Default` | `assets/{{TargetWithoutPath}}.png` | `assets/CSFoodCourt_Default.png` | N/A (carpeta ausente) | N/A (carpeta ausente) | Sí | Central Station |

## 4. Cobertura encontrada en TDIT Extras

- `Mods/TDIT - Portraits for Extras/` **no existe** en este workspace.
- Resultado: no se pudo auditar `manifest.json`, `content.json`, ni verificar físicamente `assets/Portraits/*.png` del pack base Extras.

## 5. Cobertura encontrada en TDIT Vendors

- `Mods/TDIT - Portraits for Vendors/` **no existe** en este workspace.
- Resultado: no se pudo auditar `manifest.json`, `content.json`, ni cobertura de vendors base.

## 6. Cobertura encontrada en Nyapu TDIT

- `Nyapu TDIT` sí incluye una cobertura amplia de retratos tipo Extras y Central Station en `assets/`.
- Incluye específicamente los casos reportados: `DesertTrader_Default.png`, `OldMariner_Default.png`, `Raccoon_Default.png`.
- `content.json` usa `FromFile: assets/{{TargetWithoutPath}}.png`, por lo que esos archivos se resuelven correctamente **si el pack cargara**.

## 7. Causa técnica

Causa primaria (confirmada):

1. **Pack inválido JSON en Nyapu TDIT**:
   - `manifest.json` tiene coma final en `Dependencies` y al final del objeto.
   - `content.json` tiene comas finales en objetos `When`, en arrays y al final del archivo.
   - Con esto, Content Patcher puede rechazar o fallar al parsear el pack.

Causas probables adicionales (pendientes por falta de carpetas base):

2. **Instalación incompleta del entorno TDIT** en este workspace (faltan carpetas Extras/Vendors).
3. **Warnings FromFile en TDIT Extras original** podrían venir de PNG ausentes en su propio `assets/Portraits` (no verificable aquí sin ese mod instalado).
4. Varias entradas deberían estar condicionadas por dependencia/config para evitar intentos de carga en contextos no aplicables (parcialmente implementado con `HasMod`, pero requiere JSON válido).

## 8. Opciones de corrección

> No aplicadas en esta tarea (solo recomendación).

1. **Opción A (recomendada):**
   - Corregir sintaxis JSON de `Nyapu TDIT` (`manifest.json` y `content.json`).
   - Instalarlo como carpeta nueva en `Mods/`.
   - Re-ejecutar SMAPI y verificar que desaparezcan warnings de los targets cubiertos.

2. **Opción B:**
   - Auditar y reparar directamente `TDIT - Portraits for Extras` (pack base), completando `assets/Portraits/*.png` faltantes.
   - Mantener Nyapu TDIT solo como override estético.

3. **Opción C:**
   - Añadir condiciones más estrictas por `HasMod`/config a patches de Extras y Central Station para no intentar `FromFile` inexistentes cuando no corresponda.

## 9. Decisión recomendada

- **Decisión recomendada:** aplicar primero **Opción A** (sanear JSON de Nyapu TDIT + instalar como pack aparte), luego ejecutar una segunda corrida SMAPI para confirmar reducción de warnings.
- Justificación: Nyapu TDIT ya trae los PNG concretos de los warnings reportados; el bloqueo actual es de validez CP/JSON, no de cobertura visual.

## 10. Próximo prompt seguro

```text
Siguiente tarea: corregir solo la validez JSON de nyapu/extracted/Nyapu-style TDIT-40531-1-0-1-1767799752/Nyapu TDIT/{manifest.json,content.json} sin cambiar targets ni assets. Luego generar un reporte de validación JSON y una propuesta de instalación en Mods/Nyapu TDIT (sin tocar lote 1 ni SVE/RSV/SCC).
```

---

### Evidencia usada

- Inspección de `Nyapu TDIT/content.json` y `manifest.json`.
- Inventario de `Nyapu TDIT/assets/*.png`.
- Verificación de inexistencia de `Mods/TDIT - Portraits for Extras` y `Mods/TDIT - Portraits for Vendors` en este workspace.
