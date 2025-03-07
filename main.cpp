#include <opencv2/opencv.hpp>
#include <iostream>

int main() {
    cv::Mat image = cv::Mat::zeros(400, 400, CV_8UC3);
    cv::putText(image, "Hello OpenCV!", cv::Point(50, 200), 
                cv::FONT_HERSHEY_SIMPLEX, 1, cv::Scalar(0, 255, 0), 2);
    cv::imwrite("output.png", image);
    std::cout << "Image generated!" << std::endl;
    return 0;
}