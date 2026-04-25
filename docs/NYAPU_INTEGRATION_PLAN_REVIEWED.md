# NYAPU_INTEGRATION_PLAN_REVIEWED

## 1. Resumen ejecutivo

Se reauditó directamente `nyapu/extracted/` inspeccionando estructura real, `manifest.json`, `content.json`, assets y rutas internas, **sin usar como verdad** la validación previa de PowerShell.  
Resultado principal: los paquetes Nyapu están mayormente en formato Content Patcher (con sintaxis permisiva tipo comentarios/trailing commas en varios JSON), y también hay paquetes tipo overwrite puro.  

Hallazgo crítico del snapshot actual: `Mods/` sólo contiene `ConsoleCommands` y `SaveBackup`; no están presentes SVE/RSV/SCC/TDIT/Downhill/Clint Reforged/Leilani, por lo que casi todos los packs quedan en estado “dependencia faltante” o “fase posterior”.

---

## 2. Diferencias respecto al primer plan

1. Se descarta explícitamente el diagnóstico anterior “JSON inválido” como criterio de rotura. Muchos `content.json`/`manifest.json` incluyen comentarios o comas finales que son comunes en packs CP.
2. Se verificó existencia real de `FromFile` en los packs CP auditados; no se detectaron rutas rotas en la revisión de archivos.
3. Se separó estrictamente:
   - CP instalable como carpeta nueva;
   - overwrite sobre mod existente;
   - casos manuales/dudosos.
4. Con el estado real de `Mods/` actual, no existe aún un lote de integración funcional de Nyapu para SVE/RSV/TDIT/Downhill.

---

## 3. Inventario real de Mods/

Inventario actual en `Mods/`:

- `ConsoleCommands`
- `SaveBackup`

Estado frente al inventario esperado (SVE, SCC, RSV, Downhill, Clint Reforged, TDIT Vendors/Extras, Leilani, etc.): **ausentes en este snapshot**.

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

| Pack extraído | Carpeta real instalable / uso | Clase | Tipo técnico | Mod objetivo | ¿Objetivo está hoy en `Mods/`? | Toca | Dependencias / notas | ¿Instalar ahora? |
|---|---|---|---|---|---|---|---|---|
| `[CP] Nyapu's Portraits(1.6.9)` | `Nyapu's Portraits inspired by Dong(CP).../[CP] Nyapu's Portraits(1.6.9)` | A | CP directo | Vanilla portraits | Parcial (falta CP en snapshot) | `Portraits/*` | Base Nyapu general | No (snapshot incompleto) |
| `[CP] Nyapu'sP(SVE1.15.6)` | `(CP) Nyapu'sP(SVE...)/[CP] Nyapu'sP(SVE1.15.6)` | E | CP directo | SVE | No | `Portraits/*`, `Mods/FlashShifter...` vendors | Requiere `FlashShifter.StardewValleyExpandedCP` | No |
| `[CP] Seasonal Cute Characters SVE Nyapu-style` | `CP Nyapu Style SVE Seasonal.../[CP] Seasonal Cute Characters SVE Nyapu-style` | E | CP directo | SCC SVE | No | Portraits + Characters via includes | Requiere `Poltergeister.SeasonalCuteSpritesSVE`; opcional Nyapu base | No |
| `[CP] Nyapu Style Downhill Project` | `CP Nyapu Style Downhill.../[CP] Nyapu Style Downhill Project` | E | CP directo | Downhill Project | No | `Portraits`, `Characters`, `Data/Characters` | Requiere `DH.Kiyuga.Characters` | No |
| `[CP]Seasonal Mariner to Mermaid Nyapu Style` | `CP Nypau Style Seasonal Mariner.../[CP]Seasonal Mariner to Mermaid Nyapu Style` | E | CP directo | Seasonal Mariner to Mermaid | No | `Portraits/OldMariner_Default` | Requiere `jennajuffuffles.marinertomermaid` | No |
| `[CP] Nyapu-Style Seasonal RSV/[CP] Seasonal Outfits` | `CP Ridgeside Village Seasonal Outfits.../[CP] Nyapu-Style Seasonal RSV/[CP] Seasonal Outfits` | E | CP directo | RSV Seasonal Outfits | No | Includes de portraits/seasonals | Requiere `Rafseazz.RSVSeasonalOutfits` y `PeacefulEnd.CustomCompanions` | No |
| `[CP] Goth Haley Seasonal Revised` | `Goth Haley Seasonal Revised.../[CP] Goth Haley Seasonal Revised` | E | CP directo | SCC (Haley) | No | `Portraits`, `Characters`, `Data/Characters/Appearance` | Requiere `Poltergeister.SeasonalCuteCharacters` | No |
| `[CP] Goth Haley Rooms` | `Goth Haley's Rooms.../[CP] Goth Haley Rooms` | A | CP directo | Mapa HaleyHouse/spouseRooms | Sí (independiente de SVE; con token si SVE existe) | `Maps/HaleyHouse`, `Maps/spouseRooms` | Opcional interacción con SVE, no dependencia requerida | **Condicional** (solo cuando stack base esté restaurado) |
| `Nyapu TDIT` | `Nyapu-style TDIT.../Nyapu TDIT` | E | CP directo | TDIT Extras + CS Portraits | No | `Portraits/*` (extras y prefijos `CS*`) | Dependencias opcionales: `DolphINaF.ExtraPortraits`, `DolphINaF.CSPortraits` | No |
| `Nyapu'sP(RSV1.6)` | `Nyapu'sP(RSV1.6)...` (contenido para copiar dentro de mod RSV existente) | B | Overwrite | `Ridgeside Village/[CP] Ridgeside Village` y `[CC] Ridgeside Village` | No | Assets portraits / companions | Overwrite puro, sin manifest propio | No |
| `Nyapu Styled Clint Reforged Portraits` | `Nyapu Styled Clint Reforged.../[CP] Clint Reforged/assets/Portraits` | B | Overwrite | `[CP] Clint Reforged` | No | Portraits Clint | Overwrite puro; evitar si aparece alternativa CP | No |
| `Nyapu's Goth Haley` | `Nyapu's Goth Haley.../Nyapu's Goth Haley` | F | Overwrite | Pack base de Haley Nyapu/seasonal SDV style (manual) | No claro | Portraits Haley (`Haley.png`, `Haley_Beach.png`, `Haley_Winter.png`) | Falta mapping exacto de destino en este snapshot | No |
| `Nyapu's Goth Haley - Seasonal Portraids` | `Nyapu's Goth Haley - Seasonal Portraids.../Nyapu's Goth Haley - Seasonal Portraids` | H | Overwrite | Probable pack seasonal Haley/SDV Nyapu | No claro | `Portraits` y `Characters` estacionales | Incluye `.pdn`, sin manifest; alto riesgo de overwrite incorrecto | No |

---

## 6. Soporte interno/config-only

Esperado por diseño del stack (pero no verificable en este snapshot porque faltan mods):

1. `[NPC] Leilani` → activar `Portrait Style = Nyapu` (si existe en su `config.json`).
2. `TDIT - Portraits for Vendors` → activar `PStyleConfig = Nyapu` (si existe en su config).

Conclusión: **no instalar pack externo redundante** para estos dos casos; resolver por config cuando reaparezcan los mods base.

---

## 7. Packs listos para instalar como CP

Con estructura CP válida y carpeta instalable identificada:

- `[CP] Nyapu's Portraits(1.6.9)`
- `[CP] Nyapu'sP(SVE1.15.6)`
- `[CP] Seasonal Cute Characters SVE Nyapu-style`
- `[CP] Nyapu Style Downhill Project`
- `[CP]Seasonal Mariner to Mermaid Nyapu Style`
- `[CP] Nyapu-Style Seasonal RSV/[CP] Seasonal Outfits`
- `[CP] Goth Haley Seasonal Revised`
- `[CP] Goth Haley Rooms`
- `Nyapu TDIT`

**Pero** en el snapshot actual casi todos están bloqueados por dependencias ausentes en `Mods/`.

---

## 8. Packs overwrite y destino exacto

### 8.1 Nyapu'sP(RSV1.6) — overwrite

Destino esperado (cuando exista el mod base):

- `Mods/Ridgeside Village/[CP] Ridgeside Village/**` (principalmente `Assets/Portraits`, `Assets/BeachPortraits`, `Assets/WinterOutfits/Portraits`, etc.)
- `Mods/Ridgeside Village/[CC] Ridgeside Village/Companions/FarmKiwi/portrait.png`

### 8.2 Nyapu Styled Clint Reforged Portraits — overwrite

Destino esperado:

- `Mods/[CP] Clint Reforged/assets/Portraits/**`

### 8.3 Nyapu's Goth Haley — overwrite

Destino probable (requiere decisión manual y mapping contra mod real instalado):

- carpeta de portraits de Haley del pack objetivo (no presente ahora), para archivos:
  - `Haley.png`
  - `Haley_Beach.png`
  - `Haley_Winter.png`

### 8.4 Nyapu's Goth Haley - Seasonal Portraids — overwrite

Destino probable:

- carpeta seasonal de Haley del pack objetivo (no presente ahora), para:
  - `Portraits/Haley*.png`
  - `Characters/Haley_*.png`

Riesgo adicional: trae `Portraits/Haley_Winter_Indoor.pdn` (fuente de edición), no utilizable en runtime.

---

## 9. Packs que NO deben instalarse todavía

1. Todos los que dependen de mods ausentes en snapshot actual (`SVE`, `RSV`, `SCC`, `Downhill`, `TDIT`, `Clint Reforged`, `Seasonal Mariner`).
2. Overwrites puros (`Nyapu'sP(RSV1.6)`, `Nyapu Styled Clint Reforged Portraits`, `Nyapu's Goth Haley`, `Nyapu's Goth Haley - Seasonal Portraids`) hasta restaurar objetivos exactos y versiones.
3. `Nyapu's Goth Haley - Seasonal Portraids` en particular: alto riesgo por no tener manifest/content y requerir mapeo manual fino.

---

## 10. Dependencias faltantes o dudosas

Dependencias explícitas observadas en manifests:

- `FlashShifter.StardewValleyExpandedCP`
- `Poltergeister.SeasonalCuteSpritesSVE`
- `Rafseazz.RSVSeasonalOutfits`
- `PeacefulEnd.CustomCompanions`
- `Poltergeister.SeasonalCuteCharacters`
- `DH.Kiyuga.Characters`
- `jennajuffuffles.marinertomermaid`
- Opcionales para TDIT: `DolphINaF.ExtraPortraits`, `DolphINaF.CSPortraits`

Todas faltan en el `Mods/` auditado actualmente.

---

## 11. Riesgos técnicos

1. **Snapshot incompleto de `Mods/`**: principal bloqueador.
2. **Conflicto de estilos SVE**: no mezclar `Nyapu'sP(SVE1.15.6)` con variantes SCC SVE si son excluyentes en el stack final.
3. **Regla de no-overwrite si hay alternativa CP**: priorizar packs CP siempre que exista equivalente.
4. **Goth Haley overwrite**: alto riesgo de sobrescribir assets equivocados si no se alinea con el mod exacto objetivo.
5. **Nyapu TDIT**: técnicamente usable como CP, pero depende de que existan los IDs/portraits de TDIT Extras/CS para que no queden parches inactivos.

---

## 12. Orden definitivo recomendado por fases

### Fase 0 (bloqueante)
Restaurar el snapshot real del modpack base en `Mods/` (SVE/RSV/SCC/TDIT/etc.).

### Fase 1 (base Nyapu segura, CP)
1. `[CP] Nyapu's Portraits(1.6.9)`
2. `[CP] Goth Haley Rooms` (si se desea el cambio de mapa)

### Fase 2 (CP por dependencia)
3. `[CP] Nyapu'sP(SVE1.15.6)` **o** ruta SCC SVE (según stack final, sin duplicar estilo excluyente)
4. `[CP] Seasonal Cute Characters SVE Nyapu-style` (si el stack usa SCC SVE)
5. `[CP] Nyapu-Style Seasonal RSV/[CP] Seasonal Outfits`
6. `[CP] Nyapu Style Downhill Project`
7. `[CP]Seasonal Mariner to Mermaid Nyapu Style`
8. `Nyapu TDIT`
9. `[CP] Goth Haley Seasonal Revised` (si SCC presente y sin desactivar Haley en SCC)

### Fase 3 (solo manual/overwrite, posterior)
10. `Nyapu'sP(RSV1.6)` (si no se usa alternativa CP equivalente)
11. `Nyapu Styled Clint Reforged Portraits`
12. `Nyapu's Goth Haley`
13. `Nyapu's Goth Haley - Seasonal Portraids`

---

## 13. Primer lote seguro de instalación

Dado el estado actual de `Mods/` (sin dependencias base), el **primer lote seguro efectivo es vacío**:

- **Lote 1 recomendado ahora:** no instalar ningún pack todavía.
- Acción previa obligatoria: restaurar snapshot funcional de mods base.

Cuando el snapshot base esté restaurado, el primer lote CP recomendado sería:

1. `[CP] Nyapu's Portraits(1.6.9)`
2. `[CP] Goth Haley Rooms` (opcional)

---

## 14. Próximo prompt recomendado para instalar solo el primer lote

```text
Instala únicamente el primer lote CP seguro y no hagas overwrites manuales.

Reglas:
1) No tocar packs overwrite.
2) No editar configs aún.
3) Copiar solo:
   - [CP] Nyapu's Portraits(1.6.9)
   - [CP] Goth Haley Rooms (si existe en Mods/ el stack base y se mantiene como opcional)
4) Validar que cada carpeta copiada tenga manifest.json y content.json.
5) No modificar ni borrar ningún otro mod.
6) Generar reporte docs/NYAPU_INSTALL_BATCH1_REPORT.md con:
   - rutas origen/destino,
   - fecha,
   - resultado por pack,
   - pendientes para fase 2.
```

