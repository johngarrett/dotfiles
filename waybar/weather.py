"""Current Cole Valley temperature for Waybar (Open-Meteo, no API key)."""

import json
import math
import urllib.request


# Cole Valley, San Francisco, near Cole and Carl streets.
URL = (
    "https://api.open-meteo.com/v1/forecast"
    "?latitude=37.7658&longitude=-122.4506"
    "&current=temperature_2m&temperature_unit=fahrenheit"
    "&timezone=America%2FLos_Angeles"
)


def main():
    try:
        with urllib.request.urlopen(URL, timeout=15) as response:
            current = json.load(response)["current"]
        temperature = float(current["temperature_2m"])
        if not math.isfinite(temperature):
            raise ValueError("Invalid temperature")
        output = {
            "text": f"{temperature:.0f}°F",
            "tooltip": (
                "Cole Valley, San Francisco\n"
                f"Updated: {current['time'].replace('T', ' ')}\n"
                "Weather data: Open-Meteo.com"
            ),
        }
    except (OSError, ValueError, KeyError, TypeError):
        output = {
            "text": "--°F",
            "tooltip": "Cole Valley weather unavailable; retries every 10 minutes",
            "class": "unavailable",
        }
    print(json.dumps(output))


if __name__ == "__main__":
    main()
