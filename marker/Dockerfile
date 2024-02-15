FROM dibz15/marker_docker:latest
RUN pip install ray
RUN pip uninstall -y torch torchvision torchaudio
RUN pip3 install torch torchvision
COPY local.env /usr/src/app/marker/marker/local.env
RUN mkdir /.cache && chmod -R 777 /.cache