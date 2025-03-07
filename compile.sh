echo "[+] Compiling..."

if ! pkg-config --exists opencv4; then
    echo "[-] Error: opencv4 not found"
    exit 1
fi

g++ -o main main.cpp `pkg-config --cflags --libs opencv4` \
    -I/usr/local/include/opencv4 -L/usr/local/lib \
    -lopencv_core -lopencv_imgproc -lopencv_highgui -lopencv_imgcodecs

echo "[+] Running..."
./main
