FROM python:3.6-slim

# Install Dependecies
RUN apt update
RUN apt install -y npm
RUN npm install --global http-server
RUN pip3 install Sphinx
RUN pip3 install sphinxawesome-theme
RUN pip3 install sphinx-tabs
RUN apt-get install -y make
RUN pip3 install boto3

# Copy Project
COPY . /

#  Build Python documentation
RUN cd /src && make html
# Expose port
EXPOSE 80

# Run Python documentation with TLS
CMD [ "http-server", "/src/build/html", "-p", "80"]