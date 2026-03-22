#!/bin/bash
docker buildx build --output type=local,dest=. .
chmod +x tqsl.AppImage
mkdir -p $HOME/.local/bin $HOME/.local/share/applications $HOME/.local/share/icons/tqsl-app
mv tqsl.AppImage $HOME/.local/bin/tqsl
mv TrustedQSL.png $HOME/.local/share/icons/tqsl-app/TrustedQSL.png
cat <<EOF > $HOME/.local/share/applications/tqsl.desktop
[Desktop Entry]
Categories=HamRadio;Utility
Comment=Log & Sign contacts to upload to ARRL's Logbook Of The World
Exec=$HOME/.local/bin/tqsl %F
TryExec=$HOME/.local/bin/tqsl
Icon=$HOME/.local/share/icons/tqsl-app/TrustedQSL.png
Name=TrustedQSL
StartupNotify=false
Terminal=false
Type=Application
EOF
