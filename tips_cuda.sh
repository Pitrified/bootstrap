
# https://www.tensorflow.org/install/gpu#ubuntu_1804_cuda_10
echo https://www.tensorflow.org/install/gpu#ubuntu_1804_cuda_10

echo ==== Add NVIDIA package repositories
echo wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-repo-ubuntu1804_10.0.130-1_amd64.deb
echo sudo dpkg -i cuda-repo-ubuntu1804_10.0.130-1_amd64.deb
echo sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
echo sudo apt-get update
echo wget http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64/nvidia-machine-learning-repo-ubuntu1804_1.0.0-1_amd64.deb
echo sudo apt install ./nvidia-machine-learning-repo-ubuntu1804_1.0.0-1_amd64.deb
echo sudo apt-get update
echo 
echo ==== Install NVIDIA driver
echo sudo apt-get install --no-install-recommends nvidia-driver-418
echo ==== Reboot. Check that GPUs are visible using the command: nvidia-smi
echo 
echo ==== Install development and runtime libraries \(~4GB\)
echo sudo apt-get install --no-install-recommends \\
echo     cuda-10-0 \\
echo     libcudnn7=7.6.2.24-1+cuda10.0  \\
echo     libcudnn7-dev=7.6.2.24-1+cuda10.0
echo 
echo ==== Install TensorRT. Requires that libcudnn7 is installed above.
echo sudo apt-get install -y --no-install-recommends libnvinfer5=5.1.5-1+cuda10.0 \\
echo     libnvinfer-dev=5.1.5-1+cuda10.0
echo 


# https://medium.com/@rabbi.cse.sust.bd/how-to-install-tensorflow-gpu-on-ubuntu-18-04-6d83ebb2721f
echo https://medium.com/@rabbi.cse.sust.bd/how-to-install-tensorflow-gpu-on-ubuntu-18-04-6d83ebb2721f

# https://medium.com/better-programming/install-tensorflow-1-13-on-ubuntu-18-04-with-gpu-support-239b36d29070
# https://mc.ai/tensorflow-gpu-installation-on-ubuntu-18-04/
# https://www.pyimagesearch.com/2019/01/30/ubuntu-18-04-install-tensorflow-and-keras-for-deep-learning/
