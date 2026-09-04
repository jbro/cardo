#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
IMAGE="${ZMK_IMAGE:-zmkfirmware/zmk-build-arm:stable}"

# Build the Cardo firmware using the same containerized ZMK toolchain as before.
docker run --rm \
  -v "${ROOT_DIR}:/workdir" \
  -w /workdir \
  "${IMAGE}" \
  /bin/bash -lc '
    git config --global --add safe.directory /workdir
    west build -p always -s zmk/app -b xiao_ble//zmk -- \
      -DZMK_CONFIG=/workdir/config \
      -DSHIELD=cardo \
      -DZephyr_DIR=/workdir/zephyr/share/zephyr-package/cmake
  '

echo "Firmware written to: ${ROOT_DIR}/build/zephyr/zmk.uf2"

# Render the keymap when uv and Inkscape are available. The firmware
# build remains usable on systems that only have Docker installed.
if command -v uv >/dev/null 2>&1 && command -v inkscape >/dev/null 2>&1; then
  mkdir -p "${ROOT_DIR}/images"
  parsed_keymap="$(mktemp)"
  trap 'rm -f "${parsed_keymap}"' EXIT
  uvx --from keymap-drawer keymap \
    -c "${ROOT_DIR}/keymap_drawer.config.yaml" \
    parse -z "${ROOT_DIR}/config/boards/shields/cardo/cardo.keymap" \
    > "${parsed_keymap}"
  uvx --from keymap-drawer keymap \
    -c "${ROOT_DIR}/keymap_drawer.config.yaml" \
    draw --qmk-info-json "${ROOT_DIR}/keymap_drawer.layout.json" \
    "${parsed_keymap}" \
    > "${ROOT_DIR}/images/cardo-keymap.svg"
  inkscape "${ROOT_DIR}/images/cardo-keymap.svg" \
    --export-filename="${ROOT_DIR}/images/cardo-keymap.png" \
    >/dev/null
  echo "Keymap image written to: ${ROOT_DIR}/images/cardo-keymap.png"
else
  echo "Skipping keymap image (requires uv and Inkscape)." >&2
fi
