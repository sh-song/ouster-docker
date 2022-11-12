docker run --rm -it \
-v /tmp/.X11-unix:/tmp/.X11-unix:ro \
-v $(pwd)/workspace:/workspace \
-e DISPLAY=unix$DISPLAY \
--net=host \
--privileged \
--name ouster-docker \
ouster-docker
