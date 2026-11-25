#!/usr/bin/env python3
"""Independent libsndfile PCM16 reference; original WAV files remain read-only."""
import ctypes
import ctypes.util
import json
import pathlib
import struct
import sys
class Info(ctypes.Structure):
    _fields_ = [('frames', ctypes.c_int64), ('samplerate', ctypes.c_int), ('channels', ctypes.c_int), ('format', ctypes.c_int), ('sections', ctypes.c_int), ('seekable', ctypes.c_int)]
name = ctypes.util.find_library('sndfile')
if not name:
    raise RuntimeError('Independent reference requires libsndfile')
lib = ctypes.CDLL(name)
lib.sf_open.argtypes = [ctypes.c_char_p, ctypes.c_int, ctypes.POINTER(Info)]
lib.sf_open.restype = ctypes.c_void_p
lib.sf_readf_short.argtypes = [ctypes.c_void_p, ctypes.POINTER(ctypes.c_int16), ctypes.c_int64]
lib.sf_readf_short.restype = ctypes.c_int64
lib.sf_close.argtypes = [ctypes.c_void_p]
lib.sf_version_string.restype = ctypes.c_char_p
root = pathlib.Path(sys.argv[1])
files = sorted(root.glob('Audio/**/*.wav'))
out = sys.stdout.buffer
out.write(struct.pack('<I', len(files)))
for file in files:
    info = Info()
    handle = lib.sf_open(str(file).encode(), 0x10, ctypes.byref(info))
    if not handle:
        raise RuntimeError(f'Independent decoder could not open {file}')
    try:
        pcm = (ctypes.c_int16 * (info.frames * info.channels))()
        frames = lib.sf_readf_short(handle, pcm, info.frames)
        if frames != info.frames:
            raise RuntimeError('Truncated libsndfile output')
        metadata = json.dumps({'path': file.relative_to(root).as_posix(), 'channels': info.channels, 'sampleRate': info.samplerate, 'frames': frames, 'reference': lib.sf_version_string().decode()}).encode()
        data = bytes(pcm)
        out.write(struct.pack('<II', len(metadata), len(data)))
        out.write(metadata)
        out.write(data)
    finally:
        lib.sf_close(handle)
