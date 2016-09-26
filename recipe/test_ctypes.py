import sys
import os
from ctypes import CDLL, c_char_p
from ctypes.util import find_library

if sys.platform == "win32":
    lib_name = "glpk.dll"
    lib_path = os.path.join(sys.prefix, "Library", "bin", lib_name)
elif sys.platform == "darwin":
    lib_name = "libglpk.dylib"
    lib_path = find_library(lib_name)
else:
    lib_name = "libglpk.so"
    lib_path = find_library(lib_name)

if not os.path.exists(lib_path):
    raise RuntimeError("Shared library not found at: {}".format(lib_path))

lib = CDLL(lib_path)

lib.glp_version.argtypes = None
lib.glp_version.restype = c_char_p

version = lib.glp_version().decode("utf-8")
major_version, minor_version = [int(x) for x in version.split(".")]
print("major = {}, minor = {}".format(major_version, minor_version))
