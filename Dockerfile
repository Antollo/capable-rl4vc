# Include the base image for the docker
FROM pytorch/pytorch:1.12.0-cuda11.3-cudnn8-devel

# Setting working directory to /opt, rather than doing all the work in root.
# Copying the /code directory into /opt
WORKDIR /opt
COPY . /opt

#RUN python3.8 -m pip install --upgrade pip && \
#    python3.8 -m pip install --no-cache-dir -r /req.txt


# Running pip install to download required packages
RUN apt-get update ##[edited]
RUN pip install -r requirements.txt
RUN pip install jupyter


# Setting the default code to run when a container is launced with this image.
CMD ["jupyter", "notebook", "--port=88899", "--no-browser", "--ip=0.0.0.0", "--allow-root"]