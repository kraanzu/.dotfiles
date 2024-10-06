class Color:
    extra_dark = "#272c36"

    dark1 = "#2e3440"
    dark2 = "#3b4252"
    dark3 = "#434c5e"
    dark4 = "#4c566a"

    light1 = "#d8dee9"
    light2 = "#e5e9f0"
    light3 = "#e5e9f0"

    red = "#bf616a"
    green = "#a3be8c"
    yellow = "#ebcb8b"
    magenta = "#b48ead"
    grey = "#4c566a"
    orange = "#d08770"
    cyan = "#8fbcbb"
    cyan2 = "#88c0d0"
    blue = "#84A7C0"
    blue2 = "#5e81ac"

    def __getitem__(self, item):
        return getattr(self, item)


color = Color()
