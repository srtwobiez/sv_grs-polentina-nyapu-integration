# NYAPU_SVE_DEPENDENCY_REVIEW

## 1. Resumen ejecutivo

Tras auditar los archivos reales de ambos packs SVE Nyapu, la relación técnica es esta:

- **No hay dependencia explícita obligatoria** de `AhCuteArt.Nyapu_SeasonalCuteSVE` hacia `Nyapu.PortraitsSVE`.
- El pack Seasonal SVE Nyapu-style trae **assets propios** para non-seasonals, vendors, variantes estacionales y varios `EditData` en `Data/Characters`.
- Entre ambos packs hay **solapamiento fuerte de targets** (`Portraits/*` base de SVE y vendors SVE), por lo que si se instalan ambos, habrá overrides entre ellos según orden de aplicación.

Conclusión técnica: **no son excluyentes estrictos**, pero tampoco independientes; en práctica funcionan como **base + overlay** con solapamiento esperado. Si se instalan ambos, el comportamiento correcto es validar que el seasonal quede aplicando al final.

---

## 2. Qué dice cada manifest

### 2.1 `[CP] Nyapu'sP(SVE1.15.6)`

- `UniqueID`: `Nyapu.PortraitsSVE`.
- Dependencia obligatoria: `FlashShifter.StardewValleyExpandedCP`.
- No declara SCC SVE como dependencia.

### 2.2 `[CP] Seasonal Cute Characters SVE Nyapu-style`

- `UniqueID`: `AhCuteArt.Nyapu_SeasonalCuteSVE`.
- Dependencia obligatoria: `Poltergeister.SeasonalCuteSpritesSVE`.
- Dependencias opcionales: `Nyapu.AllPortraits` y `Nyapu.Portraits`.
- **No** declara dependencia obligatoria de `Nyapu.PortraitsSVE`.

---

## 3. Qué targets toca cada pack

### 3.1 `[CP] Nyapu'sP(SVE1.15.6)`

- `EditImage` masivo sobre `Portraits/*` de NPCs SVE (incluye variantes como `_Beach`, `_Winter`).
- `EditImage` sobre vendors SVE en `Mods/FlashShifter.StardewValleyExpandedCP/*`.
- `Include` de `assets/Misc.json`.
- No se observa `EditData` explícito en este archivo principal.

### 3.2 `[CP] Seasonal Cute Characters SVE Nyapu-style`

- `content.json` principal hace `Include` de 20+ parches por NPC.
- En esos parches hay:
  - `EditImage` a `Portraits/*` base y estacionales;
  - `EditImage` a `Characters/*` en casos puntuales;
  - `EditData` en `Data/Characters` para apariencias estacionales;
  - `EditImage` de vendors SVE (`patches/Vendors.json`);
  - `EditImage` de non-seasonals (`patches/Non-Seasonals.json`).
- Usa `When`, `FromFile`, `Priority` (en algunos parches `High`) y múltiples variantes estacionales.

---

## 4. Relación técnica entre ambos packs

Relación observada: **solapamiento parcial/alto**.

Ejemplos de targets tocados por ambos:

- `Portraits/Andy`, `Portraits/Victor`, `Portraits/Sophia`, `Portraits/Olivia`, etc.
- Vendors SVE en `Mods/FlashShifter.StardewValleyExpandedCP/*`.
- Non-seasonals tipo `Portraits/Apples`, `Portraits/Axel`, etc.

El seasonal pack no referencia archivos del pack `Nyapu.PortraitsSVE`; toma `FromFile` desde su propia carpeta `assets/`.

---

## 5. ¿Son excluyentes o complementarios?

**Dictamen:** complementarios con superposición (no excluyentes estrictos).

- No hay bloqueo técnico tipo “hard dependency” en manifest.
- Sí existe redundancia en targets base, por lo que el resultado final depende del orden de aplicación para esos recursos compartidos.

Interpretación práctica:

- Se pueden instalar ambos.
- El seasonal funciona como capa de estilo estacional/ajustes SCC SVE y potencialmente pisa parte del base pack.

---

## 6. Riesgos si se instala solo Seasonal Cute Characters SVE Nyapu-style

1. Si el autor del pack esperaba base Nyapu SVE como baseline artístico, puede haber diferencias visuales no deseadas en algunos casos límite.
2. Aunque trae vendors/non-seasonals propios, cualquier hueco de cobertura quedaría en manos del stack SCC/SVE existente.
3. Sin prueba in-game, no se puede asegurar paridad 1:1 frente al pipeline “base+seasonal”.

---

## 7. Riesgos si se instalan ambos

1. Targets duplicados en `Portraits/*` y vendors SVE; habrá overrides por orden de carga/aplicación.
2. Posibles micro-inconsistencias visuales si un target base queda con arte de un pack y su variante estacional del otro.
3. Mayor superficie de troubleshooting (dos packs tocando la misma zona).

Esto no implica incompatibilidad fatal, pero sí exige prueba controlada.

---

## 8. Decisión recomendada

Recomendación conservadora y verificable:

1. Tratar la pareja como **base + overlay esperado** en lugar de excluir automáticamente `Nyapu.PortraitsSVE`.
2. Flujo recomendado:
   - instalar `Nyapu.PortraitsSVE` (base);
   - instalar `AhCuteArt.Nyapu_SeasonalCuteSVE` (capa estacional SCC);
   - validar en juego/log qué pack gana en targets compartidos clave.
3. Si tras prueba aparece conflicto visual, mantener sólo el seasonal pack para SCC SVE.

---

## 9. Lote 1 corregido, si aplica

Sí aplica corrección de lote 1 en la parte SVE:

### Lote 1 (corregido)

1. Config interno:
   - `[NPC] Leilani` -> `Portrait Style = Nyapu`
   - `TDIT - Portraits for Vendors` -> `PStyleConfig = Nyapu`
2. CP base general:
   - `[CP] Nyapu's Portraits(1.6.9)`
3. CP SVE Nyapu (base + seasonal SCC):
   - `[CP] Nyapu'sP(SVE1.15.6)`
   - `[CP] Seasonal Cute Characters SVE Nyapu-style`
4. CP RSV seasonal Nyapu:
   - `[CP] Nyapu-Style Seasonal RSV/[CP] Seasonal Outfits`

Aún fuera del lote 1: overwrites de RSV/Clint/Goth Haley.

---

## 10. Próximo prompt recomendado

```text
Instala sólo lote 1 corregido (config-only + CP), sin overwrites.

Pasos:
1) Config interno:
   - [NPC] Leilani -> Portrait Style = Nyapu
   - TDIT - Portraits for Vendors -> PStyleConfig = Nyapu
2) Copiar sólo estos CP packs desde nyapu/extracted:
   - [CP] Nyapu's Portraits(1.6.9)
   - [CP] Nyapu'sP(SVE1.15.6)
   - [CP] Seasonal Cute Characters SVE Nyapu-style
   - [CP] Nyapu-Style Seasonal RSV/[CP] Seasonal Outfits
3) No instalar overwrites de RSV/Clint/Goth Haley.
4) No editar otros mods.
5) Generar docs/NYAPU_INSTALL_BATCH1_SVE_CHECK.md con:
   - rutas origen/destino,
   - resultado por pack,
   - revisión de posibles solapamientos SVE en log.
```

