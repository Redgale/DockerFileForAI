# Use the official base image (adjust this based on your specific needs)
FROM ubuntu:20.04

# Install necessary dependencies (e.g., curl, Python, etc.)
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    curl

# Set the working directory
WORKDIR /app

# Copy your application files to the container
COPY . /app

# Install Python dependencies if needed (example)
RUN pip3 install -r requirements.txt

# Expose the port your app will run on (adjust this based on your app)
EXPOSE 8000

# Set the default command to run when the container starts
CMD ["python3", "app.py"]
