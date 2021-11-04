# -- Software Stack Version

SPARK_VERSION="3.1.2"
HADOOP_VERSION="3.2"
JUPYTER_VERSION="1.0.0"

echo ${SPARK_VERSION}
echo ${HADOOP_VERSION}
echo ${JUPYTER_VERSION}

# -- Building the Images

docker build \
  -f conf/cluster-base.Dockerfile \
  -t cluster-base .

docker build \
  --build-arg spark_version="${SPARK_VERSION}" \
  --build-arg hadoop_version="${HADOOP_VERSION}" \
  -f conf/spark-base.Dockerfile \
  -t spark-base .

docker build \
  -f conf/spark-master.Dockerfile \
  -t spark-master:1.0.0 .

docker build \
  -f conf/spark-worker.Dockerfile \
  -t spark-worker:1.0.0 .

docker build \
  --build-arg spark_version="${SPARK_VERSION}" \
  --build-arg jupyter_version="${JUPYTER_VERSION}" \
  -f conf/jupyter.Dockerfile \
  -t jupyter:1.0.0 .