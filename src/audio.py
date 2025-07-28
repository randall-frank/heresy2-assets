import soundfile as sf
import numpy as np
import glob
import os

v = {}
max_rms = 0.0
avg_rms = 0.0
# Read all .mp3 files in the specified directory
for name in glob.glob("src/media/audio/*.mp3"):
    data, samplerate = sf.read(name)
    if data.ndim > 1:
        data = data.mean(axis=1)  # Convert to mono by averaging channels
    print(f"Processing {name}: {data.shape} {data.dtype.name} samples at {samplerate} Hz")
    rms = np.sqrt(np.mean(data**2))
    v[os.path.basename(name)] = rms
    if rms > max_rms:
        max_rms = rms
    avg_rms += rms
avg_rms /= len(v)
print("Max RMS:", max_rms)
print("Average RMS:", avg_rms)
target = 0.1  # Target RMS level
for name, rms in v.items():
    scale = target / rms
    print(f"{name}: {rms:.4f} (Scale: {scale:.2f})")
print("Audio processing complete.")

'''
agora.mp3: 0.0399 (Scale: 2.51)
alarm.mp3: 0.1033 (Scale: 0.97)
ascension.mp3: 0.0950 (Scale: 1.05)
base.mp3: 0.0488 (Scale: 2.05)
computer.mp3: 0.0898 (Scale: 1.11)
computer_room.mp3: 0.0469 (Scale: 2.13)
control.mp3: 0.1214 (Scale: 0.82)
debrief.mp3: 0.0472 (Scale: 2.12)
decode.mp3: 0.0431 (Scale: 2.32)
delphi.mp3: 0.1930 (Scale: 0.52)
door.mp3: 0.0813 (Scale: 1.23)
door_locked.mp3: 0.0428 (Scale: 2.34)
door_unlock.mp3: 0.0492 (Scale: 2.03)
endgame.mp3: 0.0873 (Scale: 1.15)
error.mp3: 0.2364 (Scale: 0.42)
fitting_scanner.mp3: 0.0551 (Scale: 1.81)
garden.mp3: 0.0086 (Scale: 11.60)
hypermarket.mp3: 0.0999 (Scale: 1.00)
modem.mp3: 0.1022 (Scale: 0.98)
normal.mp3: 0.0703 (Scale: 1.42)
office.mp3: 0.0544 (Scale: 1.84)
positive.mp3: 0.0843 (Scale: 1.19)
river.mp3: 0.0163 (Scale: 6.13)
shock.mp3: 0.2019 (Scale: 0.50)
stonemason.mp3: 0.0082 (Scale: 12.22)
temple.mp3: 0.0288 (Scale: 3.47)
transport.mp3: 0.1856 (Scale: 0.54)
workshop.mp3: 0.0633 (Scale: 1.58)
'''
