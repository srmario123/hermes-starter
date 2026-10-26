#!/usr/bin/env bash
set -euo pipefail

# hermes-starter — script de instalación
# Uso: curl -fsSL https://raw.githubusercontent.com/srmario123/hermes-starter/main/install.sh | bash
# O localmente: ./install.sh

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_SRC="$REPO_DIR/skills"
SKILLS_DST="$HOME/.hermes/skills/software-development"
CLAUDE_SRC="$REPO_DIR/CLAUDE.md"
CLAUDE_DST="$HOME/.claude/CLAUDE.md"

CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo ""
echo -e "${CYAN}╔══════════════════════════════════════╗${NC}"
echo -e "${CYAN}║      hermes-starter installer        ║${NC}"
echo -e "${CYAN}╚══════════════════════════════════════╝${NC}"
echo ""

# Si se ejecuta via curl, clonar primero
if [ "$REPO_DIR" = "/" ] || [ ! -d "$SKILLS_SRC" ]; then
  echo "Clonando repositorio..."
  TMP_DIR=$(mktemp -d)
  git clone --depth 1 https://github.com/srmario123/hermes-starter.git "$TMP_DIR/hermes-starter"
  REPO_DIR="$TMP_DIR/hermes-starter"
  SKILLS_SRC="$REPO_DIR/skills"
  CLAUDE_SRC="$REPO_DIR/CLAUDE.md"
fi

# 1. Instalar skills
echo -e "📦 Instalando skills en ${YELLOW}$SKILLS_DST${NC}..."
mkdir -p "$SKILLS_DST"
installed=0
for skill_dir in "$SKILLS_SRC"/*/; do
  skill_name=$(basename "$skill_dir")
  dst="$SKILLS_DST/$skill_name"
  if [ -d "$dst" ]; then
    echo -e "  ${YELLOW}↺${NC} $skill_name (ya existe, actualizando)"
    rm -rf "$dst"
  else
    echo -e "  ${GREEN}✓${NC} $skill_name"
  fi
  cp -r "$skill_dir" "$dst"
  ((installed++))
done
echo ""

# 2. Instalar CLAUDE.md
echo -e "📝 Configurando CLAUDE.md en ${YELLOW}$CLAUDE_DST${NC}..."
mkdir -p "$(dirname "$CLAUDE_DST")"
if [ -f "$CLAUDE_DST" ]; then
  if grep -q "hermes-starter" "$CLAUDE_DST" 2>/dev/null; then
    echo -e "  ${YELLOW}↺${NC} CLAUDE.md ya contiene hermes-starter (sin cambios)"
  else
    echo "" >> "$CLAUDE_DST"
    echo "# --- hermes-starter ---" >> "$CLAUDE_DST"
    cat "$CLAUDE_SRC" >> "$CLAUDE_DST"
    echo -e "  ${GREEN}✓${NC} Agregado al CLAUDE.md existente"
  fi
else
  cp "$CLAUDE_SRC" "$CLAUDE_DST"
  echo -e "  ${GREEN}✓${NC} CLAUDE.md creado"
fi
echo ""

# Resumen
echo -e "${GREEN}✅ Instalación completada${NC}"
echo -e "   Skills instaladas: ${GREEN}$installed${NC}"
echo -e "   CLAUDE.md: ${GREEN}$CLAUDE_DST${NC}"
echo ""
echo -e "💡 Reinicia el gateway de Hermes para cargar las nuevas skills:"
echo -e "   ${CYAN}hermes gateway restart${NC}"
echo ""
