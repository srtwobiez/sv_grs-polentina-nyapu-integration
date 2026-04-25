# NYAPU_INTEGRATION_PLAN_REVIEWED

## 1. Resumen ejecutivo

Corrección definitiva del diagnóstico: `Mods/` corresponde a un **snapshot completo de 87 carpetas** y utilizable para integrar Nyapu.  
Con este baseline, las dependencias principales para SVE/RSV/SCC/TDIT/Downhill/Clint/Leilani están presentes, por lo que el plan pasa de “bloqueado por dependencias” a “instalación por fases controladas”.

Criterio operativo mantenido:

- Primero **config interno**.
- Luego **packs CP directos**.
- Después (si hiciera falta) **overwrites manuales**.
- No instalar XNB.

---

## 2. Diferencias respecto al primer plan

1. Se elimina cualquier conclusión de snapshot mínimo/incompleto.
2. Se recalcula la viabilidad de instalación considerando dependencias presentes.
3. El primer lote seguro deja de ser vacío y pasa a ser un lote CP/config-only conservador.
4. Se conserva la regla de exclusión de estilos SVE (no mezclar rutas incompatibles).

---

## 3. Inventario real de Mods/

### 3.1 Estado general

`Mods/` contiene un snapshot completo de **87 carpetas**.

### 3.2 Dependencias clave presentes

- `ContentPatcher`
- `Stardew Valley Expanded`
- `Ridgeside Village`
- `[CP] RSV Seasonal Outfits`
- `[CP] Seasonal Cute Characters`
- `[CP] Seasonal Cute Characters SVE`
- `[CP] Clint Reforged`
- `[NPC] Leilani`
- `Downhill Project`
- `TDIT - Portraits for Extras`
- `TDIT - Portraits for Vendors`
- `Seasonal Mariner To Mermaid`
- `CustomCompanions`
- `GenericModConfigMenu`

---

## 4. Inventario real de nyapu/extracted/

Paquetes detectados:

1. `(CP) Nyapu'sP(SVE1.15.6)-11491-1-6-9-1741413631`
2. `CP Nyapu Style Downhill Project by AhCuteArt-41454-1-0-1768901509`
3. `CP Nyapu Style SVE Seasonal Slightly Cute Outfits-26601-3-2-1754390124`
4. `CP Nypau Style Seasonal Mariner to Mermaid-40375-1-1-1766083999`
5. `CP Ridgeside Village Seasonal Outfits Nyapu Style-32635-1-3-1766568883`
6. `Goth Haley Seasonal Revised-24336-1-0-7-1739608035`
7. `Goth Haley's Rooms-24336-1-0-2-r-1718034291`
8. `Nyapu Styled Clint Reforged Portraits-27587-1-0-0-1725749519`
9. `Nyapu's Goth Haley - Seasonal Portraids-40995-0-0-0-1-1767887792`
10. `Nyapu's Goth Haley-34755-0-1-0-1749588696`
11. `Nyapu's Portraits inspired by Dong(CP) 1.6.9-11491-1-6-9-1730760881`
12. `Nyapu'sP(RSV1.6)-11491-1-6-4-1720339242`
13. `Nyapu-style TDIT-40531-1-0-1-1767799752`

---

## 5. Tabla de packs clasificados

| Pack extraído | Carpeta real instalable / uso | Clase | Tipo técnico | Mod objetivo | ¿Objetivo está hoy en Mods/? | Toca | ¿Instalar ahora? |
|---|---|---|---|---|---|---|---|
| `[CP] Nyapu's Portraits(1.6.9)` | `.../[CP] Nyapu's Portraits(1.6.9)` | A | CP directo | Vanilla portraits | Sí | `Portraits/*` | Sí |
| `[CP] Nyapu'sP(SVE1.15.6)` | `.../[CP] Nyapu'sP(SVE1.15.6)` | F | CP directo | SVE | Sí | `Portraits/*` + vendors SVE | **No** si se usa SCC SVE |
| `[CP] Seasonal Cute Characters SVE Nyapu-style` | `.../[CP] Seasonal Cute Characters SVE Nyapu-style` | A | CP directo | SCC SVE | Sí | Portraits + Characters + includes | Sí |
| `[CP] Nyapu Style Downhill Project` | `.../[CP] Nyapu Style Downhill Project` | A | CP directo | Downhill Project | Sí | `Portraits`, `Characters`, `Data/Characters` | Fase 2 |
| `[CP]Seasonal Mariner to Mermaid Nyapu Style` | `.../[CP]Seasonal Mariner to Mermaid Nyapu Style` | A | CP directo | Seasonal Mariner To Mermaid | Sí | `Portraits/OldMariner_Default` | Fase 2 |
| `[CP] Nyapu-Style Seasonal RSV/[CP] Seasonal Outfits` | `.../[CP] Nyapu-Style Seasonal RSV/[CP] Seasonal Outfits` | A | CP directo | RSV Seasonal Outfits | Sí | portraits seasonals RSV | Sí |
| `[CP] Goth Haley Seasonal Revised` | `.../[CP] Goth Haley Seasonal Revised` | I | CP directo | SCC | Sí | `Portraits`, `Characters`, `Data/Characters` | Fase 2/3 temprana |
| `[CP] Goth Haley Rooms` | `.../[CP] Goth Haley Rooms` | I | CP directo | HaleyHouse/spouseRooms | Sí | `Maps/HaleyHouse`, `Maps/spouseRooms` | Fase 2/3 temprana |
| `Nyapu TDIT` | `.../Nyapu TDIT` | A | CP directo | TDIT Extras/Vendors | Sí | `Portraits/*` TDIT y CS | Fase 2 |
| `Nyapu'sP(RSV1.6)` | `.../Nyapu'sP(RSV1.6)` | B | Overwrite | RSV core folders | Sí | assets RSV + companion portrait | No |
| `Nyapu Styled Clint Reforged Portraits` | `.../[CP] Clint Reforged/assets/Portraits` | B | Overwrite | `[CP] Clint Reforged` | Sí | portraits Clint | No |
| `Nyapu's Goth Haley` | `.../Nyapu's Goth Haley` | F | Overwrite | pack Haley objetivo | Sí (objetivo manual) | portraits Haley | No |
| `Nyapu's Goth Haley - Seasonal Portraids` | `.../Nyapu's Goth Haley - Seasonal Portraids` | H | Overwrite | pack Haley seasonal objetivo | Sí (objetivo manual) | portraits/characters Haley | No |

---

## 6. Soporte interno/config-only

Queda como capa **config-only** previa a externos:

1. `[NPC] Leilani` → `Portrait Style = Nyapu`.
2. `TDIT - Portraits for Vendors` → `PStyleConfig = Nyapu`.

No instalarles pack redundante mientras esta capa interna cubra el estilo deseado.

---

## 7. Packs listos para instalar como CP

Listos (con dependencias presentes):

- `[CP] Nyapu's Portraits(1.6.9)`
- `[CP] Seasonal Cute Characters SVE Nyapu-style`
- `[CP] Nyapu-Style Seasonal RSV/[CP] Seasonal Outfits`
- `Nyapu TDIT`
- `[CP] Nyapu Style Downhill Project`
- `[CP]Seasonal Mariner to Mermaid Nyapu Style`

Con decisión previa obligatoria:

- `[CP] Nyapu'sP(SVE1.15.6)` (no mezclar con stack SCC SVE si ya se usa)
- `[CP] Goth Haley Seasonal Revised`
- `[CP] Goth Haley Rooms`

---

## 8. Packs overwrite y destino exacto

### 8.1 Nyapu'sP(RSV1.6) — overwrite

- `Mods/Ridgeside Village/[CP] Ridgeside Village/**`
- `Mods/Ridgeside Village/[CC] Ridgeside Village/Companions/FarmKiwi/portrait.png`

### 8.2 Nyapu Styled Clint Reforged Portraits — overwrite

- `Mods/[CP] Clint Reforged/assets/Portraits/**`

### 8.3 Nyapu's Goth Haley — overwrite manual

- Destino: carpeta portraits Haley del pack objetivo (`Haley.png`, `Haley_Beach.png`, `Haley_Winter.png`).

### 8.4 Nyapu's Goth Haley - Seasonal Portraids — overwrite manual (alto riesgo)

- Destino: carpeta seasonal Haley del pack objetivo (`Portraits/Haley*.png`, `Characters/Haley_*.png`).
- Incluye `.pdn` (fuente), no runtime.

---

## 9. Packs que NO deben instalarse todavía

1. Overwrites de RSV, Clint y Goth Haley.
2. `[CP] Nyapu'sP(SVE1.15.6)` si el stack activo es SCC SVE.
3. `Nyapu's Goth Haley - Seasonal Portraids` hasta validar mapping manual exacto.

---

## 10. Dependencias faltantes o dudosas

Con el snapshot completo, **no hay bloqueador general por dependencias faltantes** para la ruta CP principal.  
Punto de decisión: escoger una sola ruta SVE de estilo (SCC SVE Nyapu-style vs Nyapu SVE standalone), sin instalar ambas.

---

## 11. Riesgos técnicos

1. Conflicto visual por doble estilo SVE si se mezclan packs excluyentes.
2. Riesgo de drift si se ejecutan overwrites antes de estabilizar CP.
3. Goth Haley puede solapar assets de SCC si se cambia orden sin control.

---

## 12. Orden definitivo recomendado por fases

### Fase 1 (segura y conservadora)
1. Config interna:
   - `[NPC] Leilani` → `Portrait Style = Nyapu`
   - `TDIT - Portraits for Vendors` → `PStyleConfig = Nyapu`
2. CP base:
   - `[CP] Nyapu's Portraits(1.6.9)`
   - `[CP] Seasonal Cute Characters SVE Nyapu-style`
   - `[CP] Nyapu-Style Seasonal RSV/[CP] Seasonal Outfits`

### Fase 2 (CP complementaria)
3. `Nyapu TDIT`
4. `[CP] Nyapu Style Downhill Project`
5. `[CP]Seasonal Mariner to Mermaid Nyapu Style`
6. (Opcional) `[CP] Goth Haley Seasonal Revised` y/o `[CP] Goth Haley Rooms`

### Fase 3 (manual/overwrite)
7. `Nyapu'sP(RSV1.6)`
8. `Nyapu Styled Clint Reforged Portraits`
9. `Nyapu's Goth Haley`
10. `Nyapu's Goth Haley - Seasonal Portraids`

---

## 13. Primer lote seguro de instalación

Primer lote seguro (ya no vacío):

1. Config-only interno:
   - Leilani -> `Portrait Style = Nyapu`
   - TDIT Vendors -> `PStyleConfig = Nyapu`
2. Instalar sólo CP directos base:
   - `[CP] Nyapu's Portraits(1.6.9)`
   - `[CP] Seasonal Cute Characters SVE Nyapu-style`
   - `[CP] Nyapu-Style Seasonal RSV/[CP] Seasonal Outfits`

Este lote evita overwrites y no instala rutas excluyentes de SVE.

---

## 14. Próximo prompt recomendado para instalar solo el primer lote

```text
Instala únicamente el primer lote seguro Nyapu (config-only + CP base).

Reglas:
1) No instalar overwrites.
2) No instalar [CP] Nyapu'sP(SVE1.15.6) mientras se use SCC SVE.
3) Primero aplicar config interna:
   - [NPC] Leilani -> Portrait Style = Nyapu
   - TDIT - Portraits for Vendors -> PStyleConfig = Nyapu
4) Luego copiar sólo estos packs CP desde nyapu/extracted:
   - [CP] Nyapu's Portraits(1.6.9)
   - [CP] Seasonal Cute Characters SVE Nyapu-style
   - [CP] Nyapu-Style Seasonal RSV/[CP] Seasonal Outfits
5) No editar otros mods ni hacer overwrites.
6) Generar docs/NYAPU_INSTALL_BATCH1_REPORT.md con origen/destino y resultado por pack.
```
