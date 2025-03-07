# OpenCV C++ Docker

For guys who use Apple silicon chip to code OpenCV in c++.

> Hint: Using docker to run opencv c++ will not allow you to use imshow unless you set up Xserver.

## Compile
```sh
docker build -t opencv_cpp .
docker run -it --rm -v $(pwd):/app opencv_cpp
```


## Run
```sh
./compile.sh
```