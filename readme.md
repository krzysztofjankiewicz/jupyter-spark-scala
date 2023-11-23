Dockerfile based on jupyter/all-spark-notebook:latest with Apache Toree kernel to Scala support

You can create the image as follows

```
docker build -t jupyter-spark-scala:0.1 .
```

then you can create and start the container

```
docker run -p 8888:8888 --name jupyter-spark-scala jupyter-spark-scala:0.1
```
