#!/usr/bin/env python3
"""Report available RAM with absolute GiB warning thresholds for Waybar."""

import json
from pathlib import Path


def memory_status(meminfo):
    values = {
        key: int(value.split()[0])
        for key, value in (line.split(":", 1) for line in meminfo.splitlines())
    }
    available = values["MemAvailable"] / 1024**2
    total = values["MemTotal"] / 1024**2
    state = "critical" if available <= 1 else "warning" if available <= 3 else "normal"
    return {
        "text": f"{available:.1f}G free",
        "tooltip": f"{total - available:.1f}G used of {total:.1f}G",
        "class": state,
    }


if __name__ == "__main__":
    print(json.dumps(memory_status(Path("/proc/meminfo").read_text())))
