FROM jupyter/all-spark-notebook:x86_64-spark-3.5.0

USER root

# Zmodyfikuj wersjÄ Javy na 11
RUN apt-get update && \
    apt-get install -y openjdk-11-jdk && \
    update-alternatives --set java /usr/lib/jvm/java-11-openjdk-amd64/bin/java && \
    update-alternatives --set javac /usr/lib/jvm/java-11-openjdk-amd64/bin/javac && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* 

# Ustawienia Ĺrodowiska Jupyter Toree
RUN cd /tmp && \
    curl -O https://archive.apache.org/dist/incubator/toree/0.5.0-incubating/toree-pip/toree-0.5.0.tar.gz && \
    pip install --upgrade setuptools --user && \
    pip install /tmp/toree-0.5.0.tar.gz && \
    jupyter toree install --spark_home=/usr/local/spark/ && \
    rm -f /tmp/toree-0.5.0.tar.gz && \
    fix-permissions /opt/conda && \
    fix-permissions /home/$NB_USER
	
USER $NB_UID

# Zainstaluj dodatkowe pakiety Pythona
RUN mamba install --yes 'delta-spark==3.0.0' && \
    mamba clean --all -f -y
