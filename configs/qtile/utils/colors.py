class Color:
    transparent = ["#2e3440", "#2e3440"]
    dark1 = ["#2e3440", "#2e3440"]
    dark2 = ["#252a34", "#252a34"]
    dark3 = ["#434c5e", "#434c5e"]
    light1 = ["#d8dee9", "#d8dee9"]
    light2 = ["#3b4252", "#3b4252"]
    light3 = ["#e5e9f0", "#e5e9f0"]
    red = ["#bf616a", "#bf616a"]
    green = ["#a3be8c", "#a3be8c"]
    yellow = ["#ebcb8b", "#ebcb8b"]
    magenta = ["#b48ead", "#b48ead"]
    grey = ["#4c566a", "#4c566a"]
    orange = ["#d08770", "#d08770"]
    cyan = ["#88c0d0", "#88c0d0"]
    cyan2 = ["#8fbcbb", "#8fbcbb"]
    blue = ["#84A7C0", "#84A7C0"]
    blue2 = ["#5e81ac", "#5e81ac"]

    def __getitem__(self, item):
        return getattr(self, item)


color = Color()
