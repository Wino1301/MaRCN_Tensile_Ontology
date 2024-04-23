# Use an official Python runtime as the base image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Install Jupyter Notebook
RUN pip install jupyterlab
RUN pip install notebook

# Copy the requirements.txt file into the container
COPY requirements.txt /app/requirements.txt

# Install the dependencies listed in the requirements.txt file
RUN pip install --no-cache-dir -r /app/requirements.txt

# Copy the current directory contents into the container at /app
COPY . /app

# Expose the port on which Jupyter Notebook will run
EXPOSE 8888

# Command to run Jupyter Notebook when the container starts
CMD ["jupyter", "notebook", "--ip='*'", "--port=8888", "--no-browser", "--allow-root"]

