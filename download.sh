VERSION=`curl -fsSL https://www.arrl.org/tqsl-download | grep -oh "Download and Install TQSL [0-9.]\{5,8\}" | sed -e 's/^.* //'`

curl --output tqsl.tar.gz "https://www.arrl.org/files/file/LoTW%20Instructions/tqsl-$VERSION.tar.gz"
