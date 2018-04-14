# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
module load gcc docker slurm

alias ls="ls --color -hGp" # better ls

# docker aliases
alias accio_deep_learning="nvidia-docker run -it -e CUDA_VISIBLE_DEVICES=`echo $CUDA_VISIBLE_DEVICES` -v /home/$USER/:/home/$USER deep_learning"
alias accio_keras_root="nvidia-docker run -it --rm -e CUDA_VISIBLE_DEVICES=`echo $CUDA_VISIBLE_DEVICES` -v /data/datasets:/data/datasets -v /storage2/datasets:/storage2/datasets -v /local:/local -v /home/$USER:/home/$USER -v /storage1:/storage1 -v /home/$USER/.ssh:/root/.ssh -v /home/$USER/.gitconfig:/root/.gitconfig -v /home/$USER/.nanorc:/root/.nanorc madratman/theano_keras_cuda8_cudnn5"
alias accio_keras_root_fake_username="nvidia-docker run -it --rm -e CUDA_VISIBLE_DEVICES=`echo $CUDA_VISIBLE_DEVICES` -e USER=`echo $USER` -v /data/datasets:/data/datasets -v /storage2/datasets:/storage2/datasets -v /local:/local -v /home/$USER:/home/$USER -v /storage1:/storage1 -v /home/$USER/.ssh:/root/.ssh -v /home/$USER/.gitconfig:/root/.gitconfig -v /home/$USER/.nanorc:/root/.nanorc madratman/theano_keras_cuda8_cudnn5"
alias accio_keras_user="nvidia-docker run -it --rm -e CUDA_VISIBLE_DEVICES=`echo $CUDA_VISIBLE_DEVICES` -u $(id -u):$(id -g) -v /data/datasets:/data/datasets -v /home/$USER:/home/$USER madratman/theano_keras_cuda8_cudnn5"
# node request aliases
alias accio_calculon="srun -p dgx  --pty /bin/bash"
alias accio_1_gpu_anywhere="srun -p gpu --gres=gpu:1 --pty /bin/bash"
alias accio_2_gpu_anywhere="srun -p gpu --gres=gpu:2 --pty /bin/bash"
alias accio_3_gpu_anywhere="srun -p gpu --gres=gpu:3 --pty /bin/bash"
alias accio_4_gpu_anywhere="srun -p gpu --gres=gpu:4 --pty /bin/bash"
alias accio_1_gpu_on_bender="srun -p gpu --gres=gpu:1 -w bender --pty /bin/bash"
alias accio_2_gpu_on_bender="srun -p gpu --gres=gpu:2 -w bender --pty /bin/bash"
alias accio_3_gpu_on_bender="srun -p gpu --gres=gpu:3 -w bender --pty /bin/bash"
alias accio_4_gpu_on_bender="srun -p gpu --gres=gpu:4 -w bender --pty /bin/bash"
alias accio_1_gpu_on_clamps="srun -p gpu --gres=gpu:1 -w clamps --pty /bin/bash"
#alias accio_1_gpu_5_cpu_on_clamps="srun -p gpu --gres=gpu:1 --cpus-per-task=5 -w clamps --pty /bin/bash"
alias accio_2_gpu_on_clamps="srun -p gpu --gres=gpu:2 -w clamps --pty /bin/bash"
alias accio_3_gpu_on_clamps="srun -p gpu --gres=gpu:3 -w clamps --pty /bin/bash"
alias accio_4_gpu_on_clamps="srun -p gpu --gres=gpu:4 -w clamps --pty /bin/bash"
alias accio_1_gpu_on_roberto="srun -p gpu --gres=gpu:1 -w roberto --pty /bin/bash"
alias accio_2_gpu_on_roberto="srun -p gpu --gres=gpu:2 -w roberto --pty /bin/bash"
alias accio_3_gpu_on_roberto="srun -p gpu --gres=gpu:3 -w roberto --pty /bin/bash"
alias accio_4_gpu_on_roberto="srun -p gpu --gres=gpu:4 -w roberto --pty /bin/bash"
alias accio_1_gpu_on_calculon="srun -p dgx --gres=gpu:1 --pty /bin/bash"
alias accio_flexo_1="srun -p cpu -w flexo -n 1 --pty /bin/bash"
alias accio_flexo_16="srun -p cpu -w flexo -n 16 --pty /bin/bash"
alias accio_flexo_28="srun -p cpu -w flexo -n 28 --pty /bin/bash"
alias accio_flexo_30="srun -p cpu -w flexo -n 30 --pty /bin/bash"
alias accio_flexo_32="srun -p cpu -w flexo -n 32 --pty /bin/bash"
alias accio_povray_root="docker run -it --rm -v /data/datasets:/data/datasets -v /storage2/datasets:/storage2/datasets -v /local:/local -v /home/$USER:/home/$USER -v /storage1:/storage1 -v /home/$USER/.ssh:/root/.ssh -v /home/$USER/.gitconfig:/root/.gitconfig -v /home/$USER/.nanorc:/root/.nanorc madratman/povray"
alias accio_povray_user="docker run -it --rm -u $(id -u):$(id -g) -v /data/datasets:/data/datasets -v /storage2/datasets:/storage2/datasets -v /local:/local -v /home/$USER:/home/$USER -v /storage1:/storage1 -v /home/$USER/.ssh:/root/.ssh -v /home/$USER/.gitconfig:/root/.gitconfig -v /home/$USER/.nanorc:/root/.nanorc madratman/povray"
#alias docker_delete_dangling="docker rmi -f $(docker images -q -f \'dangling=true\')"
alias run_docker_image="nvidia-docker run -it --rm -e CUDA_VISIBLE_DEVICES=`echo $CUDA_VISIBLE_DEVICES` -v /data/datasets:/data/datasets -v /storage2/datasets:/storage2/datasets -v /local:/local -v /home/$USER:/home/$USER -v /storage1:/storage1 -v /home/$USER/.ssh:/root/.ssh -v /home/$USER/.gitconfig:/root/.gitconfig -v /home/$USER/.nanorc:/root/.nanorc"
alias accio_mavs_dnn2="nvidia-docker run -it --rm -e CUDA_VISIBLE_DEVICES=`echo $CUDA_VISIBLE_DEVICES` -v /data/datasets:/data/datasets -v /storage2/datasets:/storage2/datasets -v /local:/local -v /home/$USER:/home/$USER -v /storage1:/storage1 -v /home/$USER/.ssh:/root/.ssh -v /home/$USER/.gitconfig:/root/.gitconfig -v /home/$USER/.nanorc:/root/.nanorc madratman/mavs_dnn2"
alias accio_mavs_dnn2_cpu="docker run -it --rm -v /data/datasets:/data/datasets -v /storage2/datasets:/storage2/datasets -v /local:/local -v /home/$USER:/home/$USER -v /storage1:/storage1 -v /home/$USER/.ssh:/root/.ssh -v /home/$USER/.gitconfig:/root/.gitconfig -v /home/$USER/.nanorc:/root/.nanorc madratman/mavs_dnn2"
alias accio_mavs_dnn2_composite_iros_cpu="docker run -it --rm -v /data/datasets:/data/datasets -v /storage2/datasets:/storage2/datasets -v /local:/local -v /home/$USER:/home/$USER -v /storage1:/storage1 -v /home/$USER/.ssh:/root/.ssh -v /home/$USER/.gitconfig:/root/.gitconfig -v /home/$USER/.nanorc:/root/.nanorc mavs_dnn_2_composite_iros"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

alias whatsuptrash="ls /home/ratneshm/slurm_test/scripts_py/trash_dirs"
alias lsdirsortsize="du -sh * | sort -h"
alias checkpermissions="getfacl"

#ssh-add ~/.ssh/bitbucket &>/dev/null

alias accio_deeprlhw="nvidia-docker run -it -e CUDA_VISIBLE_DEVICES=`echo $CUDA_VISIBLE_DEVICES` -v /home/ratneshm/:/home/ratneshm -v /data/datasets:/data/datasets madratman/deeprl_hw"
alias run_universe_interactive="docker run --privileged --rm -it -e DOCKER_NET_HOST=172.17.0.1 -v /var/run/docker.sock:/var/run/docker.sock -v /home/ratneshm/projects:/home/ratneshm/projects -v /home/ratneshm/universe:/usr/local/universe madratman/universe"
alias accio_deeprlproject="nvidia-docker run -it --privileged -e DOCKER_NET_HOST=172.17.0.1 -v /home/ratneshm/universe:/usr/local/universe -v /var/run/docker.sock:/var/run/docker.sock -e CUDA_VISIBLE_DEVICES=`echo $CUDA_VISIBLE_DEVICES` -v /home/ratneshm/:/home/ratneshm -v /data/datasets:/data/datasets madratman/deeprlproject"

alias kill_docker_madratman="docker rm -f `docker ps -a | grep madratman | awk '{print $1}'`"


alias accio_pytorch="nvidia-docker run -it --rm --ipc=host -e CUDA_VISIBLE_DEVICES=`echo $CUDA_VISIBLE_DEVICES` -v /data/datasets:/data/datasets -v /storage2/datasets:/storage2/datasets -v /local:/local -v /home/$USER:/home/$USER -v /storage1:/storage1 -v /home/$USER/.ssh:/root/.ssh -v /home/$USER/.gitconfig:/root/.gitconfig -v /home/$USER/.nanorc:/root/.nanorc madratman/mavs_dnn2"
alias accio_ompl="nvidia-docker run -it --rm --ipc=host -e CUDA_VISIBLE_DEVICES=`echo $CUDA_VISIBLE_DEVICES` -v /data/datasets:/data/datasets -v /storage2/datasets:/storage2/datasets -v /local:/local -v /home/$USER:/home/$USER -v /storage1:/storage1 -v /home/$USER/.ssh:/root/.ssh -v /home/$USER/.gitconfig:/root/.gitconfig -v /home/$USER/.nanorc:/root/.nanorc madratman/pytorch_lasagne_keras_tf_ros_ompl"
alias squeue_job="squeue -o \"%.7i %.9P %.100j %.8u %.2t %.10M %.6D %R\""
alias killall_ros=killall_ros_func
alias killall_gazebo=killall_ros_gazebo

function killall_ros_func()
{
        kill -9 $(ps aux | grep ros | awk '{print $2}')
}

function killall_gazebo_func()
{
        kill -9 $(ps aux | grep gazebo | awk '{print $2}');
        kill -9 $(ps aux | grep gz | awk '{print $2}')
}

