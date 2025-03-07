#!/bin/bash

# 檢查是否提供 C++ 檔案名稱
if [ -z "$1" ]; then
    echo "[-] Error: Missing C++ file"
    echo "usage: ./compile.sh <cpp_file>"
    exit 1
fi

CPP_FILE="$1"
OUTPUT_FILE="${CPP_FILE%.cpp}"  # 移除 .cpp 副檔名，作為輸出執行檔

echo "[+] Compiling $CPP_FILE..."

# 檢查 OpenCV 是否安裝
if ! pkg-config --exists opencv4; then
    echo "[-] Error: OpenCV4 not found"
    exit 1
fi

# 編譯 C++ 程式
g++ -o "$OUTPUT_FILE" "$CPP_FILE" `pkg-config --cflags --libs opencv4` \
    -I/usr/local/include/opencv4 -L/usr/local/lib \
    -lopencv_core -lopencv_imgproc -lopencv_highgui -lopencv_imgcodecs

if [ $? -ne 0 ]; then
    echo "[-] Compilation failed"
    exit 1
fi

echo "[+] Compilation successful! Executable: $OUTPUT_FILE"

echo "[+] Running..."
./"$OUTPUT_FILE"
