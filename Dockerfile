FROM python:3.9.18-slim-bookworm

RUN apt update
RUN apt install -y build-essential
RUN apt install -y curl
RUN apt install -y software-properties-common
RUN apt install -y git
RUN apt install -y python3-launchpadlib
# https://stackoverflow.com/questions/55313610/importerror-libgl-so-1-cannot-open-shared-object-file-no-such-file-or-directo
#RUN apt install -y ffmpeg libsm6 libxext6
RUN apt install -y libgl1
RUN add-apt-repository -y ppa:ubuntugis/ppa && apt update
RUN apt install -y libgdal-dev libgeos-dev
RUN rm -rf /var/lib/apt-get/lists/*

RUN git clone https://github.com/XDynames/SAI-app.git /SAI-app
WORKDIR /SAI-app
RUN rm requirements.txt setup.sh
COPY requirements.txt ./
COPY setup.sh ./

RUN pip3 install --upgrade pip
RUN pip3 install torch==1.11.0
RUN pip3 install torchvision==0.12.0
RUN pip3 install torchaudio==0.11.0
RUN bash setup.sh

EXPOSE 8501
HEALTHCHECK CMD curl --fail http://localhost:8501/_stcore/health
ENTRYPOINT ["streamlit", "run", "main.py", "--server.port=8501", "--server.address=0.0.0.0"]

# Run with option -p 8501:8501
# docker run -p 8501:8501 stoma-ai-app
# Then open web browser and type localhost:8501