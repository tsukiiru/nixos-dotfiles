#! /usr/bin/env nix-shell
#! nix-shell -i bash -p bash libnotify wf-recorder slurp procps

RECORDING_PATH="$HOME/Videos/"
FILE_NAME="recording_$(date +%F_%H-%M-%s).mkv"
VIDEO_CODEC="libaom-av1"
#AUDIO_CODEC="libopus"

if [ ! -d "$RECORDING_PATH" ]; then
  mkdir "$RECORDING_PATH"
fi

END_PATH=$RECORDING_PATH$FILE_NAME

if pgrep -x wf-recorder > /dev/null; then
  pkill -INT wf-recorder
  notify-send -a "recorder" "stored recording at $END_PATH!"
else
  wf-recorder -g "$(slurp)" -c "$VIDEO_CODEC" --file "$END_PATH" --no-dmabuf &
  notify-send -a "recorder" "started recording!"
fi
