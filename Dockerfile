FROM node:8

WORKDIR /home/Desktop/Smart-Bell/app

COPY . .

RUN npm install

EXPOSE 8080

CMD [ "npm", "start" ]

FROM python:3

ADD usbcamera.py /

RUN pip install bleach==3.1.0
RUN pip install build-utils==0.3.2
RUN pip install certifi==2019.3.9
RUN pip install chardet==3.0.4
RUN pip install Click==7.0
RUN pip install colorama==0.4.1
RUN pip install docutils==0.14
RUN apt-get -y update
RUN apt-get install -y --fix-missing \
    build-essential \
    cmake \
    gfortran \
    git \
    wget \
    curl \
    graphicsmagick \
    libgraphicsmagick1-dev \
    libatlas-dev \
    libavcodec-dev \
    libavformat-dev \
    libgtk2.0-dev \
    libjpeg-dev \
    liblapack-dev \
    libswscale-dev \
    pkg-config \
    python3-dev \
    python3-numpy \
    software-properties-common \
    zip \
    && apt-get clean && rm -rf /tmp/* /var/tmp/*

RUN cd ~ && \
    mkdir -p dlib && \
    git clone -b 'v19.9' --single-branch https://github.com/davisking/dlib.git dlib/ && \
    cd  dlib/ && \
    python3 setup.py install --yes USE_AVX_INSTRUCTIONS

RUN pip install face-recognition==1.2.3
RUN pip install face-recognition-models==0.3.0
RUN pip install fake-rpi==0.6.0
RUN pip install idna==2.8
RUN pip install keyboard==0.13.2
RUN pip install nose==1.3.7
RUN pip install numpy==1.16.2
RUN pip install opencv-python==4.0.0.21
RUN pip install Pillow==5.4.1
RUN pip install pkginfo==1.5.0.1
RUN pip install Pygments==2.3.1
RUN pip install pymongo==3.7.2
RUN pip install pytz==2018.9
RUN pip install readme-renderer==24.0
RUN pip install requests==2.21.0
RUN pip install requests-toolbelt==0.9.1
RUN pip install RPi.GPIO==0.6.5
RUN pip install six==1.12.0
RUN pip install tornado==6.0.1
RUN pip install tqdm==4.31.1
RUN pip install twine==1.13.0
RUN pip install urllib3==1.24.1
RUN pip install webencodings==0.5.1

CMD [ "python", "./usbcamera.py" ]

FROM node:8

WORKDIR /home/Desktop/Smart-Bell/app

COPY . .

RUN npm install 

EXPOSE 3000

CMD [ "npm", "start" ]
