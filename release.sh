#!/bin/bash

set -e

# Configuration
PROVIDER_NAME="terraform-provider-cloudlab"
VERSION="v1.0.1"
OS="linux"
ARCH="amd64"
RELEASE_DIR="release"
BINARY_NAME="${PROVIDER_NAME}_${VERSION}_${OS}_${ARCH}"

# Step 1: Create release directory if not exists
mkdir -p "$RELEASE_DIR"

# Step 2: Build binary
echo "🔨 Building $BINARY_NAME..."
GOOS=$OS GOARCH=$ARCH go build -o "${RELEASE_DIR}/${BINARY_NAME}"

# Step 3: Generate SHA256SUMS
echo "🔐 Generating SHA256SUMS..."
cd "$RELEASE_DIR"
shasum -a 256 * > SHA256SUMS

# Step 4: GPG Sign the checksum file
echo "✍️ Signing SHA256SUMS with GPG..."
gpg --armor --output SHA256SUMS.sig --detach-sign SHA256SUMS

# Step 5: Done
echo "✅ Release artifacts are in: $RELEASE_DIR"
ls -lh

cd ..
