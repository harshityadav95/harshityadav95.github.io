const fs = require('fs');
const http = require('http');
const path = require('path');

const root = path.resolve(process.argv[2] || '_site');
const port = Number(process.argv[3] || process.env.PORT || 4000);

const contentTypes = {
  '.css': 'text/css; charset=utf-8',
  '.html': 'text/html; charset=utf-8',
  '.js': 'text/javascript; charset=utf-8',
  '.json': 'application/json; charset=utf-8',
  '.png': 'image/png',
  '.jpg': 'image/jpeg',
  '.jpeg': 'image/jpeg',
  '.svg': 'image/svg+xml',
  '.webp': 'image/webp',
  '.xml': 'application/xml; charset=utf-8',
};

function resolveRequest(urlPath) {
  const pathname = decodeURIComponent(new URL(urlPath, 'http://127.0.0.1').pathname);
  const requestedPath = path.normalize(path.join(root, pathname));
  const relativePath = path.relative(root, requestedPath);

  if (relativePath.startsWith('..') || path.isAbsolute(relativePath)) {
    return null;
  }

  const candidates = [
    requestedPath,
    path.join(requestedPath, 'index.html'),
    `${requestedPath}.html`,
  ];

  return candidates.find((candidate) => {
    try {
      return fs.statSync(candidate).isFile();
    } catch {
      return false;
    }
  });
}

const server = http.createServer((req, res) => {
  const filePath = resolveRequest(req.url || '/');

  if (!filePath) {
    res.writeHead(404, { 'content-type': 'text/plain; charset=utf-8' });
    res.end('Not found');
    return;
  }

  const extension = path.extname(filePath).toLowerCase();
  res.writeHead(200, {
    'content-type': contentTypes[extension] || 'application/octet-stream',
  });
  fs.createReadStream(filePath).pipe(res);
});

server.listen(port, '127.0.0.1', () => {
  console.log(`Serving ${root} at http://127.0.0.1:${port}`);
});
