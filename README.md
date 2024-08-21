# comfyui-launcher
 GNU/Linux (Ubuntu 22.04) installer and launcher for [ComfyUI](https://github.com/comfyanonymous/ComfyUI).

 Can be used for running inferences on [Flux.1](https://blackforestlabs.ai/#get-flux) models.


## Installing:
1. Install `TCMalloc` if not yet installed: `sudo apt-get install -y libgoogle-perftools4 libtcmalloc-minimal4`
1. Clone this repo: `git clone https://github.com/inimrod/comfyui-launcher.git comfyui && cd comfyui && chmod +x run.sh`.
1. Run for the first time: `./run.sh`

## Manual Usage
1. Run: `./run.sh`.

## Note on using NF4 models
In order to use the `NF4` format of `Flux.1-dev` model, we need the `CheckpointLoaderNF4` custom node installed.

Before we can install it, we need to change the `security_level` config in `custom_nodes/ComfyUI-Manager/config.ini` to `weak`. This is to allow installing custom nodes from the `dev` channel.
```shell config.ini
# security_level = normal
security_level = weak
```

After this, we can proceed to installing the NF4 loader custom node via the web UI.

Initial install of ComfyUI and ComfyUI-Manager is already done by the `run.sh` here. After launch, access the web UI. Then:

1. Go to "Manager" and in the left column, set `Channel: dev`.
1. Click "Custom Nodes Manager".
1. Search for `ComfyUI_bitsandbytes_NF4 [EXPERIMENTAL]` and install. Then restart ComfyUI.
1. Get back to "Manager" and set `Channel: default`

## Monitoring system resources

Install custom node `Crystools` via the `Manager` in the web UI to get real-time monitoring of system resources - CPU, RAM, GPU, VRAM, Temp, and HDD.