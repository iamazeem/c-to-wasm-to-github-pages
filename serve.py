#!/usr/bin/env python3

import http.server

host = '127.0.0.1'
port = 8080

h = http.server.SimpleHTTPRequestHandler
h.extensions_map = {'': 'text/html', '.wasm': 'application/wasm', '.js': 'application/javascript'}

print(f'Serving... [http://{host}:{port}]')
http.server.HTTPServer(('127.0.0.1', port), h).serve_forever()
