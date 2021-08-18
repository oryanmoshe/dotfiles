#/bin/bash
echo 'Downloading and extracting bitwarden CLI (bw)'
curl -X GET -Ls 'https://vault.bitwarden.com/download/?app=cli&platform=macos' | tar xzC /usr/local/bin/ -f -

echo 'Finished downloading and extracting bw, changing execution permissions'
chmod +x /usr/local/bin/bw

echo 'Finished installing bw'
