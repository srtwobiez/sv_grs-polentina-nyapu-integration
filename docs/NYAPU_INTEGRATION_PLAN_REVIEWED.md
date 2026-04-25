# NYAPU_INTEGRATION_PLAN_REVIEWED

## 1. Resumen ejecutivo

Se corrige el diagnóstico previo: el snapshot de `Mods/` del entorno objetivo del usuario **sí es completo y utilizable** (87 carpetas), con coincidencia entre instalación activa y backup.  
La reauditoría mantiene el enfoque técnico: inspección real de packs en `nyapu/extracted/`, priorización de Content Patcher, y separación estricta de overwrites para fases posteriores.

---

## 2. Diferencias respecto al primer plan

1. Se elimina la conclusión anterior de “snapshot mínimo/incompleto”.
2. Se adopta como base de trabajo la verificación local del usuario (87 carpetas en `Mods/` y backup espejo).
3. Se actualiza el orden por fases: ya no bloqueado por falta general de dependencias.
4. Se mantiene la política: **CP primero**, **config interno antes de packs externos**, **overwrites después**, **sin XNB**.

---

## 3. Inventario real de Mods/

### 3.1 Corrección del diagnóstico

Diagnóstico corregido: `Mods/` en el entorno real del usuario está completo (87 carpetas), no mínimo.

### 3.2 Dependencias clave confirmadas

Dependencias/mods clave reportadas como presentes:

- `ContentPatcher`
- `Stardew Valley Expanded`
- `Ridgeside Village`
- `[CP] RSV Seasonal Outfits`
- `[CP] Seasonal Cute Characters`
- `[CP] Seasonal Cute Characters SVE`
- `[CP] Clint Reforged`
- `[NPC] Leilani`
- `Downhill Project`
- `TDIT - Portraits for Vendors`
- `TDIT - Portraits for Extras`
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

| Pack extraído | Carpeta real instalable / uso | Clase | Tipo | Mod objetivo | Estado con snapshot completo | Toca | ¿Instalar en fase temprana? |
|---|---|---|---|---|---|---|---|
| `[CP] Nyapu's Portraits(1.6.9)` | `.../[CP] Nyapu's Portraits(1.6.9)` | A | CP directo | Vanilla portraits | Compatible | `Portraits/*` | Sí |
| `[CP] Nyapu'sP(SVE1.15.6)` | `.../[CP] Nyapu'sP(SVE1.15.6)` | F | CP directo | SVE | Dependencia presente, **pero excluyente con estilo SCC SVE** | `Portraits/*`, vendors SVE | No (si stack usa SCC SVE) |
| `[CP] Seasonal Cute Characters SVE Nyapu-style` | `.../[CP] Seasonal Cute Characters SVE Nyapu-style` | A | CP directo | SCC SVE | Compatible | Portraits + Characters (includes) | Sí |
| `[CP] Nyapu Style Downhill Project` | `.../[CP] Nyapu Style Downhill Project` | A | CP directo | Downhill Project | Compatible | `Portraits`, `Characters`, `Data/Characters` | Sí (fase 2) |
| `[CP]Seasonal Mariner to Mermaid Nyapu Style` | `.../[CP]Seasonal Mariner to Mermaid Nyapu Style` | A | CP directo | Seasonal Mariner To Mermaid | Compatible | `Portraits/OldMariner_Default` | Sí (fase 2) |
| `[CP] Nyapu-Style Seasonal RSV/[CP] Seasonal Outfits` | `.../[CP] Nyapu-Style Seasonal RSV/[CP] Seasonal Outfits` | A | CP directo | RSV Seasonal Outfits | Compatible | Includes de portraits seasonals RSV | Sí |
| `[CP] Goth Haley Seasonal Revised` | `.../[CP] Goth Haley Seasonal Revised` | I | CP directo | SCC | Compatible, pero sensible a orden/estilo Haley | `Portraits`, `Characters`, `Data/Characters` | Después del lote base |
| `[CP] Goth Haley Rooms` | `.../[CP] Goth Haley Rooms` | I | CP directo | HaleyHouse/spouseRooms | Compatible | `Maps/HaleyHouse`, `Maps/spouseRooms` | Después del lote base |
| `Nyapu TDIT` | `.../Nyapu TDIT` | A | CP directo | TDIT Extras + Vendors/CS | Compatible con dependencias presentes | `Portraits/*` TDIT/CS | Sí (fase 2) |
| `Nyapu'sP(RSV1.6)` | `.../Nyapu'sP(RSV1.6)` | B | Overwrite | RSV core folders | Requiere copiar sobre mod existente | Portraits/companions | No (fase overwrite) |
| `Nyapu Styled Clint Reforged Portraits` | `.../[CP] Clint Reforged/assets/Portraits` | B | Overwrite | `[CP] Clint Reforged` | Requiere overwrite | Portraits Clint | No (fase overwrite) |
| `Nyapu's Goth Haley` | `.../Nyapu's Goth Haley` | F | Overwrite | Pack Haley objetivo | Compatible potencial, destino manual | Portraits Haley | No |
| `Nyapu's Goth Haley - Seasonal Portraids` | `.../Nyapu's Goth Haley - Seasonal Portraids` | H | Overwrite | Pack Haley seasonal objetivo | Riesgo alto (sin manifest/content; incluye `.pdn`) | Portraits/Characters | No |

---

## 6. Soporte interno/config-only

Antes de instalar packs externos, aplicar primero la capa interna por configuración:

1. `[NPC] Leilani`: usar `Portrait Style = Nyapu` (si el campo existe en su config).
2. `TDIT - Portraits for Vendors`: usar `PStyleConfig = Nyapu` (si el campo existe en su config).

Regla: si esta capa ya resuelve el estilo Nyapu, evitar packs redundantes para el mismo objetivo.

---

## 7. Packs listos para instalar como CP

Packs CP con carpeta clara y uso recomendado (sin overwrite):

- `[CP] Nyapu's Portraits(1.6.9)`
- `[CP] Seasonal Cute Characters SVE Nyapu-style`
- `[CP] Nyapu-Style Seasonal RSV/[CP] Seasonal Outfits`
- `Nyapu TDIT`
- `[CP] Nyapu Style Downhill Project`
- `[CP]Seasonal Mariner to Mermaid Nyapu Style`

Packs CP que requieren decisión manual previa de estilo/alcance:

- `[CP] Nyapu'sP(SVE1.15.6)` (excluyente con stack SCC SVE)
- `[CP] Goth Haley Seasonal Revised`
- `[CP] Goth Haley Rooms`

---

## 8. Packs overwrite y destino exacto

### 8.1 Nyapu'sP(RSV1.6)

Destino overwrite:

- `Mods/Ridgeside Village/[CP] Ridgeside Village/**`
- `Mods/Ridgeside Village/[CC] Ridgeside Village/Companions/FarmKiwi/portrait.png`

### 8.2 Nyapu Styled Clint Reforged Portraits

Destino overwrite:

- `Mods/[CP] Clint Reforged/assets/Portraits/**`

### 8.3 Nyapu's Goth Haley

Destino manual probable:

- carpeta de portraits Haley del mod objetivo (`Haley.png`, `Haley_Beach.png`, `Haley_Winter.png`).

### 8.4 Nyapu's Goth Haley - Seasonal Portraids

Destino manual probable:

- carpeta seasonal Haley del mod objetivo (`Portraits/Haley*.png`, `Characters/Haley_*.png`).

Riesgo: contiene `.pdn` (asset fuente), no runtime.

---

## 9. Packs que NO deben instalarse todavía

1. Todos los overwrites (RSV/Clint/Haley) hasta completar fase CP estable.
2. `Nyapu's Goth Haley - Seasonal Portraids` por riesgo alto y ausencia de estructura CP.
3. `[CP] Nyapu'sP(SVE1.15.6)` si el stack activo ya es SCC SVE (evitar doble estilo SVE).

---

## 10. Dependencias faltantes o dudosas

Con la verificación del usuario, las dependencias clave requeridas por los packs auditados están presentes en el snapshot objetivo.  
Punto aún “dudoso” no por ausencia sino por estrategia: elegir **una sola** ruta de estilo SVE (SVE vanilla-style Nyapu vs SCC SVE Nyapu-style).

---

## 11. Riesgos técnicos

1. Conflicto de estilo si se instalan a la vez packs SVE excluyentes.
2. Riesgo de drift si se aplican overwrites antes de cerrar fase CP.
3. Goth Haley puede solapar assets de SCC; requiere orden y validación visual.
4. TDIT debe respetar primero config interno (`PStyleConfig`) y luego CP externo sólo si hace falta cobertura adicional.

---

## 12. Orden definitivo recomendado por fases

### Fase 1 — Config interno + base CP
1. Config `[NPC] Leilani` (Nyapu) y `TDIT Vendors` (Nyapu).
2. `[CP] Nyapu's Portraits(1.6.9)`.
3. `[CP] Seasonal Cute Characters SVE Nyapu-style`.
4. `[CP] Nyapu-Style Seasonal RSV/[CP] Seasonal Outfits`.

### Fase 2 — CP complementarios
5. `Nyapu TDIT`.
6. `[CP] Nyapu Style Downhill Project`.
7. `[CP]Seasonal Mariner to Mermaid Nyapu Style`.
8. (Opcional) `[CP] Goth Haley Seasonal Revised` y/o `[CP] Goth Haley Rooms`.

### Fase 3 — Overwrites manuales (solo si siguen siendo necesarios)
9. `Nyapu'sP(RSV1.6)`.
10. `Nyapu Styled Clint Reforged Portraits`.
11. `Nyapu's Goth Haley`.
12. `Nyapu's Goth Haley - Seasonal Portraids`.

---

## 13. Primer lote seguro de instalación

Primer lote seguro actualizado (ya con dependencias presentes):

1. **(Config interno)** activar Nyapu en Leilani y TDIT Vendors.
2. Instalar solo estos packs CP:
   - `[CP] Nyapu's Portraits(1.6.9)`
   - `[CP] Seasonal Cute Characters SVE Nyapu-style`
   - `[CP] Nyapu-Style Seasonal RSV/[CP] Seasonal Outfits`

Justificación: cubre base visual principal (vanilla + SVE SCC + RSV seasonal) sin entrar todavía en overwrites ni en complementos más sensibles.

---

## 14. Próximo prompt recomendado para instalar solo el primer lote

```text
Instala únicamente el primer lote seguro Nyapu.

Reglas:
1) No instalar overwrites.
2) No instalar el pack [CP] Nyapu'sP(SVE1.15.6) (porque el stack usa SCC SVE).
3) Primero configura estilo interno Nyapu en:
   - [NPC] Leilani
   - TDIT - Portraits for Vendors
4) Luego copiar solo estos CP packs desde nyapu/extracted:
   - [CP] Nyapu's Portraits(1.6.9)
   - [CP] Seasonal Cute Characters SVE Nyapu-style
   - [CP] Nyapu-Style Seasonal RSV/[CP] Seasonal Outfits
5) No editar otros mods.
6) Generar docs/NYAPU_INSTALL_BATCH1_REPORT.md con origen/destino, resultado por pack y pendientes de fase 2.
```

