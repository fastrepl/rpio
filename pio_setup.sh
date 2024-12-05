sudo apt update
sudo apt install -y python3-dev libffi-dev libssl-dev

# https://docs.platformio.org/en/latest/core/installation/methods/installer-script.html
curl -fsSL -o pio.py https://raw.githubusercontent.com/platformio/platformio-core-installer/refs/tags/v1.1.3/get-platformio.py
python3 pio.py

# https://docs.platformio.org/en/latest/core/installation/udev-rules.html
curl -fsSL https://raw.githubusercontent.com/platformio/platformio-core/develop/platformio/assets/system/99-platformio-udev.rules | sudo tee /etc/udev/rules.d/99-platformio-udev.rules
sudo service udev restart

# https://docs.platformio.org/en/latest/core/installation/shell-commands.html#method-2
mkdir -p /usr/local/bin
sudo ln -s ~/.platformio/penv/bin/platformio /usr/local/bin/platformio
sudo ln -s ~/.platformio/penv/bin/pio /usr/local/bin/pio
sudo ln -s ~/.platformio/penv/bin/piodebuggdb /usr/local/bin/piodebuggdb

pio remote agent start
