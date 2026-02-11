# netbus.py — shared, persistent UDP sender for Talon user scripts
# Usage (any file): from .netbus import send_json

import socket, json, atexit

HOST = "127.0.0.1"   # your local listener
PORT = 55255

_udp = None
_addr = (HOST, PORT)

def _sock():
    global _udp
    if _udp is None:
        s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        s.setblocking(False)  # never stall Talon
        _udp = s
    return _udp

def configure(host: str = None, port: int = None):
    """Optional: change host/port once at startup."""
    global _addr
    if host is not None or port is not None:
        _addr = (host or _addr[0], port or _addr[1])

def track_key_count(paste_count=0) -> None:
    """Fire-and-forget: serialize and send one JSON line via UDP."""
    try:
        data = json.dumps({
            "paste_count": paste_count,
        }).encode("utf-8") + b"\n"
        _sock().sendto(data, _addr)
    except Exception:
        # best-effort: drop on error (no blocking, no retries)
        print('error')
        pass

@atexit.register
def _cleanup():
    global _udp
    if _udp:
        try: _udp.close()
        except Exception: pass
        _udp = None
