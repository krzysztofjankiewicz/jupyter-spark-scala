Dockerfile based on jupyter/all-spark-notebook:latest with Apache Toree kernel to Scala support

You can create the image as follows

```
docker build -t jupyter-spark-scala:0.1 .
```

then you can create and start the container

```
docker run -p 8888:8888 -p 4040:4040 -p 4041:4041 -e GRANT_SUDO=yes --user root -v $PWD\work:/home/jovyan/work -v $PWD\data:/home/jovyan/data --name jupyter-spark-scala jupyter-spark-scala-11:23.12  
```

User jovyan will be sudoer.
