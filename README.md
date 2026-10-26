# hermes-starter

**Skill pack y configuración recomendada para [Hermes Agent](https://github.com/NousResearch/hermes-agent)**

Instala una vez en cualquier máquina nueva y tu agente queda productivo de inmediato — con las skills correctas, CLAUDE.md optimizado y estructura lista para trabajar.

## Instalación rápida

```bash
curl -fsSL https://raw.githubusercontent.com/srmario123/hermes-starter/main/install.sh | bash
```

Luego reinicia el gateway:
```bash
hermes gateway restart
```

## Qué incluye

### Skills

| Skill | Para qué sirve |
|---|---|
| `karpathy-coding-guidelines` | 4 principios anti-errores al programar (Karpathy) |
| `systematic-debugging` | Metodología de 4 fases para encontrar la causa raíz |
| `test-driven-development` | TDD: RED → GREEN → REFACTOR |
| `spike` | Experimentos rápidos para validar ideas antes de construir |
| `simplify-code` | Limpieza de código con 4 agentes paralelos |
| `requesting-code-review` | Pre-commit: security scan + quality gates |
| `security-audit` | Auditoría de seguridad white-box del código fuente |
| `github` | PRs, issues, reviews y repos vía `gh` CLI |
| `codebase-inspection` | Análisis de bases de código (LOC, lenguajes, ratios) |

### CLAUDE.md

Comportamiento optimizado para Claude Code:
- Responde en español por defecto
- Lee antes de modificar
- Verifica antes de reportar éxito
- Confirma el plan antes de ejecutar
- Principios de Karpathy integrados

### config/hermes-recommended.yaml

Plantilla comentada con la estructura recomendada de `~/.hermes/config.yaml`.

## Instalación manual

```bash
git clone https://github.com/srmario123/hermes-starter.git
cd hermes-starter
./install.sh
```

## Actualizar

```bash
cd hermes-starter
git pull
./install.sh
```

## Estructura

```
hermes-starter/
├── install.sh              ← instalador
├── CLAUDE.md               ← config global para Claude Code
├── config/
│   └── hermes-recommended.yaml
└── skills/
    ├── karpathy-coding-guidelines/
    ├── systematic-debugging/
    ├── test-driven-development/
    ├── spike/
    ├── simplify-code/
    ├── requesting-code-review/
    ├── security-audit/
    ├── github/
    └── codebase-inspection/
```

## Licencia

MIT — úsalo, modifícalo y compártelo libremente.
