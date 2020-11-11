# Yet another CUDA install guide

### Useful guides

* https://medium.com/@dun.chwong/the-ultimate-guide-ubuntu-18-04-37bae511efb0
* https://medium.com/@dun.chwong/the-simple-guide-deep-learning-with-rtx-3090-cuda-cudnn-tensorflow-keras-pytorch-e88a2a8249bc
* https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html
* https://medium.com/@cjanze/how-to-install-tensorflow-with-gpu-support-on-ubuntu-18-04-lts-with-cuda-10-nvidia-gpu-312a693744b5

### Driver/CUDA/CuDNN/TF version sudoku

* https://docs.nvidia.com/deploy/cuda-compatibility/index.html#support-title
* https://www.tensorflow.org/install/source#gpu

### Prepare Ubuntu

Not really sure if all these libraries are needed

```
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y build-essential cmake unzip pkg-config
sudo apt-get install -y libxmu-dev libxi-dev libglu1-mesa libglu1-mesa-dev
sudo apt-get install -y libjpeg-dev libpng-dev libtiff-dev
sudo apt-get install -y libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
sudo apt-get install -y libxvidcore-dev libx264-dev
sudo apt-get install -y libgtk-3-dev
sudo apt-get install -y libopenblas-dev libatlas-base-dev liblapack-dev gfortran
sudo apt-get install -y libhdf5-serial-dev graphviz
sudo apt-get install -y python3-dev python3-tk python-imaging-tk
sudo apt-get install -y linux-image-generic linux-image-extra-virtual
sudo apt-get install -y linux-source linux-headers-generic
```

Copy and paste the code above and save as a xxxxx.sh file, then run them all in one go, who cares

### CUDA Toolkit

Download and install the toolkit from

* https://developer.nvidia.com/cuda-toolkit

```
chmod +x cuda_10.0.130_410.48_linux.run 
sudo ./cuda_10.0.130_410.48_linux.run
```

Do not install the driver included

Add it to the path in `~/.bashrc`

```
export PATH=/usr/local/cuda-10.0/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-10.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
```

Verify the installation

```
nvcc -V
cd ~/NVIDIA_CUDA-10.0_Samples
make
cd ~/NVIDIA_CUDA-10.0_Samples/bin/x86_64/linux/release
./deviceQuery
```

### Install drivers

Remove noveau

* https://linuxconfig.org/how-to-disable-nouveau-nvidia-driver-on-ubuntu-18-04-bionic-beaver-linux

```
sudo bash -c "echo blacklist nouveau > /etc/modprobe.d/blacklist-nvidia-nouveau.conf"
sudo bash -c "echo options nouveau modeset=0 >> /etc/modprobe.d/blacklist-nvidia-nouveau.conf"
sudo update-initramfs -u
sudo reboot
```

Download the driver from

* https://www.nvidia.com/Download/Find.aspx

```
chmod +x NVIDIA-Linux-x86_64–430.40.run
sudo ./NVIDIA-Linux-x86_64–430.40.run
```

Say no to xconfig, then reboot and check with `nvidia-smi`

### Install cuDNN

Login and download the `.deb` files for the proper version from

* https://developer.nvidia.com/cudnn

```
cuDNN Runtime Library for Ubuntu18.04 (Deb)
cuDNN Developer Library for Ubuntu18.04 (Deb)
cuDNN Code Samples and User Guide for Ubuntu18.04 (Deb)
```

Then install them

```
sudo dpkg -i libcudnn7_7.4.2.24-1+cuda10.0_amd64.deb
sudo dpkg -i libcudnn7-dev_7.4.2.24-1+cuda10.0_amd64.deb
sudo dpkg -i libcudnn7-doc_7.4.2.24-1+cuda10.0_amd64.deb
```

Verify the installation

```
cp -r /usr/src/cudnn_samples_v7/ $HOME
cd $HOME/cudnn_samples_v7/mnistCUDNN
make clean && make
./mnistCUDNN
```

### Install tensorflow

```
pip install tf-nightly-gpu
```

Test

```
python -c "from tensorflow.python.client import device_lib; print(device_lib.list_local_devices())"
```

```
python
import tensorflow as tf
tf.test.is_gpu_available()
tf.test.is_built_with_cuda()
```

### Link missing libraries

Some libraries will have the wrong name, link the one that you need to the one that you have

* https://fantashit.com/cuda-11-1-error-on-tf-nightly-libcusolver-so-10-not-found/

```
sudo ln -s /usr/local/cuda-11.1/targets/x86_64-linux/lib/libcusolver.so.11 /usr/local/cuda-11.1/targets/x86_64-linux/lib/libcusolver.so.10
```


