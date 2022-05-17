# What is this?
TensorFlow Model Garden (TFM) has a small example inside `/official/vision/beta/projects/example/`. However this example uses the ImageNet dataset, which is quite big to download. 
I slightly changed the code, so that ...
- you can (only) run the code with cifar10 dataset (with tfds). Cifar is much smaller and should be downloaded within a few seconds/minutes
- it uses one GPU instead of CPU (which is the default)
- the experiment ends after a few steps (reduced training steps)

You can easily see all changes in the commit changes of this branch. I also added comments to the `example_config_local.yaml` in which I explain what I changed and why.
The fact that I changed the `decode` function in `example_input.py` like that is messy I know. But this was the easiest way to get cifar10 working with the example.

# How do I execute this code?
1. Clone this branch (in order to mount the code over the original `/opt/tfm/` code which is already inside the Manuel's Docker image)
2. change the directories `VOL_OUT`, `VOL_DAT`, `VOL_WOR`, `VOL_TFM`, `CONFIG`, (maybe `MEMORY`) in the `run.sh` accordingly
   1. You should create the `VOL_OUT` before execution
   2. `CONFIG` refers to `/official/vision/beta/projects/example/example_config_local.yaml` you may want to copy the file to our `htcv22a_repo/configs/experiments/` first
3. Run the `run.sh`
4. You will see the output in `VOL_OUT`
5. I always get this error at the end. I THINK it is ok to ignore it for now.
   ```bash
   Exception ignored in: <function Pool.__del__ at 0x7f328c36b430>
   Traceback (most recent call last):
     File "/usr/lib/python3.8/multiprocessing/pool.py", line 268, in __del__
     File "/usr/lib/python3.8/multiprocessing/queues.py", line 362, in put
   AttributeError: 'NoneType' object has no attribute 'dumps'
   ```