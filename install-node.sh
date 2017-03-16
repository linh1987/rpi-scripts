#!/usr/bin/env bash
# Install Node.js Binaries on Raspberry Pi A/A+/B/B+ (ARMv6 CPU).

# Get the latest Node.js Binaries filename
# Result like: node-v5.5.0-linux-armv6l.tar.gz
# For RPi2 Model B, replace "armv6l" with "armv7l".
FILENAME=`wget -q -O - https://nodejs.org/dist/v6.10.0/SHASUMS256.txt | grep linux-armv6l.tar.gz | sed 's/^[0-9a-f]\+\s*//g'`

# Download
if [ ! -f $FILENAME ]; then
    wget --no-check-certificate https://nodejs.org/dist/v6.10.0/$FILENAME
fi

# Folder name
FOLDER=${FILENAME::-7}

# Remove old files
[ -d $FOLDER ] && rm -rf $FOLDER

# Extract
tar -zxf $FILENAME

# Remove unnecessary files
cd $FOLDER
rm README.md CHANGELOG.md LICENSE

# Copy as install
cd ..
cp -R $FOLDER/* /usr/local/

echo "Done!"
echo "Node `node -v`"
echo "NPM `npm -v`"