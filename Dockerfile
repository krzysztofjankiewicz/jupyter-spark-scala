FROM jupyter/all-spark-notebook:x86_64-spark-3.5.0

USER root

# Zmodyfikuj wersję Javy na 11
RUN apt-get update && \
    apt-get install -y openjdk-11-jdk && \
    update-alternatives --set java /usr/lib/jvm/java-11-openjdk-amd64/bin/java && \
    update-alternatives --set javac /usr/lib/jvm/java-11-openjdk-amd64/bin/javac && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* 

# Ustawienia środowiska Jupyter Toree
RUN pip install setuptools==58.0.4 wheel --upgrade && \
    cd /tmp && \
    curl -O https://archive.apache.org/dist/incubator/toree/0.5.0-incubating/toree-pip/toree-0.5.0.tar.gz && \
    pip install /tmp/toree-0.5.0.tar.gz --no-build-isolation && \
    jupyter toree install --spark_home=/usr/local/spark/ && \
    rm -f /tmp/toree-0.5.0.tar.gz && \
    fix-permissions /opt/conda && \
    fix-permissions /home/$NB_USER
	
USER $NB_UID

# Zainstaluj dodatkowe pakiety Pythona
RUN pip install delta-spark==3.1.0
