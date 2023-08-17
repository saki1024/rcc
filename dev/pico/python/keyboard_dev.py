from pynput import keyboard
from pynput .keyboard import Key
from comms .controller import WirelessController , WirelessInterface
from comms .messages import Twist

C = WirelessController(WirelessInterface)
c.start_inbound()
c.start_outbound()

def on_press(key):
    try:
        print('alphanumeric key {0} pressed'.format(
            key.char))
    except AttributeError:
        print('special key {0} pressed'.format(
            key))

def on_release(key):
    print('{0} released'.format(
        key))
    if key == keyboard.Key.esc:
        # Stop listener
        return False

listener = keyboard.Listener(on_press=on_press, on_release=on_release)
listener.start()

while True:
    pass