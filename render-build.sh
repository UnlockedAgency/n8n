#!/bin/bash
# Install correct pnpm version
npm install -g pnpm@latest

# Temporarily modify package.json to handle patched dependencies
cp package.json package.json.backup
node -e "const pkg=require('./package.json'); delete pkg.patchedDependencies; require('fs').writeFileSync('package.json', JSON.stringify(pkg, null, 2));"

# Install dependencies and build
pnpm install --no-frozen-lockfile
pnpm run build

# Restore original package.json
mv package.json.backup package.json
