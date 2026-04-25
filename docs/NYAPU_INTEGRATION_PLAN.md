# NYAPU_INTEGRATION_PLAN

## 1) Resumen ejecutivo

- **Estado real del snapshot `Mods/`:** en este repositorio no aparece un snapshot completo del stack SVVE; solo existen dos carpetas utilitarias (`ConsoleCommands` y `SaveBackup`) y ambas están en formato `*.vortex_backup` (sin manifests activos). Con este estado, **no se puede instalar ni validar integración todavía** sin traer primero el snapshot funcional completo al repo.  
- **Estado de `nyapu/`:** se detectaron **13 paquetes** (11 ZIP + 2 RAR) relacionados con Nyapu/AhCuteArt/Goth Haley/Clint/TDIT/RSV/SVE/Downhill/Mariner.  
- **Estrategia segura:** primero dejar lista la matriz de clasificación (este documento), luego aplicar por fases solo packs CP directos y recién después overwrites puntuales.  
- **Regla central mantenida:** no usar XNB, no instalar de golpe, no modificar `Mods/` en esta fase, no usar overwrite si existe alternativa CP equivalente.

---

## 2) Inventario de `Mods/` relevante

### 2.1 Hallazgos actuales en este repo

Se encontraron únicamente:

- `Mods/ConsoleCommands/manifest.json.vortex_backup`
- `Mods/ConsoleCommands/ConsoleCommands.dll.vortex_backup`
- `Mods/SaveBackup/manifest.json.vortex_backup`
- `Mods/SaveBackup/SaveBackup.dll.vortex_backup`

### 2.2 Implicación técnica

No se detectan actualmente en `Mods/` (en este repo) los mods base esperados para evaluar compatibilidad real de Nyapu:

- Seasonal Outfits / Seasonal Cute Characters
- SVE
- RSV
- Downhill
- TDIT / TDIT Extras
- Clint Reforged
- Goth Haley
- Old Mariner / Mermaid
- Leilani

Por lo tanto, esta auditoría clasifica **qué pack es apto/no apto** y cuál sería el orden recomendado, pero la instalación debe esperar a que exista snapshot completo en `Mods/`.

---

## 3) Inventario de `nyapu/`

Archivos detectados:

1. `(CP) Nyapu'sP(SVE1.15.6)-11491-1-6-9-1741413631.zip`
2. `CP Nyapu Style Downhill Project by AhCuteArt-41454-1-0-1768901509.zip`
3. `CP Nyapu Style SVE Seasonal Slightly Cute Outfits-26601-3-2-1754390124.zip`
4. `CP Nypau Style Seasonal Mariner to Mermaid-40375-1-1-1766083999.zip`
5. `CP Ridgeside Village Seasonal Outfits Nyapu Style-32635-1-3-1766568883.zip`
6. `Goth Haley Seasonal Revised-24336-1-0-7-1739608035.zip`
7. `Goth Haley's Rooms-24336-1-0-2-r-1718034291.zip`
8. `Nyapu Styled Clint Reforged Portraits-27587-1-0-0-1725749519.zip`
9. `Nyapu's Goth Haley - Seasonal Portraids-40995-0-0-0-1-1767887792.rar`
10. `Nyapu's Goth Haley-34755-0-1-0-1749588696.rar`
11. `Nyapu's Portraits inspired by Dong(CP) 1.6.9-11491-1-6-9-1730760881.zip`
12. `Nyapu'sP(RSV1.6)-11491-1-6-4-1720339242.zip`
13. `Nyapu-style TDIT-40531-1-0-1-1767799752.zip`

---

## 4) Tabla de packs Nyapu clasificados

> Códigos:  
> **A** CP independiente | **B** Overwrite | **C** XNB/no usar | **D** Duplicado | **E** Falta dependencia | **F** Decisión manual | **G** Cubierto por config interna | **H** Riesgo alto/no instalar aún

| # | Pack | Tipo detectado | Clasificación | Mod objetivo | Dependencias/condiciones | Decisión actual |
|---|---|---|---|---|---|---|
| 1 | `(CP) Nyapu'sP(SVE1.15.6)` | CP standalone | **A + E** | SVE portraits base Nyapu | Requiere SVE (1.15.6 en naming del pack) | **Candidato fase 1** cuando exista stack SVE en `Mods/` |
| 2 | `CP Nyapu Style Downhill Project by AhCuteArt` | CP standalone | **A + E** | Downhill | Requiere mod base Downhill | **Candidato fase 1/2** |
| 3 | `CP Nyapu Style SVE Seasonal Slightly Cute Outfits` | CP seasonal SVE cute | **A + E + F** | Seasonal SVE Cute stack | Requiere SVE + Seasonal SVE Outfits Slightly Cuter + pack base Nyapu SVE | **Fase 2** (después del pack #1) |
| 4 | `CP Nypau Style Seasonal Mariner to Mermaid` | CP standalone | **A + E + F + H** | Mariner/Mermaid | Requiere Seasonal Mariner to Mermaid + Old Mariner pendant-back + TDIT Extras | **Posponer** hasta resolver conflicto Old Mariner/TDIT |
| 5 | `CP Ridgeside Village Seasonal Outfits Nyapu Style` | CP pack para RSV seasonal | **A + E + F** | RSV seasonal outfits | Requiere RSV + Seasonal Outfits for RSV + Custom Companions actualizado | **Fase 2** (no antes) |
| 6 | `Goth Haley Seasonal Revised` | CP standalone | **A + E + F** | Haley seasonal | Requiere Seasonal Cute Characters; revisar convivencia con SCC Nyapu | **Fase 3** (tras estabilizar SCC Nyapu) |
| 7 | `Goth Haley's Rooms` | CP standalone | **A** | Haley rooms/map edits | Sin dependencia dura aparte de CP (compatibilidad con recolor/SVE declarada) | **Opcional fase 3** |
| 8 | `Nyapu Styled Clint Reforged Portraits` | Estructura overwrite de `[CP] Clint Reforged/assets/...` | **B + E + F** | Clint Reforged | Requiere Clint Reforged instalado; mantener Clint Reforged como dueño visual | **Fase separada overwrite** |
| 9 | `Nyapu's Goth Haley - Seasonal Portraids` (RAR) | Archivo RAR no inspeccionado localmente | **F + H** | Probable SCC Nyapu/Haley seasonal | Sin inspección interna (falta herramienta RAR en entorno) | **No instalar aún** |
| 10 | `Nyapu's Goth Haley` (RAR) | Archivo RAR no inspeccionado localmente | **F + H** | Probable overwrite de Nyapu base | Sin inspección interna (falta herramienta RAR en entorno) | **No instalar aún** |
| 11 | `Nyapu's Portraits inspired by Dong (CP) 1.6.9` | CP vanilla base | **A + F** | Vanilla portraits | Base Nyapu vanilla; puede solaparse con SCC Nyapu si se aplican ambos targets directos | **Elegir estrategia principal antes de instalar** |
| 12 | `Nyapu'sP(RSV1.6)` | Overwrite directo sobre estructura interna de RSV | **B + E + D** | RSV base | Requiere copiar dentro de `Ridgeside Village` existente; excluyente con opción CP seasonal RSV | **No priorizar** (preferir CP #5) |
| 13 | `Nyapu-style TDIT` | CP standalone (con sintaxis JSON tipo JSON5 y trailing commas) | **A + E + F + H** | TDIT Extras/Central Station/Extras portraits | Requiere mods concretos (`DolphINaF.ExtraPortraits`, etc.); validar `FromFile` exhaustivo antes de usar | **Auditoría técnica previa obligatoria** |

### Observaciones de duplicados/incompatibilidades importantes

- **RSV duplicado funcional:** #5 (CP RSV seasonal Nyapu) y #12 (overwrite RSV) apuntan al mismo dominio visual de RSV; no instalar ambos. Recomendado: **#5**.  
- **SVE estilos excluyentes:** usar solo la ruta Seasonal Cute SVE Nyapu (packs #1 + #3) y descartar vanilla-style SVE si apareciera en otra fuente.  
- **Goth Haley variantes:** #6 + #7 son CP limpios; #9 y #10 parecen overlays/overwrites específicos y quedan para fase manual posterior.

---

## 5) Mods con soporte Nyapu interno

Estos casos deben resolverse por **configuración interna** si están instalados, no con pack externo redundante:

1. **Leilani** → activar opción Nyapu en `config.json` del propio mod (si existe en su ConfigSchema).  
2. **They Deserve It Too - Portraits for Vendors** → activar opción Nyapu interna (si está presente).  

Estado actual: no se pudieron verificar en `Mods/` porque ese snapshot no está presente en este repo.

---

## 6) Orden recomendado de instalación (por fases)

### Fase 0 — Preparación (sin instalar packs Nyapu)

1. Confirmar snapshot completo de `Mods/` dentro de este repo (no Steam).  
2. Verificar versiones base instaladas: CP, SVE, SCC, RSV, Custom Companions, Downhill, TDIT Extras, Clint Reforged, Old Mariner/Mermaid.  
3. Activar primero soportes internos Nyapu (Leilani/TDIT-Vendors) si existen.

### Fase 1 — CP directos de menor riesgo

1. `Nyapu's Portraits inspired by Dong (CP) 1.6.9` **o** estrategia SCC Nyapu principal (definir una sola ruta dominante de vanilla).  
2. `(CP) Nyapu'sP(SVE1.15.6)` (si SVE está en versión compatible).  
3. `CP Nyapu Style Downhill Project` (si Downhill presente).

### Fase 2 — CP seasonal dependientes

1. `CP Nyapu Style SVE Seasonal Slightly Cute Outfits` (después de #1 SVE base Nyapu).  
2. `CP Ridgeside Village Seasonal Outfits Nyapu Style` (si RSV + Seasonal RSV + Custom Companions OK).  
3. `Nyapu-style TDIT` solo tras validación completa de JSON/`FromFile`.

### Fase 3 — Capas opcionales y sensibles

1. `Goth Haley Seasonal Revised` y `Goth Haley's Rooms` (ajustando prioridad con SCC).  
2. Mariner/Mermaid Nyapu CP solo si no genera conflicto con Old Mariner/TDIT.

### Fase 4 — Overwrites (último paso)

1. `Nyapu Styled Clint Reforged Portraits` (si se decide overwrite manual).  
2. Evitar `Nyapu'sP(RSV1.6)` si ya se usa la ruta CP seasonal RSV.

---

## 7) Packs que NO deben instalarse

1. **Cualquier XNB** (regla global). En el material actual no se detectaron `.xnb`, pero si aparece una variante XNB externa debe descartarse.  
2. **`Nyapu'sP(RSV1.6)`** si se adopta CP RSV seasonal (#5), por duplicación/conflicto de ownership de portraits RSV.  
3. **Cualquier pack SVE vanilla-style** si la base del stack es Seasonal Cute SVE (ruta cute).

---

## 8) Packs CP directos a instalar primero

Prioridad recomendada inicial (cuando `Mods/` esté completo):

1. `(CP) Nyapu'sP(SVE1.15.6)`
2. `CP Nyapu Style SVE Seasonal Slightly Cute Outfits` (solo tras 1)
3. `CP Nyapu Style Downhill Project`
4. `CP Ridgeside Village Seasonal Outfits Nyapu Style` (solo con dependencias completas)

Notas:
- `Nyapu's Portraits inspired by Dong (CP)` entra antes si se decide cubrir vanilla por esa vía base.  
- `Nyapu-style TDIT` no entra en lote inicial sin validación técnica extra.

---

## 9) Packs overwrite que requieren fase separada

1. `Nyapu Styled Clint Reforged Portraits` → overwrite directo de assets dentro de `[CP] Clint Reforged`.  
2. `Nyapu'sP(RSV1.6)` → overwrite directo sobre estructura interna de RSV.  
3. `Nyapu's Goth Haley` (RAR) y `Nyapu's Goth Haley - Seasonal Portraids` (RAR) → probable lógica de copia/overwrite, pendiente de inspección.

Regla de aplicación: solo después de estabilizar CPs y con backup de target mod.

---

## 10) Riesgos detectados

1. **Snapshot `Mods/` incompleto en repo**: riesgo bloqueante principal para cualquier integración.  
2. **Archivos RAR no inspeccionables en este entorno**: no se pudo abrir internamente; riesgo de instrucciones overwrite no documentadas.  
3. **Packs con JSON estilo JSON5/trailing commas**: potencial de error si alguna versión de SMAPI/CP no tolera sintaxis concreta del pack.  
4. **Conflicto ownership Clint**: SCC no debe pisar Clint si Clint Reforged está activo.  
5. **Conflicto Old Mariner/Mermaid/TDIT**: integrar solo tras prueba controlada sin warnings.  
6. **Duplicación RSV**: elegir CP seasonal **o** overwrite RSV, no ambos.

---

## 11) Primer lote recomendado de instalación (seguro)

> **Lote propuesto cuando exista snapshot completo en `Mods/`:**

1. Activar soporte Nyapu por config en mods con soporte interno (Leilani/TDIT Vendors), si existen.  
2. Instalar `(CP) Nyapu'sP(SVE1.15.6)`.  
3. Instalar `CP Nyapu Style SVE Seasonal Slightly Cute Outfits`.  
4. Instalar `CP Nyapu Style Downhill Project`.  
5. **No tocar aún**: overwrites de Clint/RSV, RAR de Goth Haley, Mariner/Mermaid, TDIT Nyapu.

Este lote minimiza escritura destructiva y respeta la política “CP primero, overwrite al final”.

---

## 12) Próximo prompt recomendado

```
Fase 2: con el snapshot completo ya copiado en Mods/, valida dependencias reales y prepara un plan de instalación ejecutable.

Tareas:
1) Audita Mods/ y confirma presencia/versión de: Content Patcher, SVE, Seasonal SVE Outfits Slightly Cuter, Seasonal Cute Characters, RSV, Seasonal Outfits for RSV, Custom Companions, Downhill, TDIT Extras, Clint Reforged, Old Mariner/Mermaid, Leilani, TDIT Vendors.
2) Propón matriz final “instalar / no instalar / posponer” para cada archivo de nyapu/.
3) Genera tabla de conflictos por NPC (Clint, Haley, Old Mariner, Mermaid, RSV NPCs, SVE NPCs).
4) Entrega comandos y orden exacto de copias (sin ejecutar aún).
5) No modificar Mods/ hasta aprobación explícita.
```

