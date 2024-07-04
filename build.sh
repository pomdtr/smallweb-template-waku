#!/bin/sh

set -e

cd app
npm install
npm run build -- --with-deno
sed -i '' 's/const distDir = "dist";/const distDir = "app\/dist";/g' ./dist/serve.js
sed -i '' 's/Deno\.serve(app\.fetch);/export default app;/g' ./dist/serve.js
