#Using pypi manylinux image
FROM cvalenzu/generic_builder

#Creating jenkins user with 10000 permissions
ENV HOME /home/jenkins
RUN groupadd -g 10000 jenkins
RUN useradd -c "Jenkins user" -d $HOME -u 10000 -g 10000 -m jenkins
RUN chown -R 10000:10000 /opt/conda 

#Creating local conda env
#RUN su - jenkins -c "conda create -n env --clone=/opt/conda"
#RUN su - jenkins -c "echo \"source activate env\" >> /home/jenkins/.bashrc"


