from component.camera import Camera
from component.ultrasonic import Ultrasonic
from wrapper.edison import Edison


class SparkingEdison(Edison):

    def __init__(self):
        # TODO: hardcode for testing
        self.macAddress = "FZEDA544D00YLV501"
        self.sensors = {"camera": Camera(),
                        "ultrasonic": Ultrasonic()
                        }
