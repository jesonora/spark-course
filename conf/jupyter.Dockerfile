FROM cluster-base

# -- Layer: JupyterLab

ARG spark_version=3.1.2
ARG jupyter_version=1.0.0

RUN apt-get update -y && \
    apt-get install -y python3-pip && \
    pip3 install wget pyspark==${spark_version} jupyter==${jupyter_version} pandas

ENV SHELL /bin/bash
# -- Runtime

EXPOSE 8888 4040
WORKDIR ${SHARED_WORKSPACE}
CMD jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser --allow-root --NotebookApp.token=