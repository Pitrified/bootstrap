# Yet another CUDA install guide

### Useful guides

* https://medium.com/@juancrrn/installing-cuda-and-cudnn-in-ubuntu-20-04-for-deep-learning-dad8841714d6
* https://medium.com/@dun.chwong/the-ultimate-guide-ubuntu-18-04-37bae511efb0
* https://medium.com/@dun.chwong/the-simple-guide-deep-learning-with-rtx-3090-cuda-cudnn-tensorflow-keras-pytorch-e88a2a8249bc
* https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html
* https://medium.com/@cjanze/how-to-install-tensorflow-with-gpu-support-on-ubuntu-18-04-lts-with-cuda-10-nvidia-gpu-312a693744b5

### Driver/CUDA/CuDNN/TF version sudoku

* https://docs.nvidia.com/deploy/cuda-compatibility/index.html#support-title
* https://www.tensorflow.org/install/source#gpu

### Prepare Ubuntu

Not really sure if all these libraries are needed

```bash
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
sudo apt install -y libfreeimage-dev
```

Copy and paste the code above and save as a xxxxx.sh file, then run them all in one go, who cares

Didn't need them at all this time but who knows the mess I made with the `.deb` packages.

### Install drivers

Remove noveau, this has to be done

* https://linuxconfig.org/how-to-disable-nouveau-nvidia-driver-on-ubuntu-18-04-bionic-beaver-linux

```bash
sudo bash -c "echo blacklist nouveau > /etc/modprobe.d/blacklist-nvidia-nouveau.conf"
sudo bash -c "echo options nouveau modeset=0 >> /etc/modprobe.d/blacklist-nvidia-nouveau.conf"
sudo update-initramfs -u
sudo reboot
```

If you really want,
download the driver from
https://www.nvidia.com/Download/Find.aspx
but really, just use the cuda one

```bash
chmod +x NVIDIA-Linux-x86_64-455.38.run
sudo ./NVIDIA-Linux-x86_64-455.38.run
```

Say no to xconfig, then reboot and check with:

```bash
nvidia-smi
cat /proc/driver/nvidia/version
```

The driver might complain that there is a X server running:

```bash
# turn off graphics
sudo systemctl set-default multi-user
gnome-session-quit

# to restore later, place them in history
echo sudo systemctl set-default graphical
echo sudo systemctl start gdm3
```

reboot or whatever, then use `Ctrl+Alt+F1` to change `tty1`, now you can install.

The CUDA installer calls the driver install with a bunch of options that might be useful:

```bash
NVIDIA-Linux-x86_64-515.43.04.run
--ui=none
--no-questions
--accept-license
--disable-nouveau
--no-cc-version-check
--install-libglvnd
2>&1
```

### CUDA Toolkit

Download and install the toolkit from
https://developer.nvidia.com/cuda-toolkit

Get the `.run`, not the `.deb`,
so that you don't have to fight with GPG and keys
(and also you don't pollute the repos)

```bash
chmod +x cuda_11.1.1_455.32.00_linux.run
sudo ./cuda_11.1.1_455.32.00_linux.run
```

You might want to add the options
https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html#runfile-advanced
```
--silent     # less prompts, sometimes in the tty the interactive thing does not work
--toolkit    # only the toolkit?
--driver     # the driver as well?
--override-driver-check # if you installed a wrong driver like a fool
```

Do not install the driver included.
WHY? This driver will be compatible with the cuda version you are trying to install.
Sure you could get an even more recent driver but who really cares.

Add it to the path in `~/.bashrc` or `.bash_aliases.local`

```bash
export PATH=/usr/local/cuda-11.1/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-11.1/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
```

this is prettier

```bash
# NVIDIA CUDA Toolkit
export CUDA_HOME=/usr/local/cuda-11.7
export PATH=${CUDA_HOME}/bin:${PATH}
export LD_LIBRARY_PATH=${CUDA_HOME}/lib64:$LD_LIBRARY_PATH
```

Verify the installation: at least check that the compiler is on path

```bash
nvcc --version
```

If someone already loaded the samples somewhere try this:

```bash
cd ~/NVIDIA_CUDA-11.1_Samples
make
~/NVIDIA_CUDA-11.1_Samples/bin/x86_64/linux/release/deviceQuery
```

Or download them:

```bash
git clone https://github.com/NVIDIA/cuda-samples.git
cd cuda-samples/Samples/1_Utilities/deviceQuery/
make
./deviceQuery
```

or for maximum laziness:

```bash
cd /usr/local/cuda-11.7/extras/demo_suite/
./deviceQuery 
```

### Install cuDNN

The
[install guide](https://docs.nvidia.com/deeplearning/cudnn/install-guide/index.html#installlinux-deb)
is actually pretty good

Install zlib?

```bash
sudo apt install zlib1g
```

Login and download the `.deb` files for the proper version from
https://developer.nvidia.com/cudnn

If there still isn't a cuDNN for the new LTS, use the old one and hope for the best lmao.

There are no longer 3 separate debs, there is something like
`cudnn-local-repo-ubuntu2004-8.4.1.50_1.0-1_amd64.deb `

for extra laziness use a variable

```bash
cudnn_version=8.4.1.50
```

```bash
sudo dpkg -i cudnn-local-repo-ubuntu2004-${cudnn_version}_1.0-1_amd64.deb 
```

The command `dpkg` will complain about the keys, but conveniently will tell how to fix that with keyrings

```bash
sudo cp /var/cudnn-local-repo-ubuntu2004-8.4.1.50/cudnn-local-E3EC4A60-keyring.gpg /usr/share/keyrings/
```

refresh the repos

```bash
sudo apt-get update
```

install the three things, with the right cuda version if you're feeling lucky,
or just a random one and hopefully in the repos there is only compatible versions lol

```bash
cudnn_version=8.4.1.50
sudo apt-get install libcudnn8=${cudnn_version}-1+cuda11.7

sudo apt install libcudnn8
sudo apt install libcudnn8-dev
sudo apt install libcudnn8-samples 
```

test cuDNN, might need a library if you were lazy and skipped the preinstall section of this guide,
this was the only one missing last time

```bash
sudo apt install libfreeimage3 libfreeimage-dev

cp -r /usr/src/cudnn_samples_v8/ .
cd cudnn_samples_v8/mnistCUDNN/
make clean
make
./mnistCUDNN 
```

<!-- ```bash -->
<!-- cuDNN Runtime Library for Ubuntu18.04 (Deb) -->
<!-- cuDNN Developer Library for Ubuntu18.04 (Deb) -->
<!-- cuDNN Code Samples and User Guide for Ubuntu18.04 (Deb) -->
<!-- ``` -->
<!-- Then install them -->
<!-- ```bash -->
<!-- sudo dpkg -i libcudnn8_8.0.5.39-1+cuda11.1_amd64.deb -->
<!-- sudo dpkg -i libcudnn8-dev_8.0.5.39-1+cuda11.1_amd64.deb -->
<!-- sudo dpkg -i libcudnn8-samples_8.0.5.39-1+cuda11.1_amd64.deb -->
<!-- ``` -->
<!-- Verify the installation -->
<!-- ```bash -->
<!-- cp -r /usr/src/cudnn_samples_v8/ $HOME -->
<!-- cd $HOME/cudnn_samples_v8/mnistCUDNN -->
<!-- make clean && make -->
<!-- ./mnistCUDNN -->
<!-- ``` -->

### Install tensorflow

Tensorflow 2.4 uses cuda 11, no need for nightly version

Tensorflow 2.9 uses cuda 11.2

```bash
pip install tensorflow
```

Test

```bash
python -c "from tensorflow.python.client import device_lib; print(device_lib.list_local_devices())"
python -c "import tensorflow as tf; print(tf.test.is_gpu_available()); print(tf.test.is_built_with_cuda());"
```

```bash
python
import tensorflow as tf
tf.test.is_gpu_available()
tf.test.is_built_with_cuda()
```

### Link missing libraries

Some libraries will have the wrong name, link the one that you have to the one that you need

* https://fantashit.com/cuda-11-1-error-on-tf-nightly-libcusolver-so-10-not-found/

```bash
sudo ln -s /usr/local/cuda-11.1/targets/x86_64-linux/lib/libcusolver.so.11 /usr/local/cuda-11.1/targets/x86_64-linux/lib/libcusolver.so.10
```
