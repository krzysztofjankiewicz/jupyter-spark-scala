FROM jupyter/all-spark-notebook:latest

USER root

RUN pip install --upgrade toree && \
    jupyter toree install --spark_home=/usr/local/spark/

RUN mkdir -p /home/jovyan/.local/share/jupyter/runtime && \
    chown -R jovyan:users /home/jovyan/.local/share/jupyter

USER jovyan
