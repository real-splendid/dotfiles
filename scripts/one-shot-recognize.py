#!/usr/bin/env python3
import argparse
import json
import subprocess
import time
from vosk import Model, KaldiRecognizer, SetLogLevel

parser = argparse.ArgumentParser(description="One shot speech recognize using Vosk model and microphone input")
parser.add_argument("-d", "--device-id", type=str,
                    help="The device identifier for the input audio device")
parser.add_argument("-m", "--model", type=str,
                    help="Vosk model path")
args = parser.parse_args()

SetLogLevel(-1)
# args.device_id = "alsa_input.usb-Sennheiser_Communications_Sennheiser_USB_headset-00.mono-fallback"
model = Model(args.model)
parec_process = subprocess.Popen(
    ["parec", "--format=s16le", "--rate=16000", "--channels=1", "--latency-msec=30", "-d", args.device_id],
    stdout=subprocess.PIPE
)
rec = KaldiRecognizer(model, 16000)
time.sleep(0.1)
silence_limit = 2 # seconds
last_change_time = time.monotonic()
last_text = ""

while time.monotonic() - last_change_time < silence_limit:
    data = parec_process.stdout.read(1024)
    if len(data) == 0:
        break
    rec.AcceptWaveform(data)
    result = json.loads(rec.PartialResult())
    if "partial" not in result or result["partial"] == "":
        continue
    if result["partial"] == last_text:
        continue
    last_text = result["partial"]
    last_change_time = time.monotonic()
    # print(last_text)

parec_process.terminate()
parec_process.wait()
result = json.loads(rec.FinalResult())
# print(result)
print(result["text"])
