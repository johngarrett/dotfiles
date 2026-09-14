# TODO

## Restore Sunshine NVENC streaming on the GTX 1070

The GeForce GTX 1070 (Pascal) is on the `nvidia-580xx` legacy driver branch
(`580.178.04`), which exposes NVENC API 13.0.  Current Sunshine
(`2026.906.222525`) requires NVENC API 13.1 / NVIDIA driver 610 or newer, so
it falls back to CPU `libx264` encoding.

Do **not** replace `nvidia-580xx` with the current `nvidia-open` / 615 driver:
Pascal is not supported by that driver branch.

Use the pre-regression Sunshine release `v2025.924.154138` (the upstream
report confirms NVENC works with this exact Pascal + 580xx combination), then
pin/hold that package or AppImage until Sunshine restores Linux support for
NVENC API 13.0.  After changing Sunshine, restart it and confirm its log
contains `Found H.264 encoder: h264_nvenc` rather than `libx264 [software]`.

Upstream tracking: https://github.com/LizardByte/Sunshine/issues/5590
