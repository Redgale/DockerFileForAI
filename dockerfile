# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements.txt file into the container at /app
COPY requirements.txt /app/requirements.txt

# Install any needed dependencies
RUN pip3 install --no-cache-dir -r /app/requirements.txt

# Copy the current directory contents into the container at /app
COPY . /app

# Expose the port the app will run on (adjust if needed)
EXPOSE 5000

# Command to run the app (adjust if needed)
CMD ["gunicorn", "-b", "0.0.0.0:5000", "app:app"]
